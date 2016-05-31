--[[
	## StreetsMod 2.0 ##
	Submod: Concrete
	Optional: true
]]

if minetest.get_modpath("concrete") then
	minetest.register_alias("streets:concrete", "technic:concrete")
else
	minetest.register_alias("technic:concrete", "streets:concrete")

	minetest.register_node("streets:concrete", {
		description = "Concrete",
		tiles = {streets.concrete_texture},
		groups = {cracky = 2, stone = 3},
		sounds =  default.node_sound_stone_defaults()
	})
end

minetest.register_node("streets:concrete_wall", {
	description = "Concrete Wall",
	paramtype = "light",
	drawtype = "nodebox",
	tiles = {streets.concrete_texture},
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
	output = "streets:concrete_wall 5",
	recipe = {
		{"", "streets:concrete", ""},
		{"", "streets:concrete", ""},
		{"streets:concrete", "streets:concrete", "streets:concrete"},
	}
})
