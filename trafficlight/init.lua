--[[
	StreetsMod: inDev Trafficlights
]]
dofile(streets.modpath .. "/../trafficlight/old2new.lua")

streets.tlBox =	{
	--[[ Thank you, rubenwardy, for your awesome NodeboxEditor! Not perfect, but still great! ]]
	{-0.1875,-0.5,0.5,0.1875,0.5,0.75}, --nodebox1
	{-0.0625,0.375,0.3125,0.0625,0.4375,0.5}, --nodebox2
	{-0.0625,0.0625,0.3125,0.0625,0.125,0.5}, --nodebox3
	{-0.0625,-0.25,0.3125,0.0625,-0.1875,0.5}, --nodebox4
	{0.0625,0.3125,0.3125,0.125,0.38,0.5}, --nodebox5
	{-0.125,0.3125,0.3125,-0.0625,0.375,0.5}, --nodebox6
	{0.0625,0,0.3125,0.125,0.0625,0.5}, --nodebox7
	{-0.125,0,0.3125,-0.0625,0.0625,0.5}, --nodebox8
	{0.0625,-0.3125,0.3125,0.125,-0.25,0.5}, --nodebox9
	{-0.125,-0.3125,0.3125,-0.0625,-0.25,0.5}, --nodebox10
	{-0.125, -0.125, 0.85, 0.125, 0.125, 0.75}, -- NodeBox11
}

streets.tlRythm = {
	toRed = {
		{name = "streets:trafficlight_top_yellow", pauseBefore = 0},
		{name = "streets:trafficlight_top_red", pauseBefore = 3}
	},
	toGreen = {
		{name = "streets:trafficlight_top_redyellow", pauseBefore = 0},
		{name = "streets:trafficlight_top_green", pauseBefore = 1.5}
	},
	toOff = {
		{name = "streets:trafficlight_top_warn", pauseBefore = 0},
		{name = "streets:trafficlight_top_off", pauseBefore = 5}
	},
	toWarn = {
		{name = "streets:trafficlight_top_warn", pauseBefore = 0}
	}
}

streets.tlSwitch = function(def)
	if not def.pos or not def.to or not streets.tlRythm[def.to] then
		return
	end
	local meta = minetest.get_meta(def.pos)
	-- Only switch if new state ~= current state
	if "to" .. meta:get_string("state") == def.to then
		return
	end
	-- Switch the trafficlight
	for k, v in pairs(streets.tlRythm[def.to]) do
		minetest.get_meta(def.pos):set_string("state", def.to:gsub("to", ""))
		minetest.after(v.pauseBefore, function()
			minetest.swap_node(def.pos, {name = v.name, param2 = minetest.get_node(def.pos).param2})
		end)
	end
end

streets.on_digiline_receive = function(pos, node, channel, msg)
	local setchan = minetest.get_meta(pos):get_string("channel")
	if setchan ~= channel then
		return
	end
	-- Tl states
	if msg == "OFF" then
		streets.tlSwitch({
			pos = pos,
			to = "toOff"
		})
	elseif msg == "GREEN" then
		streets.tlSwitch({
			pos = pos,
			to = "toGreen"
		})
	elseif msg == "RED" then
		streets.tlSwitch({
			pos = pos,
			to = "toRed"
		})
	elseif msg == "WARN" then
		streets.tlSwitch({
			pos = pos,
			to = "toWarn"
		})
	elseif msg == "GET" then
		local state = minetest.get_meta(pos):get_string("state")
		if not state or state == "" then
			state = "UNDEFINED"
		end
		digiline:receptor_send(pos, digiline.rules.default, channel, state)
	end
end

minetest.register_node(":streets:digiline_distributor",{
	description = streets.S("Digiline distributor"),
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
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y= 2, z=0}
			}
		}
	}
})

minetest.register_node(":streets:trafficlight_top_off",{
	description = streets.S("Trafficlight"),
	drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1, level = 2},
	inventory_image = "streets_trafficlight_inv.png",
	light_source = 11,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_off.png"},
	digiline = {
		receptor = {},
		effector = {
			action = function(pos, node, channel, msg)
				streets.on_digiline_receive(pos, node, channel, msg)
			end
		}
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", "field[channel;Channel;${channel}]")
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if (fields.channel) then
			minetest.get_meta(pos):set_string("channel", fields.channel)
			minetest.get_meta(pos):set_string("state", "Off")
		end
	end,
})

minetest.register_node(":streets:trafficlight_top_red",{
	drop = "streets:trafficlight_top_off",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_red.png"},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
	digiline = {
		receptor = {},
		effector = {
			action = function(pos, node, channel, msg)
				streets.on_digiline_receive(pos, node, channel, msg)
			end
		}
	},
})

minetest.register_node(":streets:trafficlight_top_yellow",{
	drop = "streets:trafficlight_top_off",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_yellow.png"},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
	digiline = {
		receptor = {},
		effector = {
			action = function(pos, node, channel, msg)
				streets.on_digiline_receive(pos, node, channel, msg)
			end
		}
	},
})

minetest.register_node(":streets:trafficlight_top_redyellow",{
	drop = "streets:trafficlight_top_off",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_redyellow.png"},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
	digiline = {
		receptor = {},
		effector = {
			action = function(pos, node, channel, msg)
				streets.on_digiline_receive(pos, node, channel, msg)
			end
		}
	},
})

minetest.register_node(":streets:trafficlight_top_green",{
	drop = "streets:trafficlight_top_off",
	groups = {cracky = 1, not_in_creative_inventory = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	drawtype = "nodebox",
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_green.png"},
	node_box = {
		type = "fixed",
		fixed = streets.tlBox
	},
	light_source = 6,
	digiline = {
		receptor = {},
		effector = {
			action = function(pos, node, channel, msg)
				streets.on_digiline_receive(pos, node, channel, msg)
			end
		}
	},
})

minetest.register_node(":streets:trafficlight_top_warn",{
	drop = "streets:trafficlight_top_off",
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
		fixed = streets.tlBox
	},
	light_source = 6,
	digiline = {
		receptor = {},
		effector = {
			action = function(pos, node, channel, msg)
				streets.on_digiline_receive(pos, node, channel, msg)
			end
		}
	},
})

minetest.register_craft({
	output = "streets:trafficlight_top_off",
	recipe = {
		{"default:steel_ingot", "dye:red", "default:steel_ingot"},
		{"default:steel_ingot", "dye:yellow", "default:steel_ingot"},
		{"default:steel_ingot", "dye:green", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "streets:digiline_distributor",
	recipe = {
		{"", "digilines:wire_std_00000000", ""},
		{"digilines:wire_std_00000000", "mesecons_luacontroller:luacontroller0000", "digilines:wire_std_00000000"},
		{"", "digilines:wire_std_00000000", ""}
	}
})