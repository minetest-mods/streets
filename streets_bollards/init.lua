--[[
  ## StreetsMod 2.0 ##
  Submod: bollards
  Optional: true
]]

local function on_rightlick(pos, node, clicker, itemstack, pointed_thing)
  if minetest.registered_nodes[minetest.get_node(pointed_thing.above).name].bollard then
    local top = minetest.registered_nodes[minetest.get_node(pointed_thing.above).name]
    minetest.set_node(pointed_thing.above, {name = top.bollard.counterpart})
  end
end

minetest.register_node("streets:bollard_driver", {
  description = "Driver for bollards",
  tiles = {"default_steel_block.png", "streets_bollard_top.png"},
  groups = {cracky = 1},
  on_rightclick = on_rightlick,
  mesecons = {
      effector = {
    		rules = mesecon.rules.default,
    		action_change = function (pos, node)
    			on_rightlick(pos, node, nil, nil, {type = "node", under = vector.add(pos, vector.new(0, -1, 0)), above = vector.add(pos, vector.new(0, 1, 0))})
    		end
	}}
})

minetest.register_node("streets:bollard_steel_standard_up", {
  description = "Steel bollard",
  tiles = {"streets_bollard_top.png", "streets_bollard_top.png", "streets_bollard_side.png"},
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
    counterpart = "streets:bollard_steel_standard_down"
  }
})

minetest.register_node("streets:bollard_steel_standard_down", {
  tiles = {"streets_bollard_top.png", "streets_bollard_top.png", "streets_bollard_side.png"},
  groups = {cracky = 1},
  drop = "streets:bollard_steel_standard_up",
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
    counterpart = "streets:bollard_steel_standard_up"
  }
})
