--[[
  ## StreetsMod 2.0 ##
  Submod: signs
  Optional: true
]]

minetest.register_node("streets:sign_curve_chevron_right", {
	description = "Curve Chevron Sign (Right)",
	tiles = {
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_curve_sign.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
			fixed = {-1/2, -1/2, 0.8, 1/2, 1/2, 0.85}
	},
	selection_box = {
		type = "fixed",
			fixed = {-1/2, -1/2, 0.8, 1/2, 1/2, 0.85}
	}
})

minetest.register_node("streets:sign_curve_chevron_left", {
	description = "Curve Chevron Sign (Left)",
	tiles = {
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_curve_sign.png^[transformFX"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
			fixed = {-1/2, -1/2, 0.8, 1/2, 1/2, 0.85}
	},
	selection_box = {
		type = "fixed",
			fixed = {-1/2, -1/2, 0.8, 1/2, 1/2, 0.85}
	}
})

minetest.register_node("streets:sign_stop", {
	description = "Stop Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_stop_sign_back.png",
		"streets_stop_sign_front.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 3},
	node_box = {
		type = "fixed",
			fixed = {-1/2, -1/2, 0.84, 1/2, 1/2, 0.85}
	},
	selection_box = {
		type = "fixed",
			fixed = {-1/2, -1/2, 0.84, 1/2, 1/2, 0.85}
	}
})

minetest.register_craft({
	output = "streets:sign_curve_chevron_right",
	recipe = {
		{"dye:yellow","dye:black","dye:yellow"},
		{"dye:yellow","dye:yellow","dye:black"},
		{"dye:yellow","dye:black","dye:yellow"}
	}
})

minetest.register_craft({
	output = "streets:sign_curve_chevron_left",
	recipe = {
		{"dye:yellow","dye:black","dye:yellow"},
		{"dye:black","dye:yellow","dye:yellow"},
		{"dye:yellow","dye:black","dye:yellow"}
	}
})

minetest.register_craft({
	output = "streets:sign_stop",
	recipe = {
		{"","dye:red",""},
		{"dye:red","dye:white","dye:red"},
		{"","dye:red",""}
	}
})
