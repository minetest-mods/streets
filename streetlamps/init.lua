--[[
	StreetsMod: Streetlamps
]]
minetest.register_node(":streets:streetlamp_basic_bottom",{
	description = "Street lamp",
	tiles = {"streets_lamps_basic_bottom.png"},
	groups = {cracky = 1},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.4,0.15},
			{-0.1,0.4,-0.1,0.1,0.5,0.1}
		}
	},
	after_place_node = function(pos,placer,itemstack)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "streets:streetlamp_basic_middle"})
		minetest.set_node({x = pos.x, y = pos.y + 2, z = pos.z},{name = "streets:streetlamp_basic_top_off"})
	end,
	mesecons = {
		effector = {
			action_on = function(pos,node)
				minetest.set_node({x = pos.x, y = pos.y + 2, z = pos.z},{name = "streets:streetlamp_basic_top_on"})
			end,
			action_off = function(pos,node)
				minetest.set_node({x = pos.x, y = pos.y + 2, z = pos.z},{name = "streets:streetlamp_basic_top_off"})
			end
		}
	}
})
minetest.register_node(":streets:streetlamp_basic_middle",{
	description = "U cheater U",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	tiles = {"streets_lamps_basic_middle.png"},
	paramtype = "light",
	drawtype = "nodebox",
	pointable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.1,0.1,0.5,0.1}
		}
	}
})
minetest.register_node(":streets:streetlamp_basic_top_off",{
	description = "U cheater U",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	drawtype = "nodebox",
	pointable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.1,0.1,-0.4,0.1},
			{-0.3,-0.4,-0.3,0.3,0.5,0.3}
		}
	}
})
minetest.register_node(":streets:streetlamp_basic_top_on",{
	description = "U cheater U",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	tiles = {"streets_lamps_basic_top_top.png","streets_lamps_basic_top.png"},
	paramtype = "light",
	drawtype = "nodebox",
	pointable = false,
	light_source = 10,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.1,0.1,-0.4,0.1},
			{-0.3,-0.4,-0.3,0.3,0.5,0.3}
		}
	}
})