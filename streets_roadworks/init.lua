--[[
  ## StreetsMod 2.0 ##
  Submod: roadworks
  Optional: true
]]

local box = {{-0.5, -0.5, -0.5, 0.5, -0.499, 0.5}}
local sel = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}}

minetest.register_node(":streets:rw_solid_yellow",{
  description = "Roadworks: Solid line",
  tiles = {"streets_line_solid_yellow.png", "streets_rw_solid_curve.png", "streets_rw_solid_tjunction.png", "streets_rw_solid_crossing.png"},
	drawtype = "raillike",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_line_solid_yellow.png",
	wield_image = "streets_line_solid_yellow.png",
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})

minetest.register_node(":streets:rw_dashed_yellow",{
  description = "Roadworks: Dashed line",
  tiles = {"streets_line_dashed_yellow.png", "streets_rw_solid_curve.png", "streets_rw_solid_tjunction.png", "streets_rw_solid_crossing.png"},
	drawtype = "raillike",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_line_dashed_yellow.png",
	wield_image = "streets_line_dashed_yellow.png",
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})

minetest.register_node(":streets:rw_sideline_slim", {
  description = "Roadworks: Slim sideline",
  tiles = {"streets_line_side_slim_yellow.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_line_side_slim_yellow.png",
	wield_image = "streets_line_side_slim_yellow.png",
  node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})

minetest.register_node(":streets:rw_sideline_thick", {
  description = "Roadworks: Thick sideline",
  tiles = {"streets_line_side_thick_yellow.png", "streets_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_line_side_thick_yellow.png",
	wield_image = "streets_line_side_thick_yellow.png",
  node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})

minetest.register_node(":streets:rw_side_dashed_slim", {
  description = "Roadworks: Slim dashed sideline",
  tiles = {"streets_line_side_dashed_slim_yellow.png", "streets_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_line_side_dashed_slim_yellow.png",
	wield_image = "streets_line_side_dashed_slim_yellow.png",
  node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})

minetest.register_node(":streets:rw_side_dashed_thick", {
  description = "Roadworks: Tick dashed sideline",
  tiles = {"streets_line_side_dashed_thick_yellow.png", "streets_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_line_side_dashed_thick_yellow.png",
	wield_image = "streets_line_side_dashed_thick_yellow.png",
  node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})

minetest.register_node(":streets:rw_edge_slim", {
  description = "Roadworks: Slim sideline",
  tiles = {"streets_line_edge_slim_yellow.png", "streets_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_line_edge_slim_yellow.png",
	wield_image = "streets_line_edge_slim_yellow.png",
  node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})

minetest.register_node(":streets:rw_edge_thick", {
  description = "Roadworks: Thick sideline",
  tiles = {"streets_line_edge_thick_yellow.png", "streets_transparent.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_line_edge_thick_yellow.png",
	wield_image = "streets_line_edge_thick_yellow.png",
  node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})

minetest.register_node(":streets:rw_cross",{
	description = "Roadworks: Cross",
	tiles = {"streets_cross.png"},
	drawtype = "signlike",
	paramtype = "light",
	paramtype2 = "wallmounted",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_cross.png",
	wield_image = "streets_cross.png",
	selection_box = {
		type = "wallmounted"
	}
})
