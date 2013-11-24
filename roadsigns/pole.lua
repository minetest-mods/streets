--[[
	StreetsMod: Poles and signs
]]
minetest.register_node(":streets:pole_bottom",{
	description = "Pole",
	tiles = {"streets_pole.png"},
	groups = {cracky=2},
	inventory_image = "streets_pole_inv.png",
	wield_image = "streets_pole_inv.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4},
			{-0.125,-0.5,-0.525,0.125,-0.3,-0.375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4}
		}
	},
	after_place_node = function(pos,placer,itemstack)
		pos.y = pos.y +1
		if minetest.get_node(pos).name == "air" then
			minetest.add_node(pos,{name = "streets:pole_top", param2 = minetest.dir_to_facedir(placer:get_look_dir())})
		else
			minetest.chat_send_player(placer:get_player_name(),"Not enough free space! A pole has a height of 2 blocks!")
			pos.y = pos.y -1
			minetest.remove_node(pos)
		end
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		pos.y = pos.y +1
		if minetest.get_node(pos).name == "streets:pole_top" then
			minetest.remove_node(pos)
		end
	end
})

minetest.register_node(":streets:pole_top",{
	description = "Y u no play minetest without cheating?",
	tiles = {"streets_pole.png"},
	groups = {cracky=2,not_in_creative_inventory=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	drop = "",
	can_dig = function()
		return false
	end,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4}
		}
	}
})

minetest.register_craft({
	output = "streets:pole_bottom 3",
	recipe = {
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	}
})