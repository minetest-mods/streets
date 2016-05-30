--[[
  ## StreetsMod 2.0 ##
  Submod: roadwork
  Optional: true
]]

minetest.register_node("streets:roadwork_traffic_barrier", {
	description = "Traffic Barrier",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {"streets_concrete.png", "streets_concrete.png", "streets_concrete.png^streets_roadwork_traffic_barrier.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, wall = 1},
	node_box = {
		type = "connected",
		fixed          = {{-0.3, -0.5, -0.3, 0.3, -0.4, 0.3}, {-0.1, -0.5, -0.1, 0.1, 0.5, 0.1}},
		connect_front  = {{-0.3, -0.5, -0.5, 0.3, -0.4, 0.3}, {-0.1, -0.5, -0.5, 0.1, 0.5, 0.1}}, -- z-
		connect_back   = {{-0.3, -0.5, -0.3, 0.3, -0.4, 0.5}, {-0.1, -0.5, -0.1, 0.1, 0.5, 0.5}}, -- z+
		connect_left   = {{-0.5, -0.5, -0.3, 0.3, -0.4, 0.3}, {-0.5, -0.5, -0.1, 0.1, 0.5, 0.1}}, -- x-
		connect_right  = {{-0.3, -0.5, -0.3, 0.5, -0.4, 0.3}, {-0.1, -0.5, -0.1, 0.5, 0.5, 0.1}}, -- x+
	},
	connects_to = {"group:wall", "group:stone", "group:wood", "group:tree", "group:sign", "group:concrete"},
	sound = default.node_sound_stone_defaults()
})

minetest.register_craft({
	output = "streets:roadwork_traffic_barrier 3",
	recipe = {
		{"dye:red", "dye:white", "dye:red"},
		{"streets:concrete_wall", "streets:concrete_wall", "streets:concrete_wall"},
	}
})


minetest.register_node("streets:roadwork_blinking_light_off", {
	description = "Blinking Light",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_roadwork_blinking_light_top.png", "streets_roadwork_blinking_light_top.png", "streets_roadwork_blinking_light_off.png"},
	sunlight_propagates = true,
	groups = {cracky = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.125, 0.1875, -0.3125, 0.125}, -- Base
			{-0.1875, -0.3125, 0, 0.1875, 0.0625, 0}, -- Light
		}
	},
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name = "streets:roadwork_blinking_light_on", param2 = minetest.get_node(pos).param2 })
	end,
	on_construct = function(pos)
		timer = minetest.get_node_timer(pos)
		timer:start(1)
	end,
})

minetest.register_node("streets:roadwork_blinking_light_on", {
	description = "Blinking Light",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_roadwork_blinking_light_top.png", "streets_roadwork_blinking_light_top.png", "streets_roadwork_blinking_light_on.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, not_in_creative_inventory = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.125, 0.1875, -0.3125, 0.125}, -- Base
			{-0.1875, -0.3125, 0, 0.1875, 0.0625, 0}, -- Light
		}
	},
	light_source = 12,
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name = "streets:roadwork_blinking_light_off", param2 = minetest.get_node(pos).param2 })
	end,
	on_construct = function(pos)
		timer = minetest.get_node_timer(pos)
		timer:start(1)
	end,
	drop = "streets:roadwork_blinking_light_off",
})

minetest.register_craft({
	output = "streets:roadwork_blinking_light_off 2",
	recipe = {
		{"dye:red", "default:torch", "dye:red"},
		{"dye:yellow", "default:steel_ingot", "dye:yellow"},
	}
})

minetest.register_abm({
	nodenames = {"streets:roadwork_blinking_light_on", "streets:roadwork_blinking_light_off"},
	interval = 10,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		timer = minetest.get_node_timer(pos)
		if not timer:is_started() then
			timer:start(1)
		end
	end,
})
