--[[
	StreetsMod: Yellow labels for construction areas on roads,
	which "override" the white ones.
	Construction area fence.
]]
local box	= {-0.5,-0.5,-0.5,0.5,-0.45,0.5}

minetest.register_node(":streets:rw_asphalt_solid",{
	description = streets.S("Solid line (yellow)"),
	tiles = {"streets_rw_solid_line.png","streets_rw_solid_line_curve.png","streets_rw_solid_line_tjunction.png","streets_rw_solid_line_crossing.png"},
	drawtype = "raillike",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_solid_line.png",
	wield_image = "streets_rw_solid_line.png",
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	}
})

minetest.register_node(":streets:rw_asphalt_dashed",{
	description = streets.S("Dashed line (yellow)"),
	tiles = {"streets_rw_dashed_line.png","streets_rw_dashed_line_curve.png","streets_rw_dashed_line_tjunction.png","streets_rw_dashed_line_crossing.png"},
	drawtype = "raillike",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_dashed_line.png",
	wield_image = "streets_rw_dashed_line.png",
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	}
})

minetest.register_node(":streets:rw_cross",{
	description = streets.S("Cross (yellow)"),
	tiles = {"streets_rw_cross.png"},
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_cross.png",
	wield_image = "streets_rw_cross.png",
	selection_box = {
		type = "wallmounted"
	}
})

minetest.register_node(":streets:rw_outer_edge",{
	description = streets.S("Outer edge (yellow)"),
	tiles = {"streets_rw_outer_edge.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_outer_edge.png",
	wield_image = "streets_rw_outer_edge.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node(":streets:rw_parking",{
	description = streets.S("Parking (yellow)"),
	tiles = {"streets_rw_parking.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_parking.png",
	wield_image = "streets_rw_parking.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node(":streets:rw_alldirs",{
	description = streets.S("Arrow (yellow)"),
	tiles = {"streets_rw_arrow_alldirs.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_alldirs.png",
	wield_image = "streets_rw_arrow_alldirs.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node(":streets:rw_left",{
	description = streets.S("Arrow (yellow)"),
	tiles = {"streets_rw_arrow_left.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_left.png",
	wield_image = "streets_rw_arrow_left.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node(":streets:rw_right",{
	description = streets.S("Arrow (yellow)"),
	tiles = {"streets_rw_arrow_right.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_right.png",
	wield_image = "streets_rw_arrow_right.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node(":streets:rw_straight_right",{
	description = streets.S("Arrow (yellow)"),
	tiles = {"streets_rw_arrow_straight_right.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_straight_right.png",
	wield_image = "streets_rw_arrow_straight_right.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node(":streets:rw_straight_left",{
	description = streets.S("Arrow (yellow)"),
	tiles = {"streets_rw_arrow_straight_left.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_straight_left.png",
	wield_image = "streets_rw_arrow_straight_left.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node(":streets:rw_straight",{
	description = streets.S("Arrow (yellow)"),
	tiles = {"streets_rw_arrow_straight.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_arrow_straight.png",
	wield_image = "streets_rw_arrow_straight.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_node(":streets:rw_sideline",{
	description = streets.S("Sideline (yellow)"),
	tiles = {"streets_rw_asphalt_side.png","streets_rw_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_rw_asphalt_side.png",
	wield_image = "streets_rw_asphalt_side.png",
	node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
	}
})

minetest.register_craft({
	output = "streets:rw_asphalt_solid 3",
	recipe = {
		{"","dye:yellow",""},
		{"","dye:yellow",""},
		{"","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_sideline 3",
	recipe = {
		{"dye:yellow","dye:yellow",""},
		{"dye:yellow","dye:yellow",""},
		{"dye:yellow","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_asphalt_dashed 3",
	recipe = {
		{"","dye:yellow",""},
		{"","",""},
		{"","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_cross 3",
	recipe = {
		{"dye:yellow","","dye:yellow"},
		{"","dye:yellow",""},
		{"dye:yellow","","dye:yellow"}
	}
})

minetest.register_craft({
	output = "streets:rw_outer_edge 3",
	recipe = {
		{"dye:yellow","dye:yellow","dye:yellow"},
		{"dye:yellow","",""},
		{"dye:yellow","",""}
	}
})

minetest.register_craft({
	output = "streets:rw_parking 3",
	recipe = {
		{"","dye:yellow","dye:yellow"},
		{"","dye:yellow","dye:yellow"},
		{"","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_alldirs 3",
	recipe = {
		{"","dye:yellow",""},
		{"dye:yellow","dye:yellow","dye:yellow"},
		{"","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_left 3",
	recipe = {
		{"","",""},
		{"dye:yellow","dye:yellow",""},
		{"","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_right 3",
	recipe = {
		{"","",""},
		{"","dye:yellow","dye:yellow"},
		{"","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_straight_left 3",
	recipe = {
		{"","dye:yellow",""},
		{"dye:yellow","dye:yellow",""},
		{"","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_straight_right 3",
	recipe = {
		{"","dye:yellow",""},
		{"","dye:yellow","dye:yellow"},
		{"","dye:yellow",""}
	}
})

minetest.register_craft({
	output = "streets:rw_straight 3",
	recipe = {
		{"","",""},
		{"","dye:yellow",""},
		{"","dye:yellow",""}
	}
})