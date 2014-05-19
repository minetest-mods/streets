--[[
	StreetsMod: All kinds of asphalt with labels
]]
minetest.register_node(":streets:asphalt_sideline",{
	description = streets.S("Asphalt with sideline"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_side.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_side","streets:asphalt_sideline")
minetest.register_craft({
	output = "streets:asphalt_side 6",
	recipe = {
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"},
		{"dye:white","streets:asphalt","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_solid_line",{
	description = streets.S("Asphalt with solid line"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_solid_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_middle","streets:asphalt_solid_line")
minetest.register_craft({
	output = "streets:asphalt_solid_line 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_dashed_line",{
	description = streets.S("Asphalt with dashed line"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_dashed_line.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
minetest.register_alias("streets:asphalt_middle_dashed","streets:asphalt_dashed_line")
minetest.register_craft({
	output = "streets:asphalt_dashed_line 6",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"streets:asphalt","streets:asphalt","streets:asphalt"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})

minetest.register_node(":streets:asphalt_outer_edge",{
	description = streets.S("Asphalt with sideline (edge)"),
	groups = {cracky=3},
	tiles = {"streets_asphalt.png^streets_asphalt_outer_edge.png","streets_asphalt.png"},
	paramtype2 = "facedir"
})
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
-- no minetest.register_alias() needed
minetest.register_craft({
	output = "streets:asphalt_arrow_alldirs 4",
	recipe = {
		{"streets:asphalt","dye:white","streets:asphalt"},
		{"dye:white","dye:white","dye:white"},
		{"streets:asphalt","dye:white","streets:asphalt"}
	}
})