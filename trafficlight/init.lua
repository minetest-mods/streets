--[[
	StreetsMod: inDev Trafficlights
]]
minetest.register_node(":streets:trafficlight_bottom",{
	description = "Cheater",
	drop = "",
	groups = {not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"streets_pole.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.25,0.15},
			{-0.1,0.25,-0.1,0.1,0.5,0.1}
		}
	},
})

minetest.register_node(":streets:trafficlight_middle",{
	description = "Cheater!",
	drop = "",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	drawtype = "nodebox",
	sunlight_propagates = true,
	tiles = {"streets_pole.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.1,0.1,0.5,0.1},
		}
	},
	pointable = false,
})

minetest.register_node(":streets:trafficlight_controller",{
	description = "Trafficlight",
	inventory_image = "streets_trafficlight_inv.png",
	tiles = {"streets_lampcontroller_top.png","streets_lampcontroller_bottom.png","streets_lampcontroller_sides.png"},
	groups = {cracky = 1},
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
	on_receive_fields = function(pos, formname, fields, sender)
		minetest.get_meta(pos):set_string("channel", fields.channel)
	end,
	after_place_node = function(pos,placer,itemstack)
		minetest.set_node({x = pos.x, y = pos.y - 2, z = pos.z},{name = "streets:trafficlight_controller"})
		minetest.set_node({x = pos.x, y = pos.y + 0, z = pos.z},{name = "streets:trafficlight_bottom"})
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z},{name = "streets:trafficlight_middle"})
		minetest.set_node({x = pos.x, y = pos.y + 2, z = pos.z},{name = "streets:trafficlight_top_off",param2 = minetest.dir_to_facedir(placer:get_look_dir())})
		local meta = minetest.get_meta({x = pos.x, y = pos.y - 2, z = pos.z})
		meta:set_string("channel","")
		meta:set_string("infotext","Off")
		meta:set_string("formspec","field[channel;Channel;${channel}]")
	end,
	after_dig_node = function(pos)
		minetest.remove_node({x = pos.x, y = pos.y + 2, z = pos.z})
		minetest.remove_node({x = pos.x, y = pos.y + 3, z = pos.z})
		minetest.remove_node({x = pos.x, y = pos.y + 4, z = pos.z})
	end,
	digiline = {
		receptor = {},
		effector = {
			action = function(pos,node,channel,msg)
				local setchannel = minetest.get_meta(pos):get_string("channel")
				if channel == setchannel then
					-- Set a meta entry for the trafficlight's state
					local meta = minetest.get_meta(pos)
					local state = meta:get_string("infotext")
					if msg == "green" or msg == "red" or msg == "warn" or msg == "off" then
						meta:set_string("infotext",msg)
						local facedir = minetest.get_node({x = pos.x, y = pos.y + 4, z = pos.z}).param2
						-- Modify <pos> to the top node of the trafficlight
						pos.y = pos.y + 4
						--
						if msg == "red" and state ~= "red" then
							minetest.set_node(pos,{name = "streets:trafficlight_top_yellow",param2=facedir})
							minetest.after(3,function(param)
								minetest.set_node(pos,{name = "streets:trafficlight_top_red",param2=facedir})
							end)
						end
						--
						if msg == "green" and state ~= "green" then
							minetest.set_node(pos,{name = "streets:trafficlight_top_redyellow",param2=facedir})
							minetest.after(3,function(param)
								minetest.set_node(pos,{name = "streets:trafficlight_top_green",param2=facedir})
							end)
						end
						--
						if msg == "off" and state ~= "off" then
							minetest.set_node(pos,{name = "streets:trafficlight_top_off",param2=facedir})
						end
						--
						if msg == "warn" and state ~= "warn" then
							minetest.set_node(pos,{name = "streets:trafficlight_top_warn",param2=facedir})
						end
					end
				end
			end
		}
	}
})

minetest.register_node(":streets:trafficlight_top_off",{
	description = "U cheater U",
	drop = "",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_off.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,0.5,0.25}
		}
	},
	pointable = false,
})

minetest.register_node(":streets:trafficlight_top_red",{
	description = "U cheater U",
	drop = "",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_red.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,0.5,0.25}
		}
	},
	pointable = false,
	light_source = 6,
})

minetest.register_node(":streets:trafficlight_top_yellow",{
	description = "U cheater U",
	drop = "",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_yellow.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,0.5,0.25}
		}
	},
	pointable = false,
	light_source = 6,
})

minetest.register_node(":streets:trafficlight_top_redyellow",{
	description = "U cheater U",
	drop = "",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_redyellow.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,0.5,0.25}
		}
	},
	pointable = false,
	light_source = 6,
})

minetest.register_node(":streets:trafficlight_top_green",{
	description = "U cheater U",
	drop = "",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_green.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,0.5,0.25}
		}
	},
	pointable = false,
	light_source = 6,
})

minetest.register_node(":streets:trafficlight_top_warn",{
	description = "U cheater U",
	drop = "",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png",{
		name="streets_tl_warn.png",
		animation={type="vertical_frames", aspect_w=64, aspect_h=64, length=1.5},
	}},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,0.5,0.25}
		}
	},
	pointable = false,
	light_source = 6,
})

minetest.register_craft({
	output = "streets:trafficlight_controller",
	recipe = {
		{"dye:red","",""},
		{"dye:yellow","",""},
		{"dye:green","",""}
	}
})