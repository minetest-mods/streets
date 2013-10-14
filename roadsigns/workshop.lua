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
			"button[8,4;2,1;streets:signworkshop_send;Start!]",
			"label[5.8,0.5;Selected:]",
			"list[context;streets:signworkshop_select;6,1;1,1]",
			"label[5.8,2.5;Output:]",
			"list[context;streets:signworkshop_output;6,3;1,1]",
			"list[current_player;main;2,6;8,4]",
		}))
		local inv = minetest.get_inventory({type = "node", pos = pos})
		inv:set_size("streets:signworkshop_list",5*4)
		inv:set_size("streets:signworkshop_recipe",3*2)
		inv:set_size("streets:signworkshop_input",4*1)
		inv:set_size("streets:signworkshop_select",1*1)
		inv:set_size("streets:signworkshop_output",1*1)
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname ~= "streets:signworkshop_input" then
			return 0
		else
			return 1
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		if to_list == "streets:signworkshop_input" and from_list == "streets:signworkshop_input" then
			return 1
		else
			return 0
		end
	end,
	allow_metadata_inventory_take = function(pos, listname, index, stack, player)
		if listname == "streets:signworkshop_input" or listname == "streets:signworkshop_output" then
			return 99
		else
			return 0
		end
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		local inv = minetest.get_inventory({type = "node", pos = pos})
		--
		if inv:is_emtpy("streets:signworkshop_input") ~= true then
		
		end
	end
})