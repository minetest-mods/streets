minetest.register_node(":streets:fence_construction_fence", {
	description = "Construction Site Fence",
	drawtype = "mesh",
	mesh = "streets_fence_construction_fence.obj",
	tiles = {
		"streets_fence_construction_fence.png",
		"streets_metal.png",
		"streets_concrete.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 2, dig_immediate = 2, },
	selection_box = {
		type = "fixed",
		fixed = {
			{ -1.13, -0.5, -0.3, -0.87, -0.37, 0.3 },
			{ 0.87, -0.5, -0.3, 1.13, -0.37, 0.3 },
			{ -0.95, -0.37, -1/32, 0.95, 1.3, 1/32 },
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -1.13, -0.5, -0.3, -0.87, -0.37, 0.3 },
			{ 0.87, -0.5, -0.3, 1.13, -0.37, 0.3 },
			{ -0.95, -0.37, -1/32, 0.95, 1.3, 1/32 },
		}
	},
})