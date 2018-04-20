local register_barrier = function(name, def)
	def.drawtype = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.groups = { snappy = 2, dig_immediate = 2, }
	def.selection_box = {
		type = "fixed",
		fixed = {
			{ -1.2, -0.5, -0.4, -0.8, -0.375, 0.4 },
			{ 0.8, -0.5, -0.4, 1.2, -0.375, 0.4 },
			{ -0.95, -0.375, -1/32, 0.95, 0.55, 1/32 },
		}
	}
	def.collision_box = {
		type = "fixed",
		fixed = {
			{ -1.2, -0.5, -0.4, -0.8, -0.375, 0.4 },
			{ 0.8, -0.5, -0.4, 1.2, -0.375, 0.4 },
			{ -0.95, -0.375, -1/32, 0.95, 0.55, 1/32 },
		}
	}
	local modes = {
		_on = " (On)",
		_off = " (Off)",
		_flashing = " (Flashing)",
	}
	for mode_name, mode_description in pairs(modes) do
		local d = table.copy(def)
		d.description = d.description .. mode_description
		d.light_source = (mode_name ~= "_off" and 5)
		d.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("channel", "warninglight")
			meta:set_string("formspec", "size[5,3]label[0.5,0.5;Shift-click the barrier to switch mode.]field[0.5,2.3;3,1;channel;Digilines Channel;${channel}]button[3,2;1.5,1;ok;OK]")
		end
		d.digiline = {
			receptor = {},
			wire = {
				rules = {
					{ x = 0, y = 0, z = -1 },
					{ x = 0, y = 0, z = 1 },
					{ x = 1, y = 0, z = 0 },
					{ x = -1, y = 0, z = 0 },
					{ x = 0, y = -1, z = 0 },
					{ x = 0, y = 1, z = 0 },
					{ x = 0, y = 0, z = -2 },
					{ x = 0, y = 0, z = 2 },
					{ x = 2, y = 0, z = 0 },
					{ x = -2, y = 0, z = 0 },
					{ x = 0, y = 2, z = 0 },
					{ x = 0, y = -2, z = 0 },
					{ x = 0, y = 1, z = -1 },
					{ x = 0, y = 1, z = 1 },
					{ x = 1, y = 1, z = 0 },
					{ x = -1, y = 1, z = 0 },
					{ x = 0, y = 2, z = -1 },
					{ x = 0, y = 2, z = 1 },
					{ x = 1, y = 2, z = 0 },
					{ x = -1, y = 2, z = 0 },
					{ x = 1, y = 0, z = -1 },
					{ x = 1, y = 0, z = 1 },
					{ x = -1, y = 0, z = 1 },
					{ x = -1, y = 0, z = -1 },
				}
			},
			effector = {
				action = function(pos, node, channel, msg)
					local setchan = minetest.get_meta(pos):get_string("channel")
					if setchan ~= channel or type(msg) ~= "string" then
						return
					end
					streets.helpers.handle_change(pos, msg)
				end
			}
		}
		d.on_receive_fields = function(pos, formname, fields, sender)
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
				meta:set_string("formspec", "size[5,3]label[0.5,0.5;Shift-click the delineator to barrier mode.]field[0.5,2.3;3,1;channel;Digilines Channel;${channel}]button[3,2;1.5,1;ok;OK]")
				local newmeta = minetest.get_meta(pos)
				newmeta:from_table(meta:to_table())
			end
		end
		d.on_punch = function(pos, node, puncher, pointed_thing)
			local mode_to_int = { flashing = 1, on = 2, off = 3 }
			local int_to_mode = { "flashing", "on", "off", "flashing" }
			if not ( puncher and puncher:get_player_control().sneak ) then
				return
			end
			local player_name = puncher:get_player_name()
			if minetest.is_protected(pos, player_name) and not minetest.check_player_privs(player_name, { protection_bypass = true }) then
				minetest.record_protection_violation(pos, player_name)
				return false
			end
			local mode = node.name:match("_([a-z]*)$"):lower()
			streets.helpers.handle_change(pos, int_to_mode[mode_to_int[mode] + 1])
		end
		d.lense_tex = d.lense_tex .. mode_name .. ".png"
		if mode_name == "_flashing" then
			d.lense_tex = {
				name = d.lense_tex,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				}
			}
		end
		d.tiles = {
			"streets_pole.png",
			"streets_black.png",
			"streets_pole.png^streets_roadwork_de_traffic_barrier.png",
		}
		table.insert(d.tiles, 1, "streets_warninglight_body_yellow.png")
		if d.two_lenses then
			table.insert(d.tiles, 1, d.lense_tex)
		end
		table.insert(d.tiles, 1, d.lense_tex)
		minetest.register_node(name .. mode_name, d)
	end
end

minetest.register_node(":streets:roadwork_de_traffic_barrier", {
	description = "Traffic Barrier",
	drawtype = "mesh",
	mesh = "streets_roadwork_de_traffic_barrier.obj",
	tiles = {
		"streets_pole.png",
		"streets_black.png",
		"streets_pole.png^streets_roadwork_de_traffic_barrier.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 2, dig_immediate = 2, },
	selection_box = {
		type = "fixed",
		fixed = {
			{ -1.2, -0.5, -0.4, -0.8, -0.375, 0.4 },
			{ 0.8, -0.5, -0.4, 1.2, -0.375, 0.4 },
			{ -0.95, -0.375, -1/32, 0.95, 0.55, 1/32 },
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -1.2, -0.5, -0.4, -0.8, -0.375, 0.4 },
			{ 0.8, -0.5, -0.4, 1.2, -0.375, 0.4 },
			{ -0.95, -0.375, -1/32, 0.95, 0.55, 1/32 },
		}
	},
})

register_barrier(":streets:roadwork_de_traffic_barrier_wl_3_yellow", {
	description = "Traffic Barrier with 3 Yellow Warning Lights",
	mesh = "streets_roadwork_de_traffic_barrier_wl_3.obj",
	lense_tex = "streets_warninglight_lense_yellow",
})

register_barrier(":streets:roadwork_de_traffic_barrier_wl_3_red", {
	description = "Traffic Barrier with 3 Red Warning Lights",
	mesh = "streets_roadwork_de_traffic_barrier_wl_3.obj",
	lense_tex = "streets_warninglight_lense_red",
})

register_barrier(":streets:roadwork_de_traffic_barrier_wl_5_red", {
	description = "Traffic Barrier with 5 Red Warning Lights",
	mesh = "streets_roadwork_de_traffic_barrier_wl_5.obj",
	lense_tex = "streets_warninglight_lense_red",
})