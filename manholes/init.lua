--[[
	StreetsMod: Manholes in asphalt
]]
minetest.register_node(":streets:manhole",{
	description = streets.S("Simple manhole"),
	tiles = {"streets_asphalt.png^streets_manhole.png","streets_asphalt.png"},
	groups	= {cracky=3}
})

minetest.register_node(":streets:manhole_adv_closed",{
	description = streets.S("Advanced manhole"),
	tiles = {"streets_asphalt.png^streets_manhole_advanced.png","streets_asphalt.png"},
	groups = {cracky=3},
	drawtype = "nodebox",
	paramtype = "light",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			--Walls
			{-0.5,-0.5,-0.5,-0.3,0.5,0.5},
			{-0.5,-0.5,-0.5,0.5,0.5,-0.3},
			{0.3,-0.5,-0.5,0.5,0.5,0.5},
			{-0.5,-0.5,0.3,0.5,0.5,0.5},
			--Cover
			{-0.5,0.4,-0.1,0.5,0.5,0.1},
			{-0.1,0.4,-0.5,0.1,0.5,0.5},
			{-0.2,0.4,-0.2,0.2,0.5,0.2}
		}
	},
	selection_box = {
		type = "regular",
	},
	on_rightclick = function(pos,node,clicker)
		minetest.set_node(pos,{name="streets:manhole_adv_open"})
	end
})
minetest.register_node(":streets:manhole_adv_open",{
	description = streets.S("Advanced manhole"),
	tiles = {"streets_asphalt.png^streets_manhole_advanced.png","streets_asphalt.png"},
	groups = {cracky=3,not_in_creative_inventory=1},
	drawtype = "nodebox",
	paramtype = "light",
	drop = "streets:manhole_adv_closed",
	climbable = true,
	walkable = false,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			--Walls
			{-0.5,-0.5,-0.5,-0.3,0.5,0.5},
			{-0.5,-0.5,-0.5,0.5,0.5,-0.3},
			{0.3,-0.5,-0.5,0.5,0.5,0.5},
			{-0.5,-0.5,0.3,0.5,0.5,0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			--Walls
			{-0.5,-0.5,-0.5,-0.3,0.5,0.5},
			{-0.5,-0.5,-0.5,0.5,0.5,-0.3},
			{0.3,-0.5,-0.5,0.5,0.5,0.5},
			{-0.5,-0.5,0.3,0.5,0.5,0.5},
		}
	},
	on_rightclick = function(pos,node,clicker)
		minetest.set_node(pos,{name="streets:manhole_adv_closed"})
	end
})

minetest.register_craft({
	output = "streets:manhole_adv_closed 2",
	recipe = {
		{"streets:asphalt", "default:steel_ingot", "streets:asphalt"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"streets:asphalt", "default:steel_ingot", "streets:asphalt"}
	}
})
minetest.register_craft({
	output = "streets:manhole 3",
	recipe = {
		{"streets:asphalt", "streets:asphalt", "streets:asphalt"},
		{"streets:asphalt", "default:steel_ingot", "streets:asphalt"},
		{"streets:asphalt", "streets:asphalt", "streets:asphalt"}
	}
})