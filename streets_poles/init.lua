--[[
  ## StreetsMod 2.0 ##
  Submod: poles
  Optional: true
]]

minetest.register_node(":streets:bigpole", {
	description = "Pole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
		}
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
	description = "Pole",
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
	description = "Pole",
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
	output = "streets:bigpole_tjunction 2",
	recipe = {
		{"","",""},
		{"streets:bigpole_edge","streets:bigpole",""},
		{"","",""}
	}
})
