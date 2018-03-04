minetest.register_node("streets:guardrail", {
	description = "Guardrail",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = { "streets_guardrail.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, wall = 1 },
	node_box = {
		type = "connected",
		fixed = {
			{ -0.1, -0.5, -0.1, 0.1, 0.5, 0.1 },
		},
		connect_front = {
			{ 0, -0.1875, -0.5, 0, 0.4375, 0 },
			{ -0.0625, 0.1875, -0.5, 0.0625, 0.3125, 0 },
			{ -0.0625, -0.0625, -0.5, 0.0625, 0.0625, 0 },
		}, -- z-
		connect_back = {
			{ 0, -0.1875, 0, 0, 0.4375, 0.5 },
			{ -0.0625, 0.1875, 0, 0.0625, 0.3125, 0.5 },
			{ -0.0625, -0.0625, 0, 0.0625, 0.0625, 0.5 },
		}, -- z+
		connect_left = {
			{ -0.5, -0.1875, 0, 0, 0.4375, 0 },
			{ -0.5, 0.1875, -0.0625, 0, 0.3125, 0.0625 },
			{ -0.5, -0.0625, -0.0625, 0, 0.0625, 0.0625 },
		}, -- x-
		connect_right = {
			{ 0, -0.1875, 0, 0.5, 0.4375, 0 },
			{ 0, 0.1875, -0.0625, 0.5, 0.3125, 0.0625 },
			{ 0, -0.0625, -0.0625, 0.5, 0.0625, 0.0625 },
		}, -- x+
	},
	connects_to = { "group:wall", "group:stone", "group:wood", "group:tree", "group:concrete" },
	sound = default.node_sound_stone_defaults()
})

minetest.register_craft({
	output = "streets:guardrail 12",
	recipe = {
		{ "streets:bigpole", "default:steel_ingot", "streets:bigpole" },
		{ "streets:bigpole", "default:steel_ingot", "streets:bigpole" }
	}
})
