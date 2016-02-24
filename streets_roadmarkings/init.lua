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
  craft = {
    {"?", "dye:white", "?"},
    {"?", "?", "?"},
    {"?", "dye:white", "?"}
  }
})
