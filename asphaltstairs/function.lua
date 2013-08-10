-- StreetsMod needs a special slab definition, so it needs its own register_stair_and_slab
streets.register_stair_and_slab = function(node,desc,tile,item)
	minetest.register_node(":streets:"..node.."_stair",{
	description = desc.."stair",
	groups = {cracky = 3},
	tiles = tile,
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			{-0.5, 0, 0, 0.5, 0.5, 0.5}
		}
	}
	})
	minetest.register_node(":streets:"..node.."_slab",{
	description = desc.." slab",
	groups = {cracky = 3},
	tiles = tile,
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		}
	}
	})
	minetest.register_craft({
		output = "streets:"..node.."_stair 4",
		recipe = {
			{"","",item},
			{"",item,item},
			{item,item,item}
		}
	})
	minetest.register_craft({
		output = "streets:"..node.."_stair 4",
		recipe = {
			{item,"",""},
			{item,item,""},
			{item,item,item}
		}
	})
	minetest.register_craft({
		output = "streets:"..node.."_slab 3",
		recipe = {
			{"","",""},
			{"","",""},
			{item,item,item}
		}
	})
end