--[[
  ## StreetsMod 2.0 ##
  Submod: roadworks
  Optional: true
]]

minetest.register_node(":streets:asphalt_workshop", {
	tiles = {"default_wood.png",},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
  groups = {cracky = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, 0.375, -0.1875, 0.4375, 0.4375, -0.125}, -- rail
			{-0.125, 0.3125, -0.25, -0.0625, 0.375, -0.0625}, -- sprayer
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- sideL
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- sideR
			{-0.4375, 0.3125, -0.5, -0.375, 0.375, 0.5}, -- railLB
			{-0.4375, 0.4375, -0.5, -0.375, 0.5, 0.5}, -- railLT
			{-0.4375, 0.375, -0.5, -0.375, 0.4375, -0.4375}, -- railLF
			{-0.4375, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- sideR
			{0.375, 0.3125, -0.5, 0.4375, 0.375, 0.5}, -- railRB
			{0.375, 0.4375, -0.5, 0.4375, 0.5, 0.5}, -- railRT
			{0.375, 0.375, -0.5, 0.4375, 0.4375, -0.4375}, -- railRF
			{-0.4375, 0.375, 0.375, -0.375, 0.4375, 0.4375}, -- railLB
			{0.375, 0.3125, 0.375, 0.4375, 0.375, 0.4375}, -- railRB
			{-0.5, -0.5, -0.5, -0.375, 0.3125, 0.4375}, -- sideL2
			{0.375, -0.5, -0.5, 0.4375, 0.3125, 0.4375}, -- sideR2
			{-0.4375, -0.5, -0.4375, 0.4375, -0.1875, 0.4375}, -- body
		}
	},
	selection_box = {
		type = "regular"
	},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
    local meta = minetest.get_meta(pos)
	end
})
