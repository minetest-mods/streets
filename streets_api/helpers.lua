streets.helpers = {}

streets.helpers.get_stairsplus_info = function(node_name, base_node_name)
	node_name = node_name:sub(9)
	node_name = node_name:gsub(base_node_name, "")
	local delimiter_pos = node_name:find("_")
	if not delimiter_pos or delimiter_pos < 1 or delimiter_pos > node_name:len() then
		return node_name, ""
	else
		return node_name:sub(1, delimiter_pos - 1), node_name:sub(delimiter_pos + 1)
	end
end

streets.helpers.get_node_info = function(node_name)
	local data = {}
	if node_name:sub(1, 8) ~= "streets:" then
		return data
	end
	local def = minetest.registered_nodes[node_name]
	if not def or type(def.streets) ~= "table" then
		return data
	end
	local base_node_name = ""
	local category = def.streets.category
	if category == "sign" then
		data.category = "sign"
		data.belongs_to = def.streets.belongs_to
		data.name = def.streets.name
		data.variation = def.streets.variation
	elseif category == "surface" then
		base_node_name = streets.roads.build_node_name({
			surface_name = def.streets.surface_name,
			omit_mod_name = true,
		})
		data.category = "surface"
		data.surface_name = def.streets.surface_name
		data.variation = def.streets.variation
	elseif category == "roadmarking" then
		data.category = "roadmarking"
		data.belongs_to = def.streets.belongs_to
		data.roadmarking_name = def.streets.roadmarking_name
	elseif category == "roadmarking_on_surface" then
		local r = def.streets.rotation
		base_node_name = streets.roads.build_node_name({
			belongs_to = def.streets.belongs_to,
			roadmarking_name = def.streets.roadmarking_name,
			surface_name = def.streets.surface_name,
			rotation = ((r ~= "r0") and r),
			omit_mod_name = true,
		})
		data.category = "roadmarking_on_surface"
		data.surface_name = def.streets.surface_name
		data.belongs_to = def.streets.belongs_to
		data.roadmarking_name = def.streets.roadmarking_name
		data.rotation = r
	end
	if def.streets.stairlike == true and base_node_name ~= "" then
		data.stairlike = true
		data.staircategory, data.stairalternate = streets.helpers.get_stairsplus_info(node_name, base_node_name)
	end
	return data
end


streets.helpers.register_stairs = function(name, def, subset)
	if type(subset) ~= "table" then
		return
	end
	if stairsplus then
		stairsplus:register_custom_subset(subset, "streets", name, "streets:" .. name, def)
	else
		local variations = {
			["slab"] = {
				[""] = {
					description = "Slab (Half)",
					node_box = {
						type = "fixed",
						fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
					},
				},
				["_quarter"] = {
					description = "Slab (Quarter)",
					node_box = {
						type = "fixed",
						fixed = {-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
					},
				},
				["_three_quarter"] = {
					description = "Slab (Three Quarter)",
					node_box = {
						type = "fixed",
						fixed = {-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
					},
				},
			},
			["stair"] = {
				[""] = {
					description = "Stair",
					node_box = {
						type = "fixed",
						fixed = {
							{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
							{-0.5, 0, 0, 0.5, 0.5, 0.5},
						},
					},
				},
			},
			["panel"] = {
				[""] = {
					description = "Panel",
					node_box = {
						type = "fixed",
						fixed = {-0.5, -0.5, 0, 0.5, 0, 0.5},
					},
				}
			}
		}
		def.drawtype = "nodebox"
		def.paramtype = "light"
		def.paramtype2 = def.paramtype2 or "facedir"
		def.on_place = minetest.rotate_node
		for i, variation in pairs(subset) do
			local info = variations[variation[1]][variation[2]]
			if variations[variation[1]][variation[2]] then
				local final_def = table.copy(def)
				final_def.description = final_def.description .. " " .. info.description
				final_def.node_box = info.node_box
				minetest.register_node(":streets:" .. variation[1] .. "_" .. name .. variation[2], final_def)
				if variation[1] == "slab" then
					if variation[2] == "" then
						minetest.register_craft({
							output = "streets:slab_" .. name .. "",
							recipe = {{ "streets:" .. name, "streets:" .. name, "streets:" .. name, }}
						})
						minetest.register_craft({
							type = "shapeless",
							output = "streets:" .. name,
							recipe = { "streets:slab_" .. name, "streets:slab_" .. name }
						})
						minetest.register_craft({
							output = "streets:slab_" .. name,
							recipe = {{ "streets:slab_" .. name .. "_quarter", "streets:slab_" .. name .. "_quarter" }}
						})
						minetest.register_craft({
							output = "streets:slab_" .. name .. " 3",
							recipe = {{ "streets:slab_" .. name .. "_three_quarter", "streets:slab_" .. name .. "_three_quarter" }}
						})
						minetest.register_craft({
							type = "shapeless",
							output = "streets:slab_" .. name .. " 3",
							recipe = { "streets:stair_" .. name, "streets:stair_" .. name }
						})
						minetest.register_craft({
							type = "shapeless",
							output = "streets:slab_" .. name,
							recipe = { "streets:panel_" .. name, "streets:panel_" .. name }
						})
					elseif variation[2] == "_quarter" then
						minetest.register_craft({
							output = "streets:slab_" .. name .. "_quarter 6",
							recipe = {{ "streets:slab_" .. name, "streets:slab_" .. name, "streets:slab_" .. name }}
						})
					elseif variation[2] == "_three_quarter" then
						minetest.register_craft({
							output = "streets:slab_" .. name .. "_three_quarter 3",
							recipe = {
								{ "streets:slab_" .. name .. "_quarter", "streets:slab_" .. name .. "_quarter", "streets:slab_" .. name .. "_quarter" },
								{ "streets:slab_" .. name, "streets:slab_" .. name, "streets:slab_" .. name }
							}
						})
					end
				elseif variation[1] == "stair" and variation[2] == "" then
					minetest.register_craft({
						output = "streets:stair_" .. name .. " 8",
						recipe = {
							{ "streets:" .. name, "", "" },
							{ "streets:" .. name, "streets:" .. name, "" },
							{ "streets:" .. name, "streets:" .. name, "streets:" .. name }
						}
					})
					minetest.register_craft({
						output = "streets:stair_" .. name .. " 8",
						recipe = {
							{ "", "", "streets:" .. name },
							{ "", "streets:" .. name, "streets:" .. name },
							{ "streets:" .. name, "streets:" .. name, "streets:" .. name }
						}
					})
				elseif variation[1] == "panel" and variation[2] == "" then
					minetest.register_craft({
						output = "streets:panel_" .. name .. " 3",
						recipe = {{ "streets:stair_" .. name }}
					})
					minetest.register_craft({
						output = "streets:panel_" .. name .. " 2",
						recipe = {{ "streets:slab_" .. name }}
					})
				end
			end
		end
	end
end

streets.helpers.split_subset = function(subset)
	local rotation_needed_subset = {}
	local no_rotation_subset = {}
	for key, value in pairs(subset) do
		if value[1] == "slab"
				and value[2] ~= "_two_sides"
				and value[2] ~= "_three_sides"
				and value[2] ~= "_three_sides_u" then
			table.insert(no_rotation_subset, value)
		else
			table.insert(rotation_needed_subset, value)
		end
	end
	return rotation_needed_subset, no_rotation_subset
end