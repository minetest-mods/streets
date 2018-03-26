streets.roads = {}

streets.roads.registered_roadmarking_collections = {}
streets.roads.registered_roadmarkings = {}
streets.roads.registered_surfaces = {}

streets.roads.build_node_name = function(def)
	if def.rotation == "r0" then
		def.rotation = nil
	end
	local node_name = ""
	if not def.omit_mod_name then
		if not def.omit_colon then
			node_name = node_name .. ":"
		end
		node_name = node_name .. "streets:"
	end
	if def.staircategory then
		node_name = node_name .. def.staircategory .. "_"
	end
	if def.belongs_to and def.roadmarking_name then
		node_name = node_name .. "roadmarking_" .. def.belongs_to .. "__" .. def.roadmarking_name
		if def.surface_name then
			node_name = node_name .. "__on__"
		end
	end
	if def.surface_name then
		node_name = node_name .. def.surface_name
	end
	if def.rotation then
		node_name = node_name .. "__" .. def.rotation
	end
	if def.variation then
		node_name = node_name .. "__" .. def.variation
	end
	if def.stairalternate and def.stairalternate ~= "" then
		node_name = node_name .. def.stairalternate
	end
	return node_name
end

local register_combination = function(roadmarking_def, surface_def)
	local d = table.copy(surface_def)
	d.description = ( d.description or string.gsub(" " .. d.name:gsub("_", " "), "%W%l", string.upper):sub(2) ) ..
			" with " .. roadmarking_def.description or string.gsub(" " .. roadmarking_def.name:gsub("_", " "), "%W%l", string.upper):sub(2)
	d.groups = d.groups or { cracky = 3, asphalt = 1 }
	d.sounds = d.sounds or default and default.node_sound_stone_defaults()
	d.tiles = { { name = d.tex, color = "#ffffff" } }
	d.overlay_tiles = { roadmarking_def.tex, "", "", "", roadmarking_def.tex .. "^[transformR180", roadmarking_def.tex }
	d.paramtype2 = "colorfacedir"
	d.palette = "streets_roadmarkings_palette.png"
	d.drop = "streets:" .. surface_def.name
	d.streets = {
		category = "roadmarking_on_surface",
		belongs_to = roadmarking_def.belongs_to,
		roadmarking_name = roadmarking_def.name,
		surface_name = surface_def.name
	}

	minetest.register_node(streets.roads.build_node_name({
		belongs_to = roadmarking_def.belongs_to,
		roadmarking_name = roadmarking_def.name,
		surface_name = surface_def.name,
	}), d)

	if type(d.register_all_roadmarking_stairs) == "table" and type(d.register_basic_roadmarking_stairs) == "table" then

		local all_rotation_needed_subset, all_no_rotation_subset = streets.helpers.split_subset(d.register_all_roadmarking_stairs)
		local basic_rotation_needed_subset, basic_no_rotation_subset = streets.helpers.split_subset(d.register_basic_roadmarking_stairs)

		local stairs_def = table.copy(d)
		stairs_def.drop = d.drop:sub(9)
		stairs_def.streets.stairlike = true

		if roadmarking_def.stairs then
			streets.helpers.register_stairs(streets.roads.build_node_name({
				belongs_to = roadmarking_def.belongs_to,
				roadmarking_name = roadmarking_def.name,
				surface_name = surface_def.name,
				omit_mod_name = true,
			}), stairs_def, all_no_rotation_subset)
		end
		if roadmarking_def.basic_stairs then
			streets.helpers.register_stairs(streets.roads.build_node_name({
				belongs_to = roadmarking_def.belongs_to,
				roadmarking_name = roadmarking_def.name,
				surface_name = surface_def.name,
				omit_mod_name = true,
			}), stairs_def, basic_no_rotation_subset)
		end

		for _, r in pairs({ "r0", "r90", "r180", "r270" }) do
			local stairs_def = table.copy(d)
			stairs_def.drop = d.drop:sub(9)
			stairs_def.streets.stairlike = true
			stairs_def.streets.rotation = r
			if r ~= "r0" then
				local overlay_tiles = table.copy(d.overlay_tiles)
				stairs_def.overlay_tiles = {}
				for k, v in ipairs(overlay_tiles) do
					if v == "" then
						table.insert(stairs_def.overlay_tiles, "")
					else
						table.insert(stairs_def.overlay_tiles, v .. "^[transform" .. r:upper())
					end
				end
			end
			if roadmarking_def.stairs and roadmarking_def.stairs[r] then
				streets.helpers.register_stairs(streets.roads.build_node_name({
					belongs_to = roadmarking_def.belongs_to,
					roadmarking_name = roadmarking_def.name,
					surface_name = surface_def.name,
					rotation = ((r ~= "r0") and r),
					omit_mod_name = true,
				}), stairs_def, all_rotation_needed_subset)
			end
			if roadmarking_def.basic_stairs and roadmarking_def.basic_stairs[r] then
				streets.helpers.register_stairs(streets.roads.build_node_name({
					belongs_to = roadmarking_def.belongs_to,
					roadmarking_name = roadmarking_def.name,
					surface_name = surface_def.name,
					rotation = ((r ~= "r0") and r),
					omit_mod_name = true,
				}), stairs_def, basic_rotation_needed_subset)
			end
		end
	end
