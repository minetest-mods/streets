--[[
  ## StreetsMod 2.0 ##
  Submod: roadmarkings
  Optional: true
  Category: Roads
]]

streets.register_road_marking({
  name = "dashed_white_center_line",
  friendlyname = "Dashed White Center Line",
  tex = "streets_line_dashed.png",
  flip_required = false,
  category = {color = "white", section = "centerlines"},
  dye_needed = {white = 1},
})

streets.register_road_marking({
  name = "solid_white_center_line",
  friendlyname = "Solid White Center Line",
  tex = "streets_line_solid.png",
  flip_required = false,
  category = {color = "white", section = "centerlines"},
  dye_needed = {white = 2},
})

streets.register_road_marking({
  name = "solid_white_side_line",
  friendlyname = "Solid White Side Line",
  tex = "streets_line_side_slim.png",
  flip_required = true,
  category = {color = "white", section = "sidelines"},
  dye_needed = {white = 2},
})

streets.register_road_marking({
  name = "solid_white_side_line_wide",
  friendlyname = "Solid White Side Line (Wide)",
  tex = "streets_line_side_thick.png",
  flip_required = true,
  category = {color = "white", section = "sidelines"},
  dye_needed = {white = 3},
})

streets.register_road_marking({
  name = "dashed_white_side_line",
  friendlyname = "Dashed White Side Line",
  tex = "streets_line_side_dashed_slim.png",
  flip_required = true,
  category = {color = "white", section = "sidelines"},
  dye_needed = {white = 1},
})

streets.register_road_marking({
  name = "dashed_white_side_line_wide",
  friendlyname = "Dashed White Side Line (Wide)",
  tex = "streets_line_side_dashed_thick.png",
  flip_required = true,
  category = {color = "white", section = "sidelines"},
  dye_needed = {white = 2},
})

streets.register_road_marking({
  name = "solid_white_side_line_corner",
  friendlyname = "Solid White Side Line Corner",
  tex = "streets_line_edge_slim.png",
  flip_required = true,
  category = {color = "white", section = "sidelines"},
  dye_needed = {white = 3},
})

streets.register_road_marking({
  name = "solid_white_side_line_wide_corner",
  friendlyname = "Solid White Side Line (Wide) Corner",
  tex = "streets_line_edge_thick.png",
  flip_required = true,
  category = {color = "white", section = "sidelines"},
  dye_needed = {white = 4},
})

streets.register_road_marking({
  name = "double_solid_white_center_line",
  friendlyname = "Double Solid White Center Line",
  tex = "streets_line_solid_double.png",
  flip_required = false,
  category = {color = "white", section = "centerlines"},
  dye_needed = {white = 4},
})

streets.register_road_marking({
  name = "double_dashed_white_center_line",
  friendlyname = "Double Dashed White Center Line",
  tex = "streets_line_dashed_double.png",
  flip_required = false,
  category = {color = "white", section = "centerlines"},
  dye_needed = {white = 2},
})

streets.register_road_marking({
  name = "mixed_white_center_line",
  friendlyname = "Solid/Dashed White Center Line",
  tex = "streets_line_mixed_double.png",
  flip_required = true,
  category = {color = "white", section = "centerlines"},
  dye_needed = {white = 3},
})

streets.register_road_marking({
  name = "solid_white_stripe",
  friendlyname = "Solid White Stripe",
  tex = "streets_crosswalk.png",
  flip_required = false,
  category = {color = "white", section = "other"},
  dye_needed = {white = 4},
})

streets.register_road_marking({
  name = "white_arrow_straight",
  friendlyname = "White Arrow (straight)",
  tex = "streets_arrow_straight.png",
  flip_required = false,
  category = {color = "white", section = "arrows"},
  dye_needed = {white = 2},
})

streets.register_road_marking({
  name = "white_arrow_left",
  friendlyname = "White Arrow (left)",
  tex = "streets_arrow_left.png",
  flip_required = false,
  category = {color = "white", section = "arrows"},
  dye_needed = {white = 2},
})

streets.register_road_marking({
  name = "white_arrow_right",
  friendlyname = "White Arrow (right)",
  tex = "streets_arrow_right.png",
  flip_required = false,
  category = {color = "white", section = "arrows"},
  dye_needed = {white = 2},
})

