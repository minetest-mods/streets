--[[
	StreetsMod: inDev Trafficlights
]]
minetest.register_node(":streets:trafficlight_top_off",{
	description = S("Trafficlight"),
	drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875,-0.5,0.5,0.1875,0.5,0.75}, --nodebox1
			{-0.05,0.375,0.32,0.05,0.429368,0.51}, --nodebox2
			{-0.05,0.0625,0.32,0.05,0.125,0.51}, --nodebox3
			{-0.05,-0.25,0.32,0.05,-0.1875,0.51}, --nodebox4
			{0.05,0.32,0.32,0.1,0.38,0.5}, --nodebox5
			{-0.1,0.32,0.32,-0.05,0.38,0.5}, --nodebox6
			{0.05,0.001,0.32,0.1,0.06,0.5}, --nodebox7
			{-0.1,0.001,0.32,-0.05,0.06,0.5}, --nodebox8
			{0.05,-0.31,0.32,0.1,-0.25,0.5}, --nodebox9
			{-0.1,-0.31,0.32,-0.05,-0.25,0.5}, --nodebox10
		}
	},
	tiles = {"streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_tl_bg.png","streets_trafficlight_template.png"},
})

minetest.register_node(":streets:trafficlight_top_red",{
	description = S("U cheater U"),
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
	description = S("U cheater U"),
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
	description = S("U cheater U"),
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
	description = S("U cheater U"),
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
	description = S("U cheater U"),
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