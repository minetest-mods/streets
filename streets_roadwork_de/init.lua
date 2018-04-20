local modpath = minetest.get_modpath("streets_roadwork_de")

dofile(modpath .. "/delineators.lua")
dofile(modpath .. "/barriers.lua")

minetest.register_node(":streets:roadwork_de_traffic_cone", {
	description = "Traffic Cone",
	drawtype = "mesh",
	mesh = "streets_roadwork_de_traffic_cone.obj",
	tiles = {
		"streets_roadwork_de_traffic_cone.png",
		"streets_black.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 2, dig_immediate = 2, },
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.3, -0.5, -0.3, 0.3, -0.43, 0.3 },
			{ -0.15, -0.43, -0.15, 0.15, 0.27, 0.15 },
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.3, -0.5, -0.3, 0.3, -0.43, 0.3 },
			{ -0.15, -0.43, -0.15, 0.15, 0.27, 0.15 },
		}
	},
})