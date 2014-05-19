--[[
	StreetsMod: Steel support for hanging signs on highways etc.
]]
minetest.register_node(":streets:steel_support",{
	description = streets.S("Steel support"),
	tiles = {"streets_support.png"},
	groups = {cracky = 1},
	drawtype = "glasslike_framed",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
})
minetest.register_craft({
	output = "streets:steel_support 5",
	recipe = {
		{"default:steel_ingot","","default:steel_ingot"},
		{"","default:steel_ingot",""},
		{"default:steel_ingot","","default:steel_ingot"}
	}
})