minetest.register_node(":streets:constructionfence_bottom",{
	description = streets.S("Construction fence"),
	tiles = {"streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_bottom.png","streets_fence_bottom.png"},
	groups = {cracky = 2, disable_jump = 1},
	paramtype = "light",
	inventory_image = "streets_fence_inv.png",
	wield_image = "streets_fence_inv.png",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.1,0.5,0.0,0.1},	-- lower part
			{-0.2,-0.0,-0.1,0.2,0.5,0.1}	-- thing in the middle
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.1,0.5,1.0,0.1}
		}
	},
	after_dig_node = function(pos,node,digger)
		pos.y = pos.y + 1
		minetest.remove_node(pos)
	end,
	after_place_node = function(pos,placer,itemstack)
		pos.y = pos.y + 1
		if minetest.get_node(pos).name == "air" then
			minetest.add_node(pos,{name = "streets:constructionfence_top", param2 = minetest.dir_to_facedir(placer:get_look_dir())})
		else
			minetest.chat_send_player(placer:get_player_name(),"Not enough free space! A construction fence has a height of 2 blocks!")
		end
	end
})

minetest.register_node(":streets:constructionfence_top",{
	description = streets.S("Construction fence"),
	tiles = {"streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_fromtop.png","streets_fence_top.png","streets_fence_top.png"},
	groups = {cracky = 2, not_in_creative_inventory = 1, disable_jump = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	drop = "streets:constructionfence_bottom",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.1,0.5,0.0,0.1}		-- upper part
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5,-1.5,-0.1,0.5,0.0,0.1}
		}
	},
	after_dig_node = function(pos,node,digger)
		pos.y = pos.y - 1
		minetest.remove_node(pos)
	end
})

minetest.register_craft({
	output = "streets:constructionfence_bottom 8",
	recipe = {
		{"","",""},
		{"","streets:sign_construction",""},
		{"wool:red","wool:white","wool:red"}
	}
})