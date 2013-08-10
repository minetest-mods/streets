--[[
	Streets Mod: All kinds of asphalt
]]
minetest.register_node(":streets:asphalt",{
	description	= "Asphalt",
	tiles	= {"streets_asphalt.png"},
	groups	= {cracky=3}
})

minetest.register_craft({
	type = "cooking",
	output	= "streets:asphalt",
	recipe 	= "default:gravel",
	cooktime = 2
})