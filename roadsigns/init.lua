--[[
	StreetsMod: Poles and signs
]]
streets.workshop = {}

streets.workshop.register_sign  = function(nodename, desc, img, rrecipe, rtime)
	
	minetest.register_node(nodename,{
		description = desc,
		tiles = {img},
		inventory_image = img,
		wield_image = img,
		groups = {snappy = 1,attached_node = 1},
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", desc)
		end,
		drawtype = "nodebox",
		node_box = {
		type = "wallmounted",
		fixed = {
		{-0.4,-0.5,-0.4,0.4,-0.4,0.4}
		}
		},
		paramtype = "light",
		paramtype2 = "wallmounted",
		walkable = false,
		sunlight_propagates = true,
		selection_box = {
		type = "wallmounted"
		},
		streets = {
		signworkshop = {
		recipe = rrecipe,
		time = rtime
		}
		}
	})
end

dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/signs.lua")
dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/workshop.lua")
