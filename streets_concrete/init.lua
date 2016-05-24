--[[
  ## StreetsMod 2.0 ##
  Submod: Concrete
  Optional: true
]]

minetest.register_node("streets:concrete", {
  description = "Concrete",
  tiles = {"streets_concrete.png"},
  groups = {cracky = 2, stone = 3},
  sounds =  default.node_sound_stone_defaults()
})

walls.register(":walls:concrete", "Concrete Wall", "streets_concrete.png", "streets:concrete", default.node_sound_stone_defaults())
