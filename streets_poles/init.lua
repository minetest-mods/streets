--[[
  ## StreetsMod 2.0 ##
  Submod: poles
  Optional: true
]]

minetest.register_node(":streets:bigpole", {
	description = "Pole (connects to everything)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "connected",
		fixed          = {-0.15, -0.15, -0.15, 0.15,  0.15, 0.15},
		connect_top    = {-0.15, -0.15, -0.15, 0.15,  0.5,  0.15}, -- y+
		connect_bottom = {-0.15, -0.5,  -0.15, 0.15,  0.15, 0.15}, -- y-
		connect_front  = {-0.15, -0.15, -0.5,  0.15,  0.15, 0.15}, -- z-
		connect_back   = {-0.15, -0.15,  0.15, 0.15,  0.15, 0.5 }, -- z+
		connect_left   = {-0.5,  -0.15, -0.15, 0.15,  0.15, 0.15}, -- x-
		connect_right  = {-0.15, -0.15, -0.15, 0.5,   0.15, 0.15}, -- x+
	},
	connects_to = {"group:wall", "group:stone", "group:wood", "group:tree", "group:sign", "group:concrete", "group:sand", "group:bigpole"},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
				{x= 0, y=-2, z= 0}
			}
		}
	}
})

minetest.register_node(":streets:bigpole_straight", {
	description = "Pole (straight)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type  = "fixed",
		fixed = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15},
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
				{x= 0, y=-2, z= 0}
			}
		}
	}
})

minetest.register_node(":streets:bigpole_edge", {
	description = "Pole (edge)",
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.15,0.15},
			{-0.15,-0.15,-0.15,0.15,0.15,-0.5}
		}
	},
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
			}
		}
	}
})

minetest.register_node(":streets:bigpole_tjunction", {
	description = "Pole (T-junction)",
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.15, 0.15},
			{-0.15, -0.15, -0.5, 0.15, 0.15, 0.5}
		}
	},
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
			}
		}
	}
})

minetest.register_craft({
	output = "streets:bigpole 3",
	recipe = {
		{"","",""},
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	}
})

minetest.register_craft({
	output = "streets:bigpole_straight",
	recipe = {
		{"streets:bigpole"}
	}
})

minetest.register_craft({
	output = "streets:bigpole",
	recipe = {
		{"streets:bigpole_straight"}
	}
})

minetest.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{"","",""},
		{"streets:bigpole","streets:bigpole",""},
		{"streets:bigpole","",""}
	}
})

minetest.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{"","",""},
		{"streets:bigpole","streets:bigpole",""},
		{"","streets:bigpole",""}
	}
})

minetest.register_craft({
	output = "streets:bigpole_tjunction 4",
	recipe = {
		{"","",""},
		{"streets:bigpole","streets:bigpole","streets:bigpole"},
		{"","streets:bigpole",""}
	}
})
