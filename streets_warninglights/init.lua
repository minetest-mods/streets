local register_warninglight = function(name, def)
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.drawtype = "mesh"
	def.on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("channel", "warninglight")
		meta:set_string("formspec", "size[5,3]label[0.5,0.5;Shift-click the light to switch mode.]field[0.5,2.3;3,1;channel;Digilines Channel;${channel}]button[3,2;1.5,1;ok;OK]")
	end
	def.digiline = {
		receptor = {},
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1},
				{ x = 1, y = 0, z = 0},
				{ x = -1, y = 0, z = 0},
				{ x = 0, y = 0, z = 1},
				{ x = 1, y = 1, z = 0},
				{ x = 1, y = -1, z = 0},
				{ x = -1, y = 1, z = 0},
				{ x = -1, y = -1, z = 0},
				{ x = 0, y = 1, z = 1},
				{ x = 0, y = -1, z = 1},
				{ x = 0, y = 1, z = -1},
				{ x = 0, y = -1, z = -1},
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = -2, z = 0 },
				{ x = 0, y = -2, z = -1 },
				{ x = 0, y = -2, z = 1 },
				{ x = 1, y = -2, z = 0 },
				{ x = -1, y = -2, z = 0 },
			}
		},
		effector = {
			action = function(pos, node, channel, msg)
				local setchan = minetest.get_meta(pos):get_string("channel")
				if setchan ~= channel or type(msg) ~= "string" then
					return
				end
				streets.helpers.handle_wl_change(pos, msg)
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
			meta:set_string("formspec", "size[5,3]label[0.5,0.5;Shift-click the light to switch mode.]field[0.5,2.3;3,1;channel;Digilines Channel;${channel}]button[3,2;1.5,1;ok;OK]")
			local newmeta = minetest.get_meta(pos)
			newmeta:from_table(meta:to_table())
		end
	end
	def.on_punch = function(pos, node, puncher, pointed_thing)
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
		streets.helpers.handle_wl_change(pos, int_to_mode[mode_to_int[mode] + 1])
	end
	minetest.register_node(name, def)
end

for mode_name, mode_description in pairs({ on = "On", off = "Off", flashing = "Flashing" }) do
	for side_name, side_description in pairs({ one_sided = "One-Sided", two_sided = "Two-Sided" }) do
		for color_name, color_description in pairs({ red = "Red", yellow = "Yellow"}) do
			local tiles = {}
			local lense_tex = "streets_warninglight_lense_" .. color_name .. "_" .. mode_name .. ".png"
			if mode_name == "flashing" then
				lense_tex = {
					name = lense_tex,
					animation = {
						type = "vertical_frames",
						aspect_w = 16,
						aspect_h = 16,
						length = 2.0,
					}
				}
			end
			if side_name == "two_sided" then
				table.insert(tiles, lense_tex)
			end
			table.insert(tiles, lense_tex)
			table.insert(tiles, "streets_warninglight_body_yellow.png")
			register_warninglight(":streets:warninglight_" .. side_name .. "_" .. color_name .. "_" .. mode_name, {
				description = side_description .. " Warning Light " .. color_description .. " (" .. mode_description .. ")",
				mesh = "streets_warninglight_" .. side_name .. ".obj",
				tiles = tiles,
				light_source = (mode_name ~= "off" and 5),
				selection_box = {
					type = "fixed",
					fixed = {
						{ -0.1, -0.5, -0.05, 0.2, -0.15, 0.05 }
					}
				},
				collision_box = {
					type = "fixed",
					fixed = {
						{ -0.1, -0.5, -0.05, 0.2, -0.15, 0.05 }
					}
				},
				groups = { snappy = 2, dig_immediate = 2, not_in_creative_inventory = (mode_name ~= "off") and 1 or 0 }
			})
		end
	end
	local tiles = {}
	local lense_tex = "streets_warninglight_lense_directional_" .. mode_name .. ".png"
	if mode_name == "flashing" then
		lense_tex = {
			name = lense_tex,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			}
		}
	end
	table.insert(tiles, lense_tex)
	table.insert(tiles, "streets_warninglight_body_red.png")
	register_warninglight(":streets:warninglight_directional_" .. mode_name, {
		description = "Directional Warning Light (" .. mode_description .. ")",
		mesh = "streets_warninglight_directional.obj",
		tiles = tiles,
		light_source = (mode_name ~= "off" and 7),
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.3, -0.3, 0.4, 0.3, 0.3, 0.85 }
			}
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{ -0.3, -0.3, 0.4, 0.3, 0.3, 0.85 }
			}
		},
		groups = { snappy = 2, dig_immediate = 2, not_in_creative_inventory = (mode_name ~= "off") and 1 or 0 }
	})
	local tiles = {}
	local lense_tex = "streets_warninglight_lense_omnidirectional_" .. mode_name .. ".png"
	if mode_name == "flashing" then
		lense_tex = {
			name = lense_tex,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			}
		}
	end
	table.insert(tiles, lense_tex)
	table.insert(tiles, "streets_warninglight_body_yellow.png")
	register_warninglight(":streets:warninglight_omnidirectional_" .. mode_name, {
		description = "Omnidirectional Warning Light (" .. mode_description .. ")",
		mesh = "streets_warninglight_omnidirectional.obj",
		tiles = tiles,
		light_source = (mode_name ~= "off" and 5),
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.07, -0.5, -0.07, 0.07, 0, 0.07 }
			}
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{ -0.07, -0.5, -0.07, 0.07, 0, 0.07 }
			}
		},
		groups = { snappy = 2, dig_immediate = 2, not_in_creative_inventory = (mode_name ~= "off") and 1 or 0 }
	})
end