--[[
  ## StreetsMod 2.0 ##
  Submod: roadmarkings
  Optional: true
  Category: Roads
]]

streets.register_road_marking({
  suffix = "line_dashed",
  friendly_suffix = "dashed line",
  overlay = "streets_line_dashed.png",
  aka = {},
  craft = {
    {"?", "dye:white", "?"},
    {"?", "?", "?"},
    {"?", "dye:white", "?"}
  }
})

streets.register_road_marking({
  suffix = "line_solid",
  friendly_suffix = "solid line",
  overlay = "streets_line_solid.png",
  aka = {},
  craft = {
    {"?", "dye:white", "?"},
    {"?", "dye:white", "?"},
    {"?", "dye:white", "?"}
  }
})

streets.register_road_marking({
  suffix = "side_slim",
  friendly_suffix = "slim line",
  overlay = "streets_line_side_slim.png",
  aka = {},
  craft = {
    {"?", "?", "dye:white"},
    {"?", "?", "dye:white"},
    {"?", "?", "dye:white"}
  }
})

streets.register_road_marking({
  suffix = "side_thick",
  friendly_suffix = "thick line",
  overlay = "streets_line_side_thick.png",
  aka = {},
  craft = {
    {"?", "dye:white", "dye:white"},
    {"?", "dye:white", "dye:white"},
    {"?", "dye:white", "dye:white"}
  }
})

streets.register_road_marking({
  suffix = "side_dashed_slim",
  friendly_suffix = "slim dashed line",
  overlay = "streets_line_side_dashed_slim.png",
  aka = {},
  craft = {
    {"?", "?", "dye:white"},
    {"?", "?", "?"},
    {"?", "?", "dye:white"}
  }
})

streets.register_road_marking({
  suffix = "side_dashed_thick",
  friendly_suffix = "thick dashed line",
  overlay = "streets_line_side_dashed_thick.png",
  aka = {},
  craft = {
    {"?", "dye:white", "dye:white"},
    {"?", "?", "?"},
    {"?", "dye:white", "dye:white"}
  }
})

streets.register_road_marking({
  suffix = "edge_slim",
  friendly_suffix = "slim edge line",
  overlay = "streets_line_edge_slim.png",
  aka = {},
  craft = {
    {"dye:white", "dye:white", "dye:white"},
    {"?", "?", "dye:white"},
    {"?", "?", "dye:white"}
  }
})

streets.register_road_marking({
  suffix = "edge_thick",
  friendly_suffix = "thick edge line",
  overlay = "streets_line_edge_thick.png",
  aka = {},
  craft = {
    {"dye:white", "dye:white", "dye:white"},
    {"dye:white", "dye:white", "dye:white"},
    {"?", "dye:white", "dye:white"}
  }
})