end

streets.roads.register_roadmarking_collection = function(def)
	streets.roads.registered_roadmarking_collections[def.name] = def
end

streets.roads.register_roadmarking = function(def)
	streets.roads.registered_roadmarkings[def.belongs_to .. ":" .. def.name] = def

	local d = table.copy(def)

	minetest.register_node(streets.roads.build_node_name({
		belongs_to = d.belongs_to,
		roadmarking_name = d.name,
	}), {
		description = "Road Marking Overlay: " .. (d.description or string.gsub(" " .. d.name:gsub("_", " "), "%W%l", string.upper):sub(2)),
		tiles = { d.tex, "streets_transparent.png" },
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "colorfacedir",
		groups = { snappy = 3, oddly_breakable_by_hand = 1, not_in_creative_inventory = 1 },
		sunlight_propagates = true,
		walkable = false,
		inventory_image = d.tex,
		wield_image = d.tex,
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -0.499, 0.5 }
		},
		selection_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, -0.475, 0.5 }
		},
		drop = "",
		palette = "streets_roadmarkings_palette.png",
		streets = {
			category = "roadmarking",
			belongs_to = d.belongs_to,
			roadmarking_name = d.name,
		},
	})

	for _, surface_def in pairs(streets.roads.registered_surfaces) do
		register_combination(def, surface_def)
	end
end