streets.register_road_marking({
  name = "white_arrow_left_straight",
  friendlyname = "White Arrow (left+straight)",
  tex = "streets_arrow_straightleft.png",
  flip_required = false,
  category = {color = "white", section = "arrows"},
  dye_needed = {white = 3},
})

streets.register_road_marking({
  name = "white_arrow_straight_right",
  friendlyname = "White Arrow (straight+right)",
  tex = "streets_arrow_straightright.png",
  flip_required = false,
  category = {color = "white", section = "arrows"},
  dye_needed = {white = 3},
})

streets.register_road_marking({
  name = "white_arrow_left_straight_right",
  friendlyname = "White Arrow (left+straight+right)",
  tex = "streets_arrow_straightleftright.png",
  flip_required = false,
  category = {color = "white", section = "arrows"},
  dye_needed = {white = 4},
})

streets.register_road_marking({
  name = "white_arrow_left_right",
  friendlyname = "White Arrow (left+right)",
  tex = "streets_arrow_leftright.png",
  flip_required = false,
  category = {color = "white", section = "arrows"},
  dye_needed = {white = 3},
})

streets.register_road_marking({
  name = "white_parking",
  friendlyname = "White Parking",
  tex = "streets_parking.png",
  flip_required = false,
  category = {color = "white", section = "symbols"},
  dye_needed = {white = 3},
})

streets.register_road_marking({
  name = "solid_white_diagonal_line",
  friendlyname = "Solid White Diagonal Line",
  tex = "streets_zigzag.png",
  flip_required = true,
  category = {color = "white", section = "other"},
  dye_needed = {white = 2},
})

streets.register_road_marking({
  name = "double_solid_white_diagonal_line",
  friendlyname = "Double Solid White Diagonal Line",
  tex = "streets_forbidden.png",
  flip_required = true,
  category = {color = "white", section = "other"},
  dye_needed = {white = 4},
})

streets.register_road_marking({
  name = "white_x",
  friendlyname = "White X",
  tex = "streets_cross.png",
  flip_required = false,
  category = {color = "white", section = "symbols"},
  dye_needed = {white = 4},
})

streets.register_road_marking({
  name = "dashed_yellow_center_line",
  friendlyname = "Dashed Yellow Center Line",
  tex = "streets_line_dashed_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 1},
})

streets.register_road_marking({
  name = "solid_yellow_center_line",
  friendlyname = "Solid Yellow Center Line",
  tex = "streets_line_solid_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 2},
})

streets.register_road_marking({
  name = "solid_yellow_side_line",
  friendlyname = "Solid Yellow Side Line",
  tex = "streets_line_side_slim_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "sidelines"},
  dye_needed = {yellow = 2},
})

streets.register_road_marking({
  name = "solid_yellow_side_line_wide",
  friendlyname = "Solid Yellow Side Line (Wide)",
  tex = "streets_line_side_thick_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "sidelines"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "dashed_yellow_side_line",
  friendlyname = "Dashed Yellow Side Line",
  tex = "streets_line_side_dashed_slim_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "sidelines"},
  dye_needed = {yellow = 1},
})

streets.register_road_marking({
  name = "dashed_yellow_side_line_wide",
  friendlyname = "Dashed Yellow Side Line (Wide)",
  tex = "streets_line_side_dashed_thick_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "sidelines"},
  dye_needed = {yellow = 2},
})

streets.register_road_marking({
  name = "solid_yellow_side_line_corner",
  friendlyname = "Solid Yellow Side Line Corner",
  tex = "streets_line_edge_slim_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "sidelines"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "solid_yellow_side_line_wide_corner",
  friendlyname = "Solid Yellow Side Line (Wide) Corner",
  tex = "streets_line_edge_thick_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "sidelines"},
  dye_needed = {yellow = 4},
})

streets.register_road_marking({
  name = "double_solid_yellow_center_line",
  friendlyname = "Double Solid Yellow Center Line",
  tex = "streets_line_solid_double_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 4},
})

streets.register_road_marking({
  name = "double_dashed_yellow_center_line",
  friendlyname = "Double Dashed Yellow Center Line",
  tex = "streets_line_dashed_double_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 2},
})

