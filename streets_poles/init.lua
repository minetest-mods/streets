local remove_item = function(inventory, itemstack, wield_index)
	if itemstack:get_count() > 0 then
		itemstack:take_item()
		return true
	end
	for i = 1, inventory:get_size("main") do
		if i ~= wield_index then
			local stack = inventory:get_stack("main", i)
			if stack and stack:get_name() == "streets:pole" then
				stack:take_item()
				inventory:set_stack("main", i, stack)
				return true
			end
		end
	end
	return false
end

minetest.register_node(":streets:pole", {
	description = "Pole\n\n(Shift-click to place 3)",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 2, oddly_breakable_by_hand = 1, pole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.1, -0.5, -0.5, 0.1, 0.5, -0.4 }
		},
	},
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
				{ x = 0, y = -2, z = 0 }
			}
		}
	},
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		if not placer then
			return
		end
		local player_name = placer and placer:get_player_name()
		if not player_name then
			return
		end
		if not (creative and creative.is_enabled_for(player_name)) then
			itemstack:take_item()
		end
		if placer:get_player_control().sneak then
			local node = minetest.get_node_or_nil(pos)
			if not node then
				return true
			end
			local above_pos = { x = pos.x, y = pos.y + 1, z = pos.z }
			local above_node = minetest.get_node_or_nil(above_pos)
			if not above_node then
				return true
			end
			if minetest.registered_nodes[above_node.name].buildable_to then
				if minetest.is_protected(above_pos, player_name) and not minetest.check_player_privs(player_name, { protection_bypass = true }) then
					minetest.record_protection_violation(above_pos, player_name)
					return true
				end
				local inv = placer:get_inventory()
				local wield_index = placer:get_wield_index()
				if (creative and creative.is_enabled_for(player_name)) or remove_item(inv, itemstack, wield_index) then
					minetest.set_node(above_pos, node)
				else
					return true
				end
				local above_pos2 = { x = pos.x, y = pos.y + 2, z = pos.z }
				local above_node2 = minetest.get_node_or_nil(above_pos2)
				if not above_node2 then
					return true
				end
				if minetest.registered_nodes[above_node2.name].buildable_to then
					if minetest.is_protected(above_pos2, player_name) and not minetest.check_player_privs(player_name, { protection_bypass = true }) then
						minetest.record_protection_violation(above_pos2, player_name)
						return true
					end
					if (creative and creative.is_enabled_for(player_name)) or remove_item(inv, itemstack, wield_index) then
						minetest.set_node(above_pos2, node)
					else
						return true
					end
				end
			end
		end
		return true
	end,
	after_dig_node = function(pos, node, metadata, digger)
		if default then
			default.dig_up(pos, node, digger)
		end
	end,
})

minetest.register_node(":streets:bigpole", {
	description = "Pole Straight",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
				{ x = 0, y = -2, z = 0 }
			}
		}
	},
	streets_pole_connection = {
		[0] = { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		[1] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
		[2] = { 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		[3] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 },
		["t"] = { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 }
	}
})

minetest.register_craft({
	output = "streets:bigpole 3",
	recipe = {
		{ "default:steel_ingot" },
		{ "default:steel_ingot" }
	}
})


minetest.register_node(":streets:bigpole_short", {
	description = "Pole Short",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		[1] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 },
		[2] = { 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		[3] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0 },
		["t"] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
	}
})

minetest.register_craft({
	output = "streets:bigpole_short 2",
	recipe = {
		{ "streets:bigpole" }
	}
})


minetest.register_node(":streets:bigpole_edge", {
	description = "Pole Edge",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 },
			{ -0.15, -0.15, -0.15, 0.15, 0.15, -0.5 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0 },
		[1] = { 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1 },
		[2] = { 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0 },
		[3] = { 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0 },
		["t"] = { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0 }
	}
})

