streets.trafficlights = {}

streets.trafficlights.registered_trafficlights = {}

streets.trafficlights.get_trafficlight_definition = function(name)
	local def = streets.trafficlights.registered_trafficlights[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.trafficlights.register_trafficlight = function(def)
	if not minetest.get_modpath("digilines") then
		return
	end
	if def.hybrid then
		def.aspects = 3
	end
	if type(def.aspects) ~= "number" or def.aspects < 1 or def.aspects > 5 then
		return
	end

	streets.trafficlights.registered_trafficlights[def.name] = def

	if not def.phases.off then
		def.phases.off = {}
	end
	def.drop = "streets:trafficlight_" .. def.name .. "__off"
	def.drawtype = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.groups = { snappy = 2, dig_immediate = 2, }
	def.light_source = 3
	def.digiline = {
		receptor = {},
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 }
			}
		},
		effector = {
			action = function(pos, node, channel, msg)
				local setchan = minetest.get_meta(pos):get_string("channel")
				if setchan ~= channel then
					return
				end
				if type(msg) ~= "string" then
					return
				end
				local name = minetest.get_node(pos).name:gsub("__([a-zA-Z0-9_]+)$", "__")
				msg = string.lower(msg)
				if minetest.registered_nodes[name .. msg] then
					minetest.swap_node(pos, {
						name = name .. msg,
						param1 = minetest.get_node(pos).param1,
						param2 = minetest.get_node(pos).param2,
					})
				end
			end
		}
	}
	def.on_receive_fields = function(pos, formname, fields, sender)
		if not sender then
			return
		end
		local player_name = sender:get_player_name()
		if minetest.is_protected(pos, player_name) and not minetest.check_player_privs(player_name, { protection_bypass = true }) then
			minetest.record_protection_violation(pos, player_name)
			return false
		end
		if type(fields.channel) == "string" then
			local meta = minetest:get_meta(pos)
			meta:set_string("channel", fields.channel)
			meta:set_string("formspec", "field[channel;Channel;${channel}]")
			local newmeta = minetest.get_meta(pos)
			newmeta:from_table(meta:to_table())
		end
	end
	def.on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end
	if def.aspects == 1 then
		def.horizontal = false
	end
	if def.hybrid then
		def.mesh = "streets_trafficlight_hybrid.obj"
		def.selection_box = {
			type = "fixed",
			fixed = { -0.55, -0.38125, 0.6, 0.55, 0.38125, 0.85 }
		}
		def.collision_box = {
			type = "fixed",
			fixed = { -0.55, -0.38125, 0.6, 0.55, 0.38125, 0.85 }
		}
	else
		def.mesh = "streets_trafficlight_" .. def.aspects .. "_aspects" .. (def.horizontal and "_h" or "") .. ".obj"
		local half_height = def.aspects == 1 and 0.2 or (3/20 + def.aspects * 0.35)/2
		if def.horizontal then
			def.selection_box = {
				type = "fixed",
				fixed = { -half_height, -3/16, 0.6, half_height, 3/16, 0.85 }
			}
			def.collision_box = {
				type = "fixed",
				fixed = { -half_height, -3/16, 0.6, half_height, 3/16, 0.85 }
			}
		else
			def.selection_box = {
				type = "fixed",
				fixed = { -3/16, -half_height, 0.6, 3/16, half_height, 0.85 }
			}
			def.collision_box = {
				type = "fixed",
				fixed = { -3/16, -half_height, 0.6, 3/16, half_height, 0.85 }
			}
		end
	end

	def.tiles = {
		"streets_black.png",
	}
	for phase_name, phase_def in pairs(def.phases) do
		local d = table.copy(def)
		d.groups.not_in_creative_inventory = (phase_name ~= "off") and 1 or 0
		for i = 1, def.aspects do
			table.insert(d.tiles, 1, phase_def["aspect_" .. i] or def.default["aspect_" .. i])
		end
		minetest.register_node(":streets:trafficlight_" .. def.name .. "__" .. phase_name, d)
	end
end

--"streets_trafficlight_green_off.png^[resize:32x32^(streets_pedestrian.png^[mask:streets_trafficlight_green_on.png\\^[resize\\:32x32)",