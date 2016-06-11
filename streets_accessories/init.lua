--[[
	## StreetsMod 2.0 ##
	Submod: accessories
	Optional: true
]]

minetest.register_node(":streets:delineator", {
	description = "Delineator",
	tiles = {"streets_delineator_top.png", "streets_delineator_top.png", "streets_delineator_right.png", "streets_delineator_left.png", "streets_delineator_back.png", "streets_delineator_front.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 2},
	light_source = 2,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.0625, 0.125, 0.4375, 0.0625}, -- Body
			{0, 0.4375, -0.0625, 0.125, 0.5, 0.0625}, -- Top
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.0625, 0.125, 0.5, 0.0625}, -- Body
		}
	}
})