streets.register_road_marking({
  name = "mixed_yellow_center_line",
  friendlyname = "Solid/Dashed Yellow Center Line",
  tex = "streets_line_mixed_double_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "solid_yellow_stripe",
  friendlyname = "Solid Yellow Stripe",
  tex = "streets_crosswalk_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "other"},
  dye_needed = {yellow = 4},
})

streets.register_road_marking({
  name = "yellow_arrow_straight",
  friendlyname = "Yellow Arrow (straight)",
  tex = "streets_arrow_straight_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "arrows"},
  dye_needed = {yellow = 2},
})

streets.register_road_marking({
  name = "yellow_arrow_left",
  friendlyname = "Yellow Arrow (left)",
  tex = "streets_arrow_left_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "arrows"},
  dye_needed = {yellow = 2},
})

streets.register_road_marking({
  name = "yellow_arrow_right",
  friendlyname = "Yellow Arrow (right)",
  tex = "streets_arrow_right_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "arrows"},
  dye_needed = {yellow = 2},
})

streets.register_road_marking({
  name = "yellow_arrow_left_straight",
  friendlyname = "Yellow Arrow (left+straight)",
  tex = "streets_arrow_straightleft_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "arrows"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "yellow_arrow_straight_right",
  friendlyname = "Yellow Arrow (straight+right)",
  tex = "streets_arrow_straightright_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "arrows"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "yellow_arrow_left_straight_right",
  friendlyname = "Yellow Arrow (left+straight+right)",
  tex = "streets_arrow_straightleftright_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "arrows"},
  dye_needed = {yellow = 4},
})

streets.register_road_marking({
  name = "yellow_arrow_left_right",
  friendlyname = "Yellow Arrow (left+right)",
  tex = "streets_arrow_leftright_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "arrows"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "yellow_parking",
  friendlyname = "Yellow Parking",
  tex = "streets_parking_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "symbols"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "solid_yellow_diagonal_line",
  friendlyname = "Solid Yellow Diagonal Line",
  tex = "streets_zigzag_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "other"},
  dye_needed = {yellow = 2},
})

streets.register_road_marking({
  name = "double_solid_yellow_diagonal_line",
  friendlyname = "Double Solid Yellow Diagonal Line",
  tex = "streets_forbidden_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "other"},
  dye_needed = {yellow = 4},
})

streets.register_road_marking({
  name = "yellow_x",
  friendlyname = "Yellow X",
  tex = "streets_cross_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "symbols"},
  dye_needed = {yellow = 4},
})

streets.register_road_marking({
  name = "solid_yellow_center_line_corner",
  friendlyname = "Solid Yellow Center Line Corner",
  tex = "streets_rw_solid_curve.png",
  flip_required = true,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 3},
})


streets.register_road_marking({
  name = "solid_yellow_center_line_tjunction",
  friendlyname = "Solid Yellow Center Line T-Junction",
  tex = "streets_rw_solid_tjunction.png",
  flip_required = true,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 4},
})


streets.register_road_marking({
  name = "solid_yellow_center_line",
  friendlyname = "Solid Yellow Center Line Crossing",
  tex = "streets_rw_solid_crossing.png",
  flip_required = false,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 5},
})

streets.register_road_marking({
  name = "double_yellow_center_line_wide",
  friendlyname = "Double Solid Yellow Center Line (Wide)",
  tex = "streets_line_solid_double_wide_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 5},
})

streets.register_road_marking({
  name = "solid_yellow_center_line_wide",
  friendlyname = "Solid Yellow Center Line (Wide)",
  tex = "streets_line_solid_wide_yellow.png",
  flip_required = false,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "solid_yellow_center_line_wide_corner",
  friendlyname = "Solid Yellow Center Line (Wide) Corner",
  tex = "streets_line_solid_wide_yellow_corner.png",
  flip_required = true,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 3},
})

streets.register_road_marking({
  name = "double_yellow_center_line_wide_corner",
  friendlyname = "Double Solid Yellow Center Line (Wide) Corner",
  tex = "streets_line_solid_double_wide_yellow_corner.png",
  flip_required = true,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 5},
})

streets.register_road_marking({
  name = "solid_yellow_center_line_wide_offset",
  friendlyname = "Solid Yellow Center Line (Wide, Offset)",
  tex = "streets_line_solid_offset_wide_yellow.png",
  flip_required = true,
  category = {color = "yellow", section = "centerlines"},
  dye_needed = {yellow = 3},
})
