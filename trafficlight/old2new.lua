--[[
	StreetsMod: Convert old trafficlights
]]
minetest.register_node(":streets:trafficlight_bottom", {
	diggable = false,
	pointable = false,
	drawtype = "airlike",
	description = "I'm an old node, please drop me",
	groups = {not_in_creative_inventory = 1}
})
minetest.register_abm({
	nodenames = {"streets:trafficlight_bottom"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		minetest.log("action", "Converting trafficlight at position " .. minetest.pos_to_string(pos))
		-- Replace controller with distributor
		pos.y = pos.y - 2
		minetest.set_node(pos, {name = "streets:digiline_distributor"})
		-- Change bottom pole
		pos.y = pos.y + 2
		minetest.set_node(pos, {name = "streets:bigpole", param2 = 2})
		-- Change middle pole
		pos.y = pos.y + 1
		minetest.set_node(pos, {name = "streets:bigpole", param2 = 2})
		-- Change the top
		pos.y = pos.y + 1
		local fd = minetest.get_node(pos).param2
		local ch = minetest.get_meta(pos):get_string("channel")
		minetest.set_node(pos, {name = "streets:bigpole", param2 = 2})
		-- Place new top
		if fd == 1 then
			minetest.set_node({x = pos.x - 1, y = pos.y, z = pos.z}, {name = "streets:trafficlight_top_warn", param2 = fd})
			local meta = minetest.get_meta({x = pos.x - 1, y = pos.y, z = pos.z})
			meta:set_string("channel", ch)
			meta:set_string("state", "warn")
			meta:set_string("formspec", "field[channel;Channel;${channel}]")
		elseif fd == 2 then
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z + 1}, {name = "streets:trafficlight_top_warn", param2 = fd})
			local meta = minetest.get_meta({x = pos.x, y = pos.y, z = pos.z + 1})
			meta:set_string("channel", ch)
			meta:set_string("state", "warn")
			meta:set_string("formspec", "field[channel;Channel;${channel}]")
		elseif fd == 3 then
			minetest.set_node({x = pos.x + 1, y = pos.y, z = pos.z}, {name = "streets:trafficlight_top_warn", param2 = fd})
			local meta = minetest.get_meta({x = pos.x + 1, y = pos.y, z = pos.z})
			meta:set_string("channel", ch)
			meta:set_string("state", "warn")
			meta:set_string("formspec", "field[channel;Channel;${channel}]")
		elseif fd == 0 then
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z - 1}, {name = "streets:trafficlight_top_warn", param2 = fd})
			local meta = minetest.get_meta({x = pos.x, y = pos.y, z = pos.z - 1})
			meta:set_string("channel", ch)
			meta:set_string("state", "warn")
			meta:set_string("formspec", "field[channel;Channel;${channel}]")
		end
	end
})