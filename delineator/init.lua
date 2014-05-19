--[[
	StreetsMod: Delineator
]]
minetest.register_node(":streets:delineator", {
	description = streets.S("Delineator"),
	tiles = {"streets_delineator_top.png","streets_delineator.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {cracky=3, oddly_breakable_by_hand=2},
	light_source = 8,
	sunlight_propagates = true,
	node_box = {
			type = "fixed",
			fixed = {
				{-0.1, -0.5, -0.1, 0.1, 0.5, 0.1},
			},
	}
})

minetest.register_craft({
	output = "streets:delineator 4",
	recipe = {
		{"","",""},
		{"","default:torch",""},
		{"","default:fence_wood",""}
	}
})