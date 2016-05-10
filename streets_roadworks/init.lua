--[[
  ## StreetsMod 2.0 ##
  Submod: roadworks
  Optional: true
]]

minetest.register_node(":streets:rw_cross",{
	description = "Roadworks: Cross",
	tiles = {"streets_cross.png"},
	drawtype = "nodebox",
	paramtype = "light",
	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
	sunlight_propagates = true,
	walkable = false,
	inventory_image = "streets_cross.png",
	wield_image = "streets_cross.png",
  node_box = {
		type = "fixed",
		fixed = box
	},
	selection_box = {
		type = "fixed",
		fixed = sel
	}
})
