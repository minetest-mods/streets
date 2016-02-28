--[[
  ## StreetsMod 2.0 ##
  Submod: roadsurface
  Optional: true
  Category: Roads
]]

streets.register_road_surface(":streets:asphalt", {
  description = "Asphalt",
  tiles = {"streets_asphalt.png"},
  groups = {cracky = 3},
  sounds = default.node_sound_stone_defaults(),
  aka = {},
  craft = {
    output = "streets:asphalt 1",
    type = "cooking",
		recipe 	= "default:gravel",
		cooktime = 2
  }
})

streets.register_road_surface(":streets:asphalt_red", {
  description = "Colored Asphalt",
  tiles = {"streets_asphalt_red.png"},
  groups = {cracky = 3},
  sounds = default.node_sound_stone_defaults(),
  aka = {},
  craft = {
    output = "streets:asphalt_red 1",
    type = "shapeless",
    recipe = {"streets:asphalt", "dye:red"}
  }
})

streets.register_road_surface(":streets:asphalt_yellow", {
  description = "Colored Asphalt",
  tiles = {"streets_asphalt_yellow.png"},
  groups = {cracky = 3},
  sounds = default.node_sound_stone_defaults(),
  aka = {},
  craft = {
    output = "streets:asphalt_yellow 1",
    type = "shapeless",
    recipe = {"streets:asphalt", "dye:yellow"}
  }
})
