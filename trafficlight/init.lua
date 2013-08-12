--[[
	StreetsMod: inDev Trafficlights
]]
minetest.register_node(":streets:trafficlight_bottom",{
	description = "Trafficlight",
	groups = {cracky = 1},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,0.25,0.25},
			{-0.2,0.25,-0.2,0.2,0.5,0.2}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,2.5,0.25}
		}
	},
	after_place_node = function(pos,placer,itemstack)
		if minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name == "air" and minetest.get_node({x = pos.x, y = pos.y + 2, z = pos.z}).name == "air" then
			pos.y = pos.y + 1
			minetest.set_node(pos,{name="streets:trafficlight_middle"})
			pos.y = pos.y + 1
			minetest.set_node(pos,{name="streets:trafficlight_top"})
		else
			minetest.chat_send_player(placer:get_player_name(),"Not enough vertical space! The traffic light has a height of 3 blocks.")
			minetest.remove_node(pos)
		end
		--
		pos.y = pos.y - 2
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
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
					-- Trafficlight code goes here
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
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2,-0.5,-0.2,0.2,0.5,0.2}
		}
	},
	pointable = false,
})

minetest.register_node(":streets:trafficlight_top",{
	description = "U cheater U",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25,-0.5,-0.25,0.25,0.5,0.25}
		}
	},
	pointable = false,
})