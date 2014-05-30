--[[
	StreetsMod: Convert old trafficlights
]]
minetest.register_abm({
	nodenames = {"streets:traficlight_bottom"},
	interval = 2,
	chance = 1
	action = function(pos, node)
		-- Replace controller with distributor
		pos.y = pos.y - 1
		minetest.set_node(pos, {name = "streets:digiline_distributor"})
		-- Change bottom pole
		pos.y = pos.y + 1
		minetest.set_node(pos, {name = "streets:bigpole", param2 = 2})
		-- Change middle pole
		pos.y = pos.y + 1
		minetest.set_node(pos, {name = "streets:bigpole", param2 = 2})
		-- Change the top
		pos.y = pos.y + 1
		local fd = minetest.get_node(pos).param2
		local nn = minetest.get_node(pos).name
		local ch = minetest.get_meta(pos):get_string("channel")
		minetest.set_node(pos, {name = "streets:bigpole", param2 = 2})
		-- Place new top
		if fd == 1 then
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z + 1}, {name = nn, param2 = fd})
			minetest.get_meta(pos):set_string("channel", ch)
		elseif fd == 2 then
			minetest.set_node({x = pos.x, y = pos.y, z = pos.z - 1}, {name = nn, param2 = fd})
			minetest.get_meta(pos):set_string("channel", ch)
		elseif fd == 3 then
			minetest.set_node({x = pos.x + 1, y = pos.y, z = pos.z}, {name = nn, param2 = fd})
			minetest.get_meta(pos):set_string("channel", ch)
		elseif fd == 4 then
			minetest.set_node({x = pos.x - 1, y = pos.y, z = pos.z}, {name = nn, param2 = fd})
			minetest.get_meta(pos):set_string("channel", ch)
		end
	end
})