minetest.register_node(":streets:barrier_reflector_top", {
	description = "Barrier Reflector (Top)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {
		"streets_signs_back.png",
		"streets_signs_back.png",
		"streets_signs_back.png",
		"streets_signs_back.png",
		"streets_signs_back.png^streets_reflector_top.png",
		"streets_signs_back.png^streets_reflector_top.png",
	},
	sunlight_propagates = true,
	light_source = 3,
	groups = { snappy = 2, dig_immediate = 2, },
	node_box = {
		type = "fixed",
		fixed = {
			{ -5/64, -0.5, -1/128, 5/64, -21/64, 1/128 },
			{ -5/64, -0.5, -1/8, 5/64, -31/64, 1/8 },
		},
	},
	sound = default.node_sound_stone_defaults(),
})

local digiline_def = {
	wire = {
		rules = {
			{ x = 0, y = 0, z = -1 },
			{ x = 0, y = 0, z = 1 },
			{ x = 1, y = 0, z = 0 },
			{ x = -1, y = 0, z = 0 },
			{ x = 0, y = -1, z = 0 },
			{ x = 0, y = 1, z = 0 },
		}
	}
}

minetest.register_node(":streets:concrete_wall_straight_with_reflectors", {
	description = "Concrete Wall (Top)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {
		streets.concrete.texture,
		streets.concrete.texture,
		streets.concrete.texture .. "^streets_reflector_side.png",
		streets.concrete.texture .. "^streets_reflector_side.png",
		streets.concrete.texture,
		streets.concrete.texture,
	},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.35, 0.5, -0.4, 0.35 },
			{ -0.5, -0.5, -0.15, 0.5, 0.5, 0.15 },
			{ -1/128, 0, -0.25, 1/128, 1/8, 0.25},
		},
	},
	connect_sides = { "left", "right" },
	sound = default.node_sound_stone_defaults(),
	digiline = digiline_def,
})

minetest.register_node(":streets:concrete_wall_top_straight_with_reflectors", {
	description = "Concrete Wall (Straight Top)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {
		streets.concrete.texture,
		streets.concrete.texture,
		streets.concrete.texture .. "^streets_reflector_side.png",
		streets.concrete.texture .. "^streets_reflector_side.png",
		streets.concrete.texture,
		streets.concrete.texture,
	},
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.15, 0.5, 0.5, 0.15 },
			{ -1/128, 0, -0.25, 1/128, 1/8, 0.25},
		},
	},
	connect_sides = { "left", "right" },
	sound = default.node_sound_stone_defaults(),
	digiline = digiline_def,
})
