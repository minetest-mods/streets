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