streets.roads.register_surface = function(def)
	streets.roads.registered_surfaces[def.name] = def
	local d = table.copy(def)
	d.description = d.description or string.gsub(" " .. d.name:gsub("_", " "), "%W%l", string.upper):sub(2)
	d.groups = d.groups or { cracky = 3, asphalt = 1 }
	d.sounds = d.sounds or default and default.node_sound_stone_defaults()
	d.tiles = { d.tex }
	d.streets = {
		category = "surface",
		surface_name = d.name,
	}

	minetest.register_node(":streets:" .. def.name, d)
	if type(d.register_base_node_stairs) == "table" then
		local stairs_def = table.copy(d)
		stairs_def.streets.stairlike = true
		streets.helpers.register_stairs(def.name, stairs_def, d.register_base_node_stairs)
	end

	if d.register_variants then
		local stormdrain_def = table.copy(d)
		stormdrain_def.description = stormdrain_def.description .. " Stormdrain"
		stormdrain_def.tiles = { stormdrain_def.tex .. "^streets_stormdrain.png", stormdrain_def.tex }
		stormdrain_def.drawtype = "nodebox"
		stormdrain_def.paramtype = "light"
		stormdrain_def.paramtype2 = "facedir"
		stormdrain_def.groups.asphalt = nil
		stormdrain_def.groups.asphalt_variant = 1
		stormdrain_def.streets.variation = "stormdrain"
		stormdrain_def.node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, -0.4375 }, -- F
				{ -0.5, -0.5, 0.4375, 0.5, 0.5, 0.5 }, -- B
				{ -0.5, -0.5, -0.4375, -0.375, 0.5, 0.4375 }, -- L
				{ 0.375, -0.5, -0.4375, 0.5, 0.5, 0.4375 }, -- R
				{ -0.4375, 0.4375, 0, 0.4375, 0.5, 0.4375 }, -- T1
				{ -0.3125, 0.4375, -0.4375, -0.25, 0.5, 0 }, -- S1
				{ 0.25, 0.4375, -0.4375, 0.3125, 0.5, 0 }, -- S2
				{ -0.1875, 0.4375, -0.4375, -0.125, 0.5, 0 }, -- S3
				{ 0.125, 0.4375, -0.4375, 0.1875, 0.5, 0 }, -- S4
				{ -0.0625, 0.4375, -0.3125, 0.0625, 0.5, 0 }, -- S5
				{ -0.125, 0.4375, -0.375, 0.125, 0.5, -0.3125 }, -- S6
			}
		}
		stormdrain_def.selection_box = {
			type = "regular"
		}
		minetest.register_node(":streets:" .. def.name .. "__stormdrain", stormdrain_def)

		local manhole_def = table.copy(d)
		manhole_def.description = manhole_def.description .. " Manhole"
		manhole_def.tiles = { manhole_def.tex .. "^streets_manhole.png", manhole_def.tex }
		manhole_def.drawtype = "nodebox"
		manhole_def.paramtype = "light"
		manhole_def.paramtype2 = "facedir"
		manhole_def.groups.asphalt = nil
		manhole_def.groups.asphalt_variant = 1
		manhole_def.on_rightclick = function(pos, node, name)
			local name = name:get_player_name()
			if minetest.is_protected(pos, name) and not minetest.check_player_privs(name, { protection_bypass = true }) then
				minetest.record_protection_violation(pos, name)
				return
			end
			local variant = node.name:sub(-13)
			if variant == "_manhole_open" then
				node.name = node.name:sub(1, -6)
			else
				node.name = node.name .. "_open"
			end
			minetest.set_node(pos, node)
		end
		local manhole_def_closed = table.copy(manhole_def)
		local manhole_def_open = table.copy(manhole_def)
		manhole_def_closed.streets.variaiton = "manhole"
		manhole_def_closed.node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, -0.375 }, -- F
				{ -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 }, -- B
				{ -0.5, -0.5, -0.4375, -0.375, 0.5, 0.4375 }, -- L
				{ 0.375, -0.5, -0.4375, 0.5, 0.5, 0.4375 }, -- R
				{ -0.25, 0.4375, -0.25, 0.25, 0.5, 0.25 }, -- CenterPlate
				{ -0.5, 0.4375, -0.0625, 0.5, 0.5, 0.0625 }, -- CenterLR
				{ -0.0625, 0.4375, -0.5, 0.0625, 0.5, 0.5 }, -- CenterFR
			}
		}
		manhole_def_open.climbable = true
		manhole_def_open.drop = "streets:" .. def.name .. "__manhole"
		manhole_def_open.groups.not_in_creative_inventory = 1
		manhole_def_open.streets.variaiton = "manhole_open"
		manhole_def_open.node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0.5, -0.375 }, -- F
				{ -0.5, -0.5, 0.375, 0.5, 0.5, 0.5 }, -- B
				{ -0.5, -0.5, -0.4375, -0.375, 0.5, 0.4375 }, -- L
				{ 0.375, -0.5, -0.4375, 0.5, 0.5, 0.4375 }, -- R
			}
		}
		minetest.register_node(":streets:" .. def.name .. "__manhole", manhole_def_closed)
		minetest.register_node(":streets:" .. def.name .. "__manhole_open", manhole_def_open)
	end

	for _, roadmarking_def in pairs(streets.roads.registered_roadmarkings) do
		register_combination(roadmarking_def, def)
	end
end

streets.roads.get_roadmarking_collection_definition = function(name)
	local def = streets.roads.registered_collections[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.roads.get_roadmarking_definition = function(name)
	local def = streets.roads.registered_roadmarkings[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.roads.get_roadmarking_definitions_by_collection = function(name)
	local definitions = {}
	for k, v in pairs(streets.roads.registered_roadmarkings) do
		if v.belongs_to == name then
			definitions[k] = table.copy(v)
		end
	end
	return definitions
end

streets.roads.get_surface_definition = function(name)
	local def = streets.roads.registered_surfaces[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end