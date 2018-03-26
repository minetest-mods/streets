streets.roads.register_roadmarking_collection({ name = "centerlines", description = "Center Lines" })
streets.roads.register_roadmarking_collection({ name = "centerlinecorners", description = "Center Line Corners/Junctions" })
streets.roads.register_roadmarking_collection({ name = "sidelines", description = "Side Lines" })
streets.roads.register_roadmarking_collection({ name = "yield_stop_lines", description = "Yield And Stop Lines" })
streets.roads.register_roadmarking_collection({ name = "arrows", description = "Arrows" })
streets.roads.register_roadmarking_collection({ name = "symbols", description = "Symbols" })


-- CENTER LINES

-- Normal Lines

streets.roads.register_roadmarking({
	name = "dashed_center_line",
	description = "Dashed Center Line",
	tex = "streets_dashed_center_line.png",
	belongs_to = "centerlines",
	ink_needed = 1,
	stairs = { r0 = 1, r90 = 1 },
	basic_stairs = { r0 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_center_line",
	description = "Solid Center Line",
	tex = "streets_solid_center_line.png",
	belongs_to = "centerlines",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1 },
	basic_stairs = { r0 = 1 },
})


-- Wide Lines

streets.roads.register_roadmarking({
	name = "dashed_center_line_wide",
	description = "Dashed Center Line Wide",
	tex = "streets_dashed_center_line_wide.png",
	belongs_to = "centerlines",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1 },
	basic_stairs = { r0 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_center_line_wide",
	description = "Solid Center Line Wide",
	tex = "streets_solid_center_line_wide.png",
	belongs_to = "centerlines",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1 },
	basic_stairs = { r0 = 1 },
})


-- Double Lines

streets.roads.register_roadmarking({
	name = "double_dashed_center_line",
	description = "Double Dashed Center Line",
	tex = "streets_double_dashed_center_line.png",
	belongs_to = "centerlines",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1 },
	basic_stairs = { r0 = 1 },
})

streets.roads.register_roadmarking({
	name = "double_solid_center_line",
	description = "Double Solid Center Line",
	tex = "streets_double_solid_center_line.png",
	belongs_to = "centerlines",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1 },
	basic_stairs = { r0 = 1 },
})

