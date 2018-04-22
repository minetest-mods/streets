local register_delineator = function(name, def)
	def.drawtype = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.description = "Roadwork Delineator " .. def.description
	def.groups = { snappy = 2, dig_immediate = 2, }
	def.selection_box = {
		type = "fixed",
		fixed = {
			{ -0.2, -0.5, -0.4, 0.2, -0.375, 0.4 },
			{ -5/32, -0.375, -1/32, 5/32, 0.8125, 1/32 },
		}
	}
	def.collision_box = {
		type = "fixed",
		fixed = {
			{ -0.2, -0.5, -0.4, 0.2, -0.375, 0.4 },
			{ -5/32, -0.375, -1/32, 5/32, 0.8125, 1/32 },
		}
	}
	local modes = {
		_on = " with Warning Light (On)",
		_off = " with Warning Light (Off)",
		_flashing = " with Warning Light (Flashing)",
	}
	modes[""] = ""
	for mode_name, mode_description in pairs(modes) do
		local d = table.copy(def)
		d.description = d.description .. mode_description
		if mode_name ~= "" then
			d.groups.not_in_creative_inventory = (mode_name ~= "_off") and 1 or 0
			d.light_source = (mode_name ~= "_off" and 5)
			d.mesh = d.mesh_light
			d.on_construct = function(pos)
				local meta = minetest.get_meta(pos)
				meta:set_string("channel", "warninglight")
				meta:set_string("formspec", "size[5,3]label[0.5,0.5;Shift-click the delineator to switch mode.]field[0.5,2.3;3,1;channel;Digilines Channel;${channel}]button[3,2;1.5,1;ok;OK]")
			end
			d.digiline = {
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
					meta:set_string("formspec", "size[5,3]label[0.5,0.5;Shift-click the delineator to switch mode.]field[0.5,2.3;3,1;channel;Digilines Channel;${channel}]button[3,2;1.5,1;ok;OK]")
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
				streets.helpers.handle_wl_change(pos, int_to_mode[mode_to_int[mode] + 1])
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
			table.insert(d.tiles, "streets_warninglight_body_yellow.png")
			if d.two_lenses then
				table.insert(d.tiles, d.lense_tex)
			end
			table.insert(d.tiles, d.lense_tex)
		end
		minetest.register_node(name .. mode_name, d)
	end
end

register_delineator(":streets:roadwork_de_delineator_ll", {
	description = "Left-Pointing (Two-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_two_sided.obj",
	tiles = {
		"streets_roadwork_de_delineator_ll.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
	two_lenses = true,
})

register_delineator(":streets:roadwork_de_delineator_rr", {
	description = "Right-Pointing (Two-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_two_sided.obj",
	tiles = {
		"streets_roadwork_de_delineator_rr.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
	two_lenses = true,
})

register_delineator(":streets:roadwork_de_delineator_lr", {
	description = "Left/Right-Pointing (Two-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_two_sided.obj",
	tiles = {
		"streets_roadwork_de_delineator_lr.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
	two_lenses = true,
})

register_delineator(":streets:roadwork_de_delineator_l", {
	description = "Left-Pointing (One-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_one_sided.obj",
	tiles = {
		"streets_pole.png^streets_roadwork_de_delineator_l.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
})

register_delineator(":streets:roadwork_de_delineator_r", {
	description = "Right-Pointing (One-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_one_sided.obj",
	tiles = {
		"streets_pole.png^streets_roadwork_de_delineator_r.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
})

register_delineator(":streets:roadwork_de_delineator_p", {
	description = " for Pedestrians",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_omnidirectional.obj",
	tiles = {
		"streets_roadwork_de_delineator_p.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_omnidirectional",
})

register_delineator(":streets:roadwork_de_delineator_all", {
	description = "Arrow Left-Pointing (Two-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_two_sided.obj",
	tiles = {
		"streets_roadwork_de_delineator_all.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
	two_lenses = true,
})

register_delineator(":streets:roadwork_de_delineator_arr", {
	description = "Arrow Right-Pointing (Two-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_two_sided.obj",
	tiles = {
		"streets_roadwork_de_delineator_arr.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
	two_lenses = true,
})

register_delineator(":streets:roadwork_de_delineator_alr", {
	description = "Arrow Left/Right-Pointing (Two-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_two_sided.obj",
	tiles = {
		"streets_roadwork_de_delineator_alr.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
	two_lenses = true,
})

register_delineator(":streets:roadwork_de_delineator_al", {
	description = "Arrow Left-Pointing (One-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_one_sided.obj",
	tiles = {
		"streets_pole.png^streets_roadwork_de_delineator_al.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
})

register_delineator(":streets:roadwork_de_delineator_ar", {
	description = "Arrow Right-Pointing (One-Sided)",
	mesh = "streets_roadwork_de_delineator.obj",
	mesh_light = "streets_roadwork_de_delineator_with_warninglight_one_sided.obj",
	tiles = {
		"streets_pole.png^streets_roadwork_de_delineator_ar.png",
		"streets_pole.png",
		"streets_black.png",
	},
	lense_tex = "streets_warninglight_lense_yellow",
})