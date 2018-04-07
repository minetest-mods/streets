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

minetest.register_node(":streets:concrete_wall", {
	description = "Concrete Wall",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = { streets.concrete.texture },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "connected",
		fixed = { { -0.35, -0.5, -0.35, 0.35, -0.4, 0.35 }, { -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 } },
		connect_front = { { -0.35, -0.5, -0.5, 0.35, -0.4, 0.35 }, { -0.15, -0.5, -0.5, 0.15, 0.5, 0.15 } }, -- z-
		connect_back = { { -0.35, -0.5, -0.35, 0.35, -0.4, 0.5 }, { -0.15, -0.5, -0.15, 0.15, 0.5, 0.5 } }, -- z+
		connect_left = { { -0.5, -0.5, -0.35, 0.35, -0.4, 0.35 }, { -0.5, -0.5, -0.15, 0.15, 0.5, 0.15 } }, -- x-
		connect_right = { { -0.35, -0.5, -0.35, 0.5, -0.4, 0.35 }, { -0.15, -0.5, -0.15, 0.5, 0.5, 0.15 } }, -- x+
	},
	connects_to = { "group:wall", "group:stone", "group:wood", "group:tree", "group:concrete" },
	sound = default.node_sound_stone_defaults(),
	digiline = digiline_def,
})


minetest.register_craft({
	output = "streets:concrete_wall 5",
	recipe = {
		{ "", "streets:concrete", "" },
		{ "", "streets:concrete", "" },
		{ "streets:concrete", "streets:concrete", "streets:concrete" },
	}
})

minetest.register_node(":streets:concrete_wall_straight", {
	description = "Concrete Wall (Top)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { streets.concrete.texture },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.35, 0.5, -0.4, 0.35 },
			{ -0.5, -0.5, -0.15, 0.5, 0.5, 0.15 },
		},
	},
	connect_sides = { "left", "right" },
	sound = default.node_sound_stone_defaults(),
	digiline = digiline_def,
})


minetest.register_craft({
	output = "streets:concrete_wall_straight 2",
	recipe = {
		{ "streets:concrete_wall", "streets:concrete_wall"},
	}
})


minetest.register_node(":streets:concrete_wall_top", {
	description = "Concrete Wall",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = { streets.concrete.texture },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "connected",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
		connect_front = { -0.15, -0.5, -0.5, 0.15, 0.5, 0.15 }, -- z-
		connect_back = { -0.15, -0.5, -0.15, 0.15, 0.5, 0.5 }, -- z+
		connect_left = { -0.5, -0.5, -0.15, 0.15, 0.5, 0.15 }, -- x-
		connect_right = { -0.15, -0.5, -0.15, 0.5, 0.5, 0.15 }, -- x+
	},
	connects_to = { "group:wall", "group:stone", "group:wood", "group:tree", "group:concrete" },
	sound = default.node_sound_stone_defaults(),
	digiline = digiline_def,
})

minetest.register_craft({
	output = "streets:concrete_wall_top 2",
	recipe = {
		{ "streets:concrete_wall" },
		{ "streets:concrete_wall"},
	}
})

minetest.register_node(":streets:concrete_wall_top_straight", {
	description = "Concrete Wall (Straight Top)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { streets.concrete.texture },
	sunlight_propagates = true,
	groups = { cracky = 1, level = 2, wall = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.5, -0.5, -0.15, 0.5, 0.5, 0.15 },
		},
	},
	connect_sides = { "left", "right" },
	sound = default.node_sound_stone_defaults(),
	digiline = digiline_def,
})

minetest.register_craft({
	output = "streets:concrete_wall_top_straight 2",
	recipe = {
		{ "streets:concrete_wall_straight" },
		{ "streets:concrete_wall_straight"},
	}
})
