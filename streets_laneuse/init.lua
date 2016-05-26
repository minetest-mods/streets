--[[
  ## StreetsMod 2.0 ##
  Submod: laneuse
  Optional: true
]]

local nodebox = {
	{-7/16, -7/16, -1/8, 7/16, 7/16, 1/8}, --Face
	{-7/16, 0, -1/4, -3/8, 7/16, -1/8}, --Visor Left
	{3/8, 0, -1/4, 7/16, 7/16, -1/8}, --Visor Right
	{-7/16, 3/8, -5/16, 7/16, 7/16, -1/8}, --Visor Top
	{-1/4, -1/4, 0.85, 1/4, 1/4, 1/8}, --Mounting Bracket
}

minetest.register_node("streets:lane_use_off", {
	description = "Lane Use Signal",
	tiles = {
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_laneuse_off.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
			fixed = nodebox
	},
	selection_box = {
		type = "fixed",
			fixed = nodebox

	},
	on_receive_fields = function(pos, formname, fields)
		if (fields.channel) then
			minetest.get_meta(pos):set_string("channel", fields.channel)
		end
	end,
	digiline = {
		receptor = {},
		effector = {
			action = function(pos, node, channel, msg)
				local setchan = minetest.get_meta(pos):get_string("channel")
				if setchan ~= channel then
					return
				end
				msg = msg:lower()
				if (msg=="off") then
					node.name = "streets:lane_use_off"
				elseif (msg=="green") then
					node.name = "streets:lane_use_green"
				elseif (msg=="red") then
					node.name = "streets:lane_use_red"
				elseif (msg=="yellow") then
					node.name = "streets:lane_use_yellow"
				end
				minetest.set_node(pos,node)
				minetest.get_meta(pos):set_string("channel",setchan)
			end
		}
	}
})

for _,v in pairs({"green","yellow","red"}) do
	minetest.register_node("streets:lane_use_"..v, {
		tiles = {
			"streets_tl_bg.png",
			"streets_tl_bg.png",
			"streets_tl_bg.png",
			"streets_tl_bg.png",
			"streets_tl_bg.png",
			"streets_laneuse_"..v..".png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", "field[channel;Channel;${channel}]")
		end,
		groups = {cracky = 3,not_in_creative_inventory = 1},
		light_source = 5,
		node_box = {
			type = "fixed",
				fixed = nodebox
		},
		selection_box = {
			type = "fixed",
				fixed = nodebox

		},
		on_receive_fields = function(pos, formname, fields)
			if (fields.channel) then
				minetest.get_meta(pos):set_string("channel", fields.channel)
			end
		end,
		digiline = {
			receptor = {},
			effector = {
				action = function(pos, node, channel, msg)
					local setchan = minetest.get_meta(pos):get_string("channel")
					if setchan ~= channel then
						return
					end
					msg = msg:lower()
					if (msg=="off") then
						node.name = "streets:lane_use_off"
					elseif (msg=="green") then
						node.name = "streets:lane_use_green"
					elseif (msg=="red") then
						node.name = "streets:lane_use_red"
					elseif (msg=="yellow") then
						node.name = "streets:lane_use_yellow"
					end
					minetest.set_node(pos,node)
					minetest.get_meta(pos):set_string("channel",setchan)
				end
			}
		}
	})
end
