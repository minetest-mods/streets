--[[
	Streets Mod: All kinds of asphalt
]]
minetest.register_node(":streets:asphalt",{
	description = streets.S("Asphalt"),
	tiles	= {"streets_asphalt.png"},
	groups	= {cracky=3}
})

-- different recipes for different mods. Unfortinnaly moreblocks tar and building_blocks tar have different names (tar and Tar). For better readability I divide recipes.
local recipe_list={
	building_blocks={
				"default:sand",
				"default:gravel",
				"building_blocks:Tar"
	},
	moreblocks={
				"default:sand",
				"default:gravel",
				"moreblocks:tar"
	},
}

for mod, mod_recipe in pairs(recipe_list) do
	if minetest.get_modpath(mod) then
		minetest.register_craft({
				type = "shapeless",
				output = "streets:asphalt 3",
				recipe = mod_recipe,
			})
	recipe_list.registred = 1
	end
end

if not recipe_list.registred then
	minetest.register_craft({
		type = "cooking",
		output	= "streets:asphalt",
		recipe 	= "default:gravel",
		cooktime = 2
	})
end
