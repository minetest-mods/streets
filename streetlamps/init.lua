--[[
	StreetsMod: Streetlamps
]]
--[[minetest.register_node(":streets:streetlamp_basic_controller",{
	description = streets.S("Trafficlight"),
	tiles = {"streets_lampcontroller_top.png","streets_lampcontroller_bottom.png","streets_lampcontroller_sides.png"},
	groups = {cracky = 1, not_in_creative_inventory = 1},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			{-0.05,0.5,-0.05,0.05,1.6,0.05}
		}
	},
	selection_box = 	{
		type = "fixed",
		fixed = {
			{-0.5,-0.5,-0.5,0.5,0.5,0.5},
			{-0.3,1.5,-0.3,0.3,4.5,0.3}
		}
	},
	mesecons = {
		effector = {
			action_on = function(pos,node)
				minetest.set_node({x = pos.x, y = pos.y + 4, z = pos.z},{name = "streets:streetlamp_basic_top_on"})
			end,
			action_off = function(pos,node)
				minetest.set_node({x = pos.x, y = pos.y + 4, z = pos.z},{name = "streets:streetlamp_basic_top_off"})
			end
		}
	},
	after_dig_node = function(pos)
		minetest.remove_node({x = pos.x, y = pos.y + 2, z = pos.z})
		minetest.remove_node({x = pos.x, y = pos.y + 3, z = pos.z})
		minetest.remove_node({x = pos.x, y = pos.y + 4, z = pos.z})
		minetest.chat_send_all("!!!")
	end
})]]

minetest.register_node(":streets:streetlamp_basic_bottom",{
	drop = "",
	description = streets.S("Street lamp"),
	tiles = {"streets_lamps_basic_bottom.png"},
	inventory_image = "streets_lamps_basi_inv.png",
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
	pointable = false,
	after_place_node = function(pos,placer,itemstack)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "streets:streetlamp_basic_middle"})
		minetest.set_node({x = pos.x, y = pos.y + 2, z = pos.z},{name = "streets:streetlamp_basic_top_on"})
		-- minetest.set_node({x = pos.x, y = pos.y - 2, z = pos.z},{name = "streets:streetlamp_basic_controller"})
	end
})
minetest.register_node(":streets:streetlamp_basic_middle",{
	drop = "",
	description = streets.S("U cheater U"),
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
--[[minetest.register_node(":streets:streetlamp_basic_top_off",{
	drop = "",
	description = streets.S("U cheater U"),
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
})]]
minetest.register_node(":streets:streetlamp_basic_top_on",{
	drop = "streets:streetlamp_basic_bottom",
	description = streets.S("U cheater U"),
	groups = {cracky = 1, not_in_creative_inventory = 1},
	tiles = {"streets_lamps_basic_top_top.png","streets_lamps_basic_top_top.png","streets_lamps_basic_top.png","streets_lamps_basic_top.png","streets_lamps_basic_top.png","streets_lamps_basic_top.png"},
	paramtype = "light",
	drawtype = "nodebox",
	light_source = 10,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.1,0.1,-0.4,0.1},
			{-0.3,-0.4,-0.3,0.3,0.5,0.3}
		}
	},
	selection_box = 	{
		type = "fixed",
		fixed = {
			{-0.3,0.5,-0.3,0.3,-2.5,0.3},
		}
	},
	after_dig_node = function(pos)
		minetest.remove_node({x = pos.x, y = pos.y - 1, z = pos.z})
		minetest.remove_node({x = pos.x, y = pos.y - 2, z = pos.z})
	end
})

minetest.register_craft({
	output = "streets:streetlamp_basic_bottom",
	recipe = {
		{"","default:torch",""},
		{"","default:stick",""},
		{"","default:stick",""}
	}
})