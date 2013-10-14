--[[
	StreetsMod: Create signs in the signworkshop
]]
minetest.register_node(":streets:signworkshop",{
	description = "Sign workshop",
	tiles = {},
	groups = {cracky = 1, level = 2},
	after_place_node = function(pos)
		minetest.get_meta(pos):set_string("formspec",table.concat({
			"size[12,10]",
			"label[3.5,0;Sign workshop - Create signs for your roads!]",
			"label[0,0.5;Available signs:]",
			"list[context;streets:signworkshop_list;0,1;5,4]",
			"label[9,0.5;Needed stuff:]",
			"list[context;streets:signworkshop_recipe;8,1;4,1]",
			"label[9,2;Put it here:]",
			"list[context;streets:signworkshop_input;8,3;4,1]",
			"list[current_player;main;2,6;8,4]"
		}))
		local inv = minetest.get_inventory({type = "node", pos = pos})
		inv:set_size("streets:signworkshop_list",5*4)
		inv:set_size("streets:signworkshop_recipe",3*2)
		inv:set_size("streets:signworkshop_input",4*1)
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		if to_list ~= "x" then
		
		end
	end,
})