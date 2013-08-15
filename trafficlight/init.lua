--[[
	StreetsMod: inDev Trafficlights
]]
minetest.register_node(":streets:trafficlight_bottom",{
	description = "Trafficlight",
	groups = {cracky = 1},
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
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,2.5,0.25}
		}
	},
	after_place_node = function(pos,placer,itemstack)
		local facedir = minetest.get_node(pos).param2
		if minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" and minetest.get_node({x = pos.x, y = pos.y + 2, z = pos.z}).name == "air" then
			pos.y = pos.y + 1
			minetest.set_node(pos,{name="streets:trafficlight_middle"})
			pos.y = pos.y + 1
			minetest.set_node(pos,{name="streets:trafficlight_top_off",param2=facedir})
		else
			minetest.chat_send_player(placer:get_player_name(),"Not enough vertical space! The traffic light has a height of 3 blocks.")
			minetest.remove_node(pos)
		end
		--
		pos.y = pos.y - 2
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
		meta:set_string("infotext", "Off")
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		pos.y = pos.y + 1
		minetest.remove_node(pos)
		pos.y = pos.y + 1
		minetest.remove_node(pos)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		minetest.env:get_meta(pos):set_string("channel", fields.channel)
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
						local facedir = minetest.get_node(pos).param2
						-- Modify <pos> to the top node of the trafficlight
						pos.y = pos.y + 2
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

minetest.register_node(":streets:trafficlight_middle",{
	description = "U cheater U",
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

minetest.register_node(":streets:trafficlight_top_off",{
	description = "U cheater U",
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