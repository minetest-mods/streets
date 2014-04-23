--[[
	StreetsMod: inDev Trafficlights
]]
minetest.register_node(":streets:trafficlight_top_off",{
	description = S("Trafficlight"),
	drawtype="nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1, level = 2},
	inventory_image = "streets_trafficlight_inv.png",
	node_box = {
		type = "fixed",
		fixed = {
			--[[ Thank you, rubenwardy, for your awesome NodeboxEditor! Not perfect, but still great! ]]
			{-0.1875,-0.5,0.5,0.1875,0.5,0.75}, --nodebox1
			{-0.0625,0.375,0.3125,0.0625,0.4375,0.5}, --nodebox2
			{-0.0625,0.0625,0.3125,0.0625,0.125,0.5}, --nodebox3
			{-0.0625,-0.25,0.3125,0.0625,-0.1875,0.5}, --nodebox4
			{0.0625,0.3125,0.3125,0.125,0.375,0.5}, --nodebox5
			{-0.125,0.3125,0.3125,-0.0625,0.375,0.5}, --nodebox6
			{0.0625,0,0.3125,0.125,0.0625,0.5}, --nodebox7
			{-0.125,0,0.3125,-0.0625,0.0625,0.5}, --nodebox8
			{0.0625,-0.3125,0.3125,0.125,-0.25,0.5}, --nodebox9
			{-0.125,-0.3125,0.3125,-0.0625,-0.25,0.5}, --nodebox10
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