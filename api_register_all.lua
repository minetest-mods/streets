--[[
  ## StreetsMod 2.0 ##
  Submod: streetsapi
  Optional: false
  Category: Init
]]

minetest.after(0, function()
  local surface_list = streets.api.register_road_surfaces
  local marking_list = streets.api.register_road_markings
  -- Loop thorugh the list of surfaces
  for surface_name, surface_definition in pairs(surface_list) do
    -- Register the surface itself (e.g. plain asphalt)
    minetest.register_node(surface_name, surface_definition)
    stairs.register_slab(surface_name:sub(2, -1):split(":")[2], surface_name:sub(2, -1), surface_definition.groups, surface_definition.tiles, surface_definition.description .. " Slab", surface_definition.sounds)
    stairs.register_stair(surface_name:sub(2, -1):split(":")[2], surface_name:sub(2, -1), surface_definition.groups, surface_definition.tiles, surface_definition.description .. " Stair", surface_definition.sounds)
    -- Register for surface alias if given
    if type(surface_definition.aka) == "table" then
      for _, old_name in ipairs(surface_definition.aka) do
        minetest.register_alias(old_name, surface_name)
      end
    end
    -- Register the craft for this surface
    if type(surface_definition.craft) == "table" then
      minetest.register_craft(surface_definition.craft)
    else
      minetest.log("warning", surface_name .. "registered, but no craft recipe specified.")
    end
    -- Loop through the list of markings
    for marking_suffix, marking_data in pairs(marking_list) do
      -- Collect required data for node defintion
      local nn = surface_name .. "_" .. marking_suffix
      local description = surface_definition.description .. " " .. marking_data.friendly_suffix
      local tiles
      local tiles2
      if marking_data.continous == true then
        tiles = {surface_definition.tiles[1] .. "^" .. marking_data.overlay, surface_definition.tiles[1], surface_definition.tiles[1], surface_definition.tiles[1], surface_definition.tiles[1] .. "^" .. marking_data.overlay  .. "^[transformFX", surface_definition.tiles[1] .. "^" .. marking_data.overlay}
        tiles2 = {surface_definition.tiles[1] .. "^" .. marking_data.overlay:split(".")[1] .. "_yellow.png", surface_definition.tiles[1], surface_definition.tiles[1], surface_definition.tiles[1], surface_definition.tiles[1] .. "^" .. marking_data.overlay:split(".")[1] .. "_yellow.png^[transformFX", surface_definition.tiles[1] .. "^" .. marking_data.overlay:split(".")[1] .. "_yellow.png"}
      else
        tiles = {surface_definition.tiles[1] .. "^" .. marking_data.overlay, surface_definition.tiles[1]}
        tiles2 = {surface_definition.tiles[1] .. "^" .. marking_data.overlay:split(".")[1] .. "_yellow.png", surface_definition.tiles[1]}
      end
      local groups = surface_definition.groups
      local sounds = surface_definition.sounds
      -- Replace placeholders in craft recipe
      local craft = table.copy(marking_data.craft)
      local replacement = surface_name:sub(2, -1)
      for i = 1, 3 do
        for j = 1, 3 do
          if craft[i][j] == "?" then craft[i][j] = replacement end
        end
      end
      -- Register the combination of surface and marking
      minetest.register_node(nn, {
        description = description,
        tiles = tiles,
        groups = groups,
        sounds = sounds,
        paramtype = "light",
        paramtype2 = "facedir"
      })
      -- Register stair or slab if allowed in definition
      if marking_data.register_stair == true then
        stairs.register_stair(nn:sub(2, -1):split(":")[2], nn:sub(2, -1), groups, {tiles[1], tiles[2], tiles[2], tiles[2], tiles[2], tiles[1]}, description, sounds)
        if marking_data.flip_required == true then
          stairs.register_stair(nn:sub(2, -1):split(":")[2] .. "_transformFY", nn:sub(2, -1), groups, {tiles[1] .. "^[transformR180", tiles[2], tiles[2], tiles[2], tiles[2], tiles[1] .. "^[transformR180"}, description, sounds)
        end
      end
      if marking_data.register_slab == true and marking_data.continous == true then
        stairs.register_slab(nn:sub(2, -1):split(":")[2], nn:sub(2, -1), groups, {tiles[1], tiles[2], tiles[2], tiles[2], tiles[1] .. "^[transformFX", tiles[1]}, description, sounds)
      end
      if marking_data.register_slab == true and marking_data.continous == false then
        stairs.register_slab(nn:sub(2, -1):split(":")[2], nn:sub(2, -1), groups, {tiles[1], tiles[2]}, description, sounds)
      end
      -- Register the craft for this node
      local craft_output = nn:sub(2, -1)
      minetest.register_craft({
        output = craft_output,
        recipe = craft
      })
      -- Register alias for the marking if given
      if type(marking_data.aka) == "table" then
        for _, old_name in ipairs(marking_data.aka) do
          minetest.register_alias(old_name, craft_output)
        end
      end
      -- Register the yellow version, too
      nn = nn .. "_yellow"
      minetest.register_node(nn, {
        description = description,
        tiles = tiles2,
        groups = groups,
        sounds = sounds,
        paramtype = "light",
        paramtype2 = "facedir"
      })
      -- Get a fresh copy of the craft template
      craft = table.copy(marking_data.craft)
      replacement = surface_name:sub(2, -1)
      -- Replace placeholders and replace white dye by yellow dye
      for i = 1, 3 do
        for j = 1, 3 do
          if craft[i][j] == "?" then craft[i][j] = replacement end
          if craft[i][j] == "dye:white" then craft[i][j] = "dye:yellow" end
        end
      end
      -- Register the craft
      craft_output = nn:sub(2, -1)
      minetest.register_craft({
        output = craft_output,
        recipe = craft
      })
      -- Register the aliass
      if type(marking_data.aka) == "table" then
        for _, old_name in ipairs(marking_data.aka) do
          minetest.register_alias(old_name, craft_output)
        end
      end
    end
  end
  -- Register roadwork markings
  for marking_suffix, marking_data in pairs(marking_list) do
    if marking_data.register_rw == true then
      minetest.register_node(":streets:rw_" .. marking_data.suffix .. "_yellow",{
        description = "Roadworks: " .. marking_data.friendly_suffix:gsub("^%l", string.upper),
        tiles = {marking_data.overlay:split(".")[1] .. "_yellow.png", "streets_transparent.png"},
      	drawtype = "nodebox",
      	paramtype = "light",
      	paramtype2 = "facedir",
      	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
      	sunlight_propagates = true,
      	walkable = false,
      	inventory_image = marking_data.overlay:split(".")[1] .. "_yellow.png",
      	wield_image = marking_data.overlay:split(".")[1] .. "_yellow.png",
        node_box = {
      		type = "fixed",
      		fixed = {{-0.5, -0.5, -0.5, 0.5, -0.499, 0.5}}
      	},
      	selection_box = {
      		type = "fixed",
      		fixed = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}}
      	}
      })
      minetest.register_node(":streets:rw_" .. marking_data.suffix .. "_white",{
        description = "Roadworks: " .. marking_data.friendly_suffix:gsub("^%l", string.upper),
        tiles = {marking_data.overlay, "streets_transparent.png"},
      	drawtype = "nodebox",
      	paramtype = "light",
      	paramtype2 = "facedir",
      	groups = {snappy = 3,attached_node = 1,oddly_breakable_by_hand = 1},
      	sunlight_propagates = true,
      	walkable = false,
      	inventory_image = marking_data.overlay,
      	wield_image = marking_data.overlay,
        node_box = {
      		type = "fixed",
      		fixed = {{-0.5, -0.5, -0.5, 0.5, -0.499, 0.5}}
      	},
      	selection_box = {
      		type = "fixed",
      		fixed = {{-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5}}
      	}
      })
    end
  end
end)
