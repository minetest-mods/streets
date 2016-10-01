--[[
	StreetsMod: All kinds of asphalt with labels
]]
local stairplus = streets.stairplus

minetest.register_node(":streets:asphalt_sideline",{
	description = streets.S("Asphalt with sideline"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_sideline")
minetest.register_alias("streets:asphalt_side","streets:asphalt_sideline")
minetest.register_alias("streets:asphalt_lside","streets:asphalt_sideline")
minetest.register_alias("streets:asphalt_left_side","streets:asphalt_sideline")
minetest.register_craft({
	output = "streets:asphalt_side 6",
	recipe = {
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_right_sideline",{
	description = streets.S("Asphalt with sideline").." 180°",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_side.png^[transformR180","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_right_sideline")
minetest.register_alias("streets:asphalt_rside","streets:asphalt_right_sideline")
minetest.register_craft({
	output = "streets:asphalt_right_side 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","dye:white"},
		{"streets:asphalt","streets:asphalt","dye:white"},
		{"streets:asphalt","streets:asphalt","dye:white"}
	}
})

minetest.register_node(":streets:asphalt_sideline_45",{
	description = streets.S("Asphalt with sideline").." 45°",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_side_45.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_side_45","streets:asphalt_sideline_45")
minetest.register_craft({
	output = "streets:asphalt_side_45 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","dye:white"},
		{"streets:asphalt","dye:white","dye:white"},
		{"dye:white","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_sideline_45bis",{
	description = streets.S("Asphalt with sideline").." 45°bis",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_side_45bis.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_side_45b","streets:asphalt_sideline_45bis")
minetest.register_craft({
	output = "streets:asphalt_side_45bis 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","streets:asphalt","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_sideline_r45",{
	description = streets.S("Asphalt with sideline").." -45°",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_side_r_45.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_side_r45","streets:asphalt_sideline_r45")
minetest.register_craft({
	output = "streets:asphalt_side_r45 6",
	recipe = {
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","dye:white"}
	}
})

minetest.register_node(":streets:asphalt_sideline_r45bis",{
	description = streets.S("Asphalt with sideline").." -45°bis",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_side_r_45bis.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_side_r45b","streets:asphalt_sideline_r45bis")
minetest.register_craft({
	output = "streets:asphalt_side_r45bis 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_solid_line",{
	description = streets.S("Asphalt with solid line"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_solid_line")
minetest.register_alias("streets:asphalt_middle","streets:asphalt_solid_line")
minetest.register_craft({
	output = "streets:asphalt_solid_line 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_solid_line_r45",{
	description = streets.S("Asphalt with solid line").."0 → 45°",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line_r45.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_solid_line")
minetest.register_alias("streets:asphalt_middle","streets:asphalt_solid_line")
minetest.register_craft({
	output = "streets:asphalt_solid_line_r45 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_solid_line_l45",{
	description = streets.S("Asphalt with solid line").."0 → -45°",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line_l45.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_solid_line")
minetest.register_alias("streets:asphalt_middle","streets:asphalt_solid_line")
minetest.register_craft({
	output = "streets:asphalt_solid_line_r45 6",
	recipe = {
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_solid_line_45",{
	description = streets.S("Asphalt with solid line").." 45°",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line_45.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_middle45","streets:asphalt_solid_line_45")
minetest.register_craft({
	output = "streets:asphalt_solid_line_45 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"}
	}
})


minetest.register_node(":streets:asphalt_dashed_line",{
	description = streets.S("Asphalt with dashed line"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_dashed_line")
minetest.register_alias("streets:asphalt_middle_dashed","streets:asphalt_dashed_line")
minetest.register_craft({
	output = "streets:asphalt_dashed_line 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_dashed_line_r45",{
	description = streets.S("Asphalt with dashed line").."0 → 45°",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line_r45.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_dashed_line")
minetest.register_alias("streets:asphalt_middle_dashed","streets:asphalt_dashed_line")
minetest.register_craft({
	output = "streets:asphalt_dashed_line 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","dye:white"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_dashed_line_l45",{
	description = streets.S("Asphalt with dashed line").."0 → -45°",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line_l45.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_dashed_line")
minetest.register_alias("streets:asphalt_middle_dashed","streets:asphalt_dashed_line")
minetest.register_craft({
	output = "streets:asphalt_dashed_line 6",
	recipe = {
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_dashed_line_45",{
	description = streets.S("Asphalt with dashed line").."45°" ,
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line_45.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_middle_dashed","streets:asphalt_dashed_line")
minetest.register_craft({
	output = "streets:asphalt_dashed_line_45 6",
	recipe = {
		{"streets:asphalt","streets:asphalt","dye:white"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_line45bis",{
	description = streets.S("Asphalt with line").." 45°bis",
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_line_45bis.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_middle45bis","streets:asphalt_line45bis")
minetest.register_craft({
	output = "streets:asphalt_line45bis 6",
	recipe = {
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_outer_edge",{
	description = streets.S("Asphalt with sideline (edge)"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_outer_edge.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_outer_edge")
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_outer_edge 4",
	recipe = {
		{"dye:white","dye:white","dye:white"},
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_parking",{
	description = streets.S("Asphalt with parking label"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_parking.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_parking")
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_parking 4",
	recipe = {
		{"streets:asphalt","dye:white","dye:white"},
		{"streets:asphalt","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_straight",{
	description = streets.S("Asphalt with arrow"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_straight.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_arrow_straight")
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_straight 4",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_left",{
	description = streets.S("Asphalt with arrow"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_left.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_arrow_left")
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_left 4",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"dye:white","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_right",{
	description = streets.S("Asphalt with arrow"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_right.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_arrow_right")
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_right 4",
	recipe = {
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_straight_left",{
	description = streets.S("Asphalt with arrow"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_straight_left.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_arrow_straight_left")
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_straight_left 4",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"dye:white","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_straight_right",{
	description = streets.S("Asphalt with arrow"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_straight_right.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_arrow_straight_right")
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_straight_right 4",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_arrow_alldirs",{
	description = streets.S("Asphalt with arrow"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_arrow_alldirs.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
stairplus("asphalt_arrow_alldirs")
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_alldirs 4",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"dye:white","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})
