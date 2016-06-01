--[[
	## StreetsMod 2.0 ##
	Submod: bollards
	Optional: true
]]

local function toggle_bollard(pos, node, clicker, itemstack, pointed_thing)
	if minetest.registered_nodes[minetest.get_node(pos).name].bollard then
		local n = minetest.get_node(pos)
		local ndef = minetest.registered_nodes[n.name]
		minetest.set_node(pos, {name = ndef.bollard.counterpart, param2 = n.param2})
	end
end

minetest.register_node("streets:bollard_driver", {
	description = "Driver for Bollards",
	tiles = {"streets_bollard_driver_top.png", "default_steel_block.png"},
	groups = {cracky = 1},
	-- on_rightclick = toggle_bollard, -- Automatic bollards mustn't be toggled manually!
	mesecons = {
			effector = {
				rules = mesecon.rules.default,
				action_change = function (pos, node)
					toggle_bollard(vector.add(pos, vector.new(0, 1, 0)), node, nil, nil, {type = "node", under = vector.add(pos, vector.new(0, -1, 0)), above = vector.add(pos, vector.new(0, 1, 0))})
				end
	}}
})

minetest.register_node("streets:bollard_steel_automatic_up", {
	description = "Steel Bollard",
	tiles = {"streets_bollard_driver_top.png", "streets_bollard_driver_top.png", "streets_bollard_automatic_side.png"},
	groups = {cracky = 1},
	paramtype = "light",
	drawtype = "nodebox",
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, 0.5, 0.3125}
		}
	},
	bollard = {
		role = "up",
		counterpart = "streets:bollard_steel_automatic_down"
	}
})

minetest.register_node("streets:bollard_steel_automatic_down", {
	tiles = {"streets_bollard_driver_top.png", "streets_bollard_driver_top.png", "streets_bollard_automatic_side.png"},
	groups = {cracky = 1,not_in_creative_inventory = 1},
	drop = "streets:bollard_steel_automatic_up",
	paramtype = "light",
	drawtype = "nodebox",
	walkable = false,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.5, -0.3125, 0.3125, -0.4375, 0.3125}
		}
	},
	bollard = {
		role = "down",
		counterpart = "streets:bollard_steel_automatic_up"
	}
})

minetest.register_node("streets:bollard_steel_manual_up", {
	description = "Manual Bollard",
	tiles = {"streets_bollard_manual_top.png", "streets_bollard_manual_top.png", "streets_bollard_manual_side.png"},
	groups = {cracky = 1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	sunlight_propagates = true,
	on_rightclick = toggle_bollard,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.5, 0.125}
		}
	},
	bollard = {
		role = "up",
		counterpart = "streets:bollard_steel_manual_down"
	}
})

minetest.register_node("streets:bollard_steel_manual_down", {
	tiles = {"streets_bollard_manual_side_down.png", "streets_bollard_manual_side_down.png^[transformR180", "streets_bollard_manual_side_down.png^[transformR270", "streets_bollard_manual_side_down.png^[transformR90", "streets_bollard_manual_top.png",
},
	groups = {cracky = 1,not_in_creative_inventory = 1},
	drop = "streets:bollard_steel_manual_up",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	walkable = false,
	sunlight_propagates = true,
	on_rightclick = toggle_bollard,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, 0.125, 0.125, -0.25, 1.00}
		}
	},
	bollard = {
		role = "down",
		counterpart = "streets:bollard_steel_manual_up"
	}
})