minetest.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{ "streets:bigpole", "streets:bigpole" },
		{ "streets:bigpole", "" }
	}
})

minetest.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{ "streets:bigpole", "streets:bigpole" },
		{ "", "streets:bigpole" }
	}
})


minetest.register_node(":streets:bigpole_tjunction", {
	description = "Pole T-Junction",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 },
			{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 },
		[1] = { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1 },
		[2] = { 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 },
		[3] = { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1 },
		["t"] = { 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0 }
	}
})

minetest.register_craft({
	output = "streets:bigpole_tjunction",
	recipe = {
		{ "streets:bigpole_edge", "streets:bigpole_short" },
	}
})


minetest.register_node(":streets:bigpole_corner", {
	description = "Pole Corner",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.15, 0.15 },
			{ -0.15, -0.15, -0.15, 0.15, 0.15, -0.5 },
			{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0 },
		[1] = { 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1 },
		[2] = { 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1 },
		[3] = { 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1, 0 },
		["t"] = { 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0 }
	}
})

minetest.register_craft({
	output = "streets:bigpole_corner",
	recipe = {
		{ "streets:bigpole_edge" },
		{ "streets:bigpole_short" }
	}
})


minetest.register_node(":streets:bigpole_four_side_junction", {
	description = "Pole 4-Side-Junction",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
			{ -0.15, -0.15, -0.15, 0.15, 0.15, -0.5 },
			{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0 },
		[1] = { 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1 },
		[2] = { 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1 },
		[3] = { 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0 },
		["t"] = { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1 }
	}
})

minetest.register_craft({
	output = "streets:bigpole_four_side_junction",
	recipe = {
		{ "streets:bigpole_short" },
		{ "streets:bigpole_corner" }
	}
})


minetest.register_node(":streets:bigpole_cross", {
	description = "Pole Cross",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
			{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 },
		[1] = { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1 },
		[2] = { 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 },
		[3] = { 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1 },
		["t"] = { 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1 }
	}
})

minetest.register_craft({
	output = "streets:bigpole_cross",
	recipe = {
		{ "", "streets:bigpole_short", "" },
		{ "streets:bigpole_short", "", "streets:bigpole_short" },
		{ "", "streets:bigpole_short", "" },
	}
})


minetest.register_node(":streets:bigpole_five_side_junction", {
	description = "Pole 5-Side-Junction",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
			{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 },
			{ -0.15, -0.15, -0.15, 0.5, 0.15, 0.15 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0 },
		[1] = { 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1 },
		[2] = { 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1 },
		[3] = { 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1 },
		["t"] = { 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1 }
	}
})

minetest.register_craft({
	output = "streets:bigpole_five_side_junction",
	recipe = {
		{ "streets:bigpole_cross", "streets:bigpole_short" }
	}
})


minetest.register_node(":streets:bigpole_all_sides", {
	description = "Pole All Sides",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = { "streets_pole.png" },
	sunlight_propagates = true,
	groups = { cracky = 1, --[[level = 2, ]]bigpole = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.15, -0.5, -0.15, 0.15, 0.5, 0.15 },
			{ -0.15, -0.15, -0.5, 0.15, 0.15, 0.5 },
			{ -0.5, -0.15, -0.15, 0.5, 0.15, 0.15 }
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = {
				{ x = 0, y = 0, z = -1 },
				{ x = 0, y = 0, z = 1 },
				{ x = 1, y = 0, z = 0 },
				{ x = -1, y = 0, z = 0 },
				{ x = 0, y = -1, z = 0 },
				{ x = 0, y = 1, z = 0 },
			}
		}
	},
	streets_pole_connection = {
		[0] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		[1] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		[2] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		[3] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		["t"] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		["b"] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
	}
})

minetest.register_craft({
	output = "streets:bigpole_all_sides",
	recipe = {
		{ "streets:bigpole_short", "streets:bigpole_cross", "streets:bigpole_short" }
	}
})
