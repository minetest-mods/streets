minetest.register_node(":streets:fence_crowd_control_barrier", {
	description = "Crowd Control Barrier",
	drawtype = "mesh",
	mesh = "streets_fence_crowd_control_barrier.obj",
	tiles = {
		"streets_fence_crowd_control_barrier.png",
		"streets_metal.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 2, dig_immediate = 2, },
	selection_box = {
		type = "fixed",
		fixed = {
			{ -1, -0.5, -0.3, -15/16, -0.37, 0.3 },
			{ 15/16, -0.5, -0.3, 1, -0.37, 0.3 },
			{ -0.95, -0.37, -1/32, 0.95, 0.65, 1/32 },
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -1, -0.5, -0.3, -15/16, -0.37, 0.3 },
			{ 15/16, -0.5, -0.3, 1, -0.37, 0.3 },
			{ -0.95, -0.37, -1/32, 0.95, 0.65, 1/32 },
		}
	},
})