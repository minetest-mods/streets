--[[
  ## StreetsMod 2.0 ##
  Submod: streetsapi
  Optional: false
  Category: Init
]]

local function copytable(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[copytable(orig_key)] = copytable(orig_value)
		end
		setmetatable(copy, copytable(getmetatable(orig)))
	else
		copy = orig
	end
	return copy
end

local register_surface_nodes = function(friendlyname,name,tiles,groups,sounds,craft)
	minetest.register_node(":streets:"..name,{
		description = friendlyname,
		tiles = tiles,
		groups = groups,
		sounds = sounds
	})
	minetest.register_craft(craft)
	if minetest.get_modpath("moreblocks") then
		stairsplus:register_all("streets",name,"streets:"..name,{
			description = friendlyname,
			tiles = tiles,
			groups = groups,
			sounds = sounds
		})
	end
end

local register_sign_node = function(friendlyname,name,tiles,thickness)
	minetest.register_node(":streets:"..name,{
		description = friendlyname,
		tiles = tiles,
		groups = {cracky = 3},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		inventory_image = tiles[6],
		after_place_node = function(pos)
			local behind_pos = {x = pos.x, y = pos.y, z = pos.z}
			local node = minetest.get_node(pos)
			local param2 = node.param2
			if param2 == 0 then
				behind_pos.z = behind_pos.z + 1
			elseif param2 == 1 then
				behind_pos.x = behind_pos.x + 1
			elseif param2 == 2 then
				behind_pos.z = behind_pos.z - 1
			elseif param2 == 3 then
				behind_pos.x = behind_pos.x - 1
			end
			local behind_node = minetest.get_node(behind_pos)
			if behind_node.name:sub(1,15) == "streets:bigpole" then
				node.name = node.name.."_polemount"
				minetest.set_node(pos,node)
			end
		end,
		node_box = {
			type = "fixed",
				fixed = {-1/2, -1/2, 0.5, 1/2, 1/2, 0.5 - thickness}
		},
		selection_box = {
			type = "fixed",
				fixed = {-1/2, -1/2, 0.5, 1/2, 1/2, math.min(0.5 - thickness,0.45)}
		}
	})
	minetest.register_node(":streets:"..name.."_polemount",{
		tiles = tiles,
		groups = {cracky = 3,not_in_creative_inventory = 1},
		drop = "streets:"..name,
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
				fixed = {-1/2, -1/2, 0.85 - thickness, 1/2, 1/2, 0.85}
		},
		selection_box = {
			type = "fixed",
				fixed = {-1/2, -1/2, math.min(0.85 - thickness,0.80), 1/2, 1/2, 0.85}
		}
	})
end

local register_marking_nodes = function(surface_friendlyname,surface_name,surface_tiles,surface_groups,surface_sounds,friendlyname,name,tex)
	minetest.register_node(":streets:mark_"..name,{
		description = "Marking Overlay: "..friendlyname,
		tiles = {tex,"streets_transparent.png"},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
		sunlight_propagates = true,
		walkable = false,
		inventory_image = tex,
		wield_image = tex,
		after_place_node = function(pos)
			local node = minetest.get_node(pos)
			local lower_pos = {x = pos.x, y = pos.y-1, z = pos.z}
			local lower_node = minetest.get_node(lower_pos)
			local lower_node_is_asphalt = minetest.registered_nodes[lower_node.name].groups.asphalt and streets.surfaces.surfacetypes[lower_node.name]
			if lower_node_is_asphalt then
				local lower_node_basename = streets.surfaces.surfacetypes[lower_node.name].name
				lower_node.name = "streets:mark_"..(node.name:sub(14)).."_on_"..lower_node_basename
				lower_node.param2 = node.param2
				minetest.set_node(lower_pos,lower_node)
				minetest.remove_node(pos)
			end
		end,				
		node_box = {
			type = "fixed",
			fixed = {-0.5,-0.5,-0.5,0.5,-0.499,0.5}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2}
		}
	})
	local tiles = {}
	tiles[1] = surface_tiles[1]
	tiles[2] = surface_tiles[2] or surface_tiles[1] --If less than 6 textures are used, this'll "expand" them to 6
	tiles[3] = surface_tiles[3] or surface_tiles[1]
	tiles[4] = surface_tiles[4] or surface_tiles[1]
	tiles[5] = surface_tiles[5] or surface_tiles[1]
	tiles[6] = surface_tiles[6] or surface_tiles[1]
	tiles[1] = tiles[1].."^"..tex
	tiles[5] = tiles[5].."^"..tex.."^[transformR180"
	tiles[6] = tiles[6].."^"..tex
	local groups = copytable(surface_groups)
	groups.not_in_creative_inventory = 1
	minetest.register_node(":streets:mark_"..name.."_on_"..surface_name,{
		description = surface_friendlyname.." With Marking: "..friendlyname,
		groups = groups,
		sounds = surface_sounds,
		tiles = tiles,
		paramtype2 = "facedir"
	})
	minetest.register_craft({
		output = "streets:mark_"..name.."_on_"..surface_name,
		type = "shapeless",
		recipe = {"streets:"..surface_name,"streets:mark_"..name}
	})
	if minetest.get_modpath("moreblocks") or minetest.get_modpath("stairsplus") then
		stairsplus:register_all("streets", name.."_on_"..surface_name, "streets:mark_"..name.."_on_"..surface_name, {
			description = surface_friendlyname.." with Marking: "..friendlyname,
			tiles = tiles,
			groups = surface_groups,
			sounds = surface_sounds
		})
	end
end

if streets.surfaces.surfacetypes then
	for _,v in pairs(streets.surfaces.surfacetypes) do
		register_surface_nodes(v.friendlyname,v.name,v.tiles,v.groups,v.sounds,v.craft)
		if streets.labels.labeltypes then
			for _,w in pairs(streets.labels.labeltypes) do
				register_marking_nodes(v.friendlyname,v.name,v.tiles,v.groups,v.sounds,w.friendlyname,w.name,w.tex)
			end
		end
	end
end

if streets.signs.signtypes then
	for _,v in pairs(streets.signs.signtypes) do
		register_sign_node(v.friendlyname,v.name,v.tiles,v.thickness)
	end
end
