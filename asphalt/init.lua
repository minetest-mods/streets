--[[
	Streets Mod: All kinds of asphalt
]]
minetest.register_node(":streets:asphalt",{
	description = streets.S("Asphalt"),
	tiles	= {"streets_asphalt.png"},
	groups	= {cracky=3}
})

if minetest.get_modpath("building_blocks") then
	minetest.register_craft({
		type = "shapeless",
	    output = "streets:asphalt 3",
	    recipe = {
			"default:sand",
			"default:gravel",
			"building_blocks:Tar"
	    },
	})
else
	minetest.register_craft({
		type = "cooking",
		output	= "streets:asphalt",
		recipe 	= "default:gravel",
		cooktime = 2
	})
end
