--[[
	StreetsMod: inDev Trafficlights
]]
minetest.register_node(":streets:bigpole", {
	description = "Pole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -1.15, -0.15, 0.15, 1.15, 0.15}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
		}
	},
	on_place = minetest.rotate_node
})
minetest.register_node(":streets:bigpole_edge", {
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.15,0.15},
			{-0.15,-0.15,-0.125,0.15,0.15,-0.5}
		}
	},
})