streets.roads.register_roadmarking({
	name = "mixed_center_line",
	description = "Solid/Dashed Center Line",
	tex = "streets_mixed_center_line.png",
	belongs_to = "centerlines",
	ink_needed = 3,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
	basic_stairs = { r0 = 1, r180 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_line_offset",
	description = "Solid Line Offset",
	tex = "streets_solid_line_offset.png",
	belongs_to = "centerlines",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
	basic_stairs = { r0 = 1, r180 = 1 },
})


--CENTER LINE CORNERS

--Normal Lines

streets.roads.register_roadmarking({
	name = "solid_center_line_corner",
	description = "Solid Center Line Corner",
	tex = "streets_solid_center_line_corner.png",
	belongs_to = "centerlinecorners",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_center_line_tjunction",
	description = "Solid Center Line T-Junction",
	tex = "streets_solid_center_line_tjunction.png",
	belongs_to = "centerlinecorners",
	ink_needed = 3,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_center_line_crossing",
	description = "Solid Center Line Crossing",
	tex = "streets_solid_center_line_crossing.png",
	belongs_to = "centerlinecorners",
	ink_needed = 4,
	stairs = { r0 = 1 },
})


--Wide Lines

streets.roads.register_roadmarking({
	name = "solid_center_line_wide_corner",
	description = "Solid Center Line Wide Corner",
	tex = "streets_solid_center_line_wide_corner.png",
	belongs_to = "centerlinecorners",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_center_line_wide_tjunction",
	description = "Solid Center Line Wide T-Junction",
	tex = "streets_solid_center_line_wide_tjunction.png",
	belongs_to = "centerlinecorners",
	ink_needed = 6,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_center_line_wide_crossing",
	description = "Solid Center Line Wide Crossing",
	tex = "streets_solid_center_line_wide_crossing.png",
	belongs_to = "centerlinecorners",
	ink_needed = 8,
	stairs = { r0 = 1 },
})


--Double Lines

streets.roads.register_roadmarking({
	name = "double_solid_center_line_corner",
	description = "Double Solid Center Line Corner",
	tex = "streets_double_solid_center_line_corner.png",
	belongs_to = "centerlinecorners",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "double_solid_center_line_tjunction",
	description = "Double Solid Center Line T-Junction",
	tex = "streets_double_solid_center_line_tjunction.png",
	belongs_to = "centerlinecorners",
	ink_needed = 6,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "double_solid_center_line_crossing",
	description = "Double Solid Center Line Crossing",
	tex = "streets_double_solid_center_line_crossing.png",
	belongs_to = "centerlinecorners",
	ink_needed = 8,
	stairs = { r0 = 1 },
})

--SIDE LINES

--Normal Lines

streets.roads.register_roadmarking({
	name = "solid_side_line",
	description = "Solid Side Line",
	tex = "streets_solid_side_line.png",
	belongs_to = "sidelines",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
	basic_stairs = { r0 = 1, r180 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_side_line_corner",
	description = "Solid Side Line Corner",
	tex = "streets_solid_side_line_corner.png",
	belongs_to = "sidelines",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_side_line_inner_corner",
	description = "Solid Side Line Inner Corner",
	tex = "streets_solid_side_line_inner_corner.png",
	belongs_to = "sidelines",
	ink_needed = 1,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "dashed_side_line",
	description = "Dashed Side Line",
	tex = "streets_dashed_side_line.png",
	belongs_to = "sidelines",
	ink_needed = 1,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
	basic_stairs = { r0 = 1, r180 = 1 },
})


--Wide Lines

streets.roads.register_roadmarking({
	name = "solid_side_line_wide",
	description = "Solid Side Line Wide",
	tex = "streets_solid_side_line_wide.png",
	belongs_to = "sidelines",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
	basic_stairs = { r0 = 1, r180 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_side_line_wide_corner",
	description = "Solid Side Line Wide Corner",
	tex = "streets_solid_side_line_wide_corner.png",
	belongs_to = "sidelines",
	ink_needed = 8,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_side_line_wide_inner_corner",
	description = "Solid Side Line Wide Inner Corner",
	tex = "streets_solid_side_line_wide_inner_corner.png",
	belongs_to = "sidelines",
	ink_needed = 1,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "dashed_side_line_wide",
	description = "Dashed Side Line Wide",
	tex = "streets_dashed_side_line_wide.png",
	belongs_to = "sidelines",
	ink_needed = 2,
	basic_stairs = { r0 = 1, r180 = 1 },
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})


-- YIELD AND STOP LINES

-- Side Corners

streets.roads.register_roadmarking({
	name = "yield_line_side_corner",
	description = "Yield Line Side Corner",
	tex = "streets_yield_line_side_corner.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 6,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "yield_line_side_corner_flipped",
	description = "Yield Line Side Corner (Flipped)",
	tex = "streets_yield_line_side_corner.png^[transformFX",
	belongs_to = "yield_stop_lines",
	ink_needed = 6,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "stop_line_side_corner",
	description = "Stop Line Side Corner",
	tex = "streets_stop_line_side_corner.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 9,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "stop_line_side_corner_flipped",
	description = "Stop Line Side Corner (Flipped)",
	tex = "streets_stop_line_side_corner.png^[transformFX",
	belongs_to = "yield_stop_lines",
	ink_needed = 9,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "stop_line_side_corner_wide",
	description = "Stop Line Side Wide Corner",
	tex = "streets_stop_line_side_corner_wide.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 10,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "stop_line_side_corner_wide_flipped",
	description = "Stop Line Side Wide Corner (Flipped)",
	tex = "streets_stop_line_side_corner_wide.png^[transformFX",
	belongs_to = "yield_stop_lines",
	ink_needed = 10,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})


-- Center Corners

streets.roads.register_roadmarking({
	name = "yield_line_center_corner",
	description = "Yield Line Center Corner",
	tex = "streets_yield_line_center_corner.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "yield_line_center_corner_flipped",
	description = "Yield Line Center Corner (Flipped)",
	tex = "streets_yield_line_center_corner.png^[transformFX",
	belongs_to = "yield_stop_lines",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "yield_line_center_corner_wide",
	description = "Yield Line Center Corner Wide",
	tex = "streets_yield_line_center_corner_wide.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 6,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "yield_line_center_corner_wide_flipped",
	description = "Yield Line Center Corner Wide (Flipped)",
	tex = "streets_yield_line_center_corner_wide.png^[transformFX",
	belongs_to = "yield_stop_lines",
	ink_needed = 6,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "stop_line_center_corner",
	description = "Stop Line Center Corner",
	tex = "streets_stop_line_center_corner.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 5,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "stop_line_center_corner_flipped",
	description = "Stop Line Center Corner (Flipped)",
	tex = "streets_stop_line_center_corner.png^[transformFX",
	belongs_to = "yield_stop_lines",
	ink_needed = 5,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "stop_line_center_corner_wide",
	description = "Stop Line Center Corner Wide",
	tex = "streets_stop_line_center_corner_wide.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 6,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "stop_line_center_corner_wide_flipped",
	description = "Stop Line Center Corner Wide (Flipped)",
	tex = "streets_stop_line_center_corner_wide.png^[transformFX",
	belongs_to = "yield_stop_lines",
	ink_needed = 6,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

-- Stop And Yield Lines

streets.roads.register_roadmarking({
	name = "stop_line",
	description = "Stop Line",
	tex = "streets_stop_line.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 8,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "yield_line",
	description = "Yield Line",
	tex = "streets_yield_line.png",
	belongs_to = "yield_stop_lines",
	ink_needed = 8,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})


--ARROWS

streets.roads.register_roadmarking({
	name = "arrow_straight",
	description = "Arrow Straight",
	tex = "streets_arrow_straight.png",
	belongs_to = "arrows",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "arrow_left",
	description = "Arrow Left",
	tex = "streets_arrow_right.png^[transformFX",
	belongs_to = "arrows",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "arrow_right",
	description = "Arrow Right",
	tex = "streets_arrow_right.png",
	belongs_to = "arrows",
	ink_needed = 2,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "arrow_left_straight",
	description = "Arrow Left And Straight",
	tex = "streets_arrow_right_straight.png^[transformFX",
	belongs_to = "arrows",
	ink_needed = 3,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "arrow_right_straight",
	description = "Arrow Right And Straight",
	tex = "streets_arrow_right_straight.png",
	belongs_to = "arrows",
	ink_needed = 3,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "arrow_left_right_straight",
	description = "Arrow Left, Right And Straight",
	tex = "streets_arrow_right_straight.png^[transformFX^streets_arrow_right_straight.png",
	belongs_to = "arrows",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "arrow_left_right",
	description = "Arrow Left And Right",
	tex = "streets_arrow_left_right.png",
	belongs_to = "arrows",
	ink_needed = 3,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})


--SYMBOLS

streets.roads.register_roadmarking({
	name = "parking",
	description = "Parking",
	tex = "streets_parking.png",
	belongs_to = "symbols",
	ink_needed = 3,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "pedestrian",
	description = "Pedestrian",
	tex = "streets_pedestrian.png",
	belongs_to = "symbols",
	ink_needed = 5,
	stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 },
})

streets.roads.register_roadmarking({
	name = "cross",
	description = "Cross",
	tex = "streets_cross.png",
	belongs_to = "symbols",
	ink_needed = 4,
	basic_stairs = { r0 = 1 },
	stairs = { r0 = 1 },
})

streets.roads.register_roadmarking({
	name = "crosswalk",
	description = "Crosswalk",
	tex = "streets_crosswalk.png",
	belongs_to = "symbols",
	ink_needed = 8,
	stairs = { r0 = 1, r90 = 1 },
})

streets.roads.register_roadmarking({
	name = "solid_diagonal_line",
	description = "Solid Diagonal Line",
	tex = "streets_solid_diagonal_line.png",
	belongs_to = "symbols",
	ink_needed = 4,
	stairs = { r0 = 1, r90 = 1 },
})

streets.roads.register_roadmarking({
	name = "double_solid_diagonal_line",
	description = "Double Solid White Diagonal Line",
	tex = "streets_double_solid_diagonal_line.png",
	belongs_to = "symbols",
	ink_needed = 8,
	stairs = { r0 = 1, r90 = 1 },
})
