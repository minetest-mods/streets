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
    -- Register the craft for this surface
    minetest.register_craft(surface_definition.craft)
    -- Loop through the list of markings
    for marking_suffix, marking_data in pairs(marking_list) do
      -- Collect required data for node defintion
      local nn = surface_name .. "_" .. marking_suffix
      local description = surface_definition.description .. " " .. marking_data.friendly_suffix
      local tiles = {surface_definition.tiles[1] .. "^" .. marking_data.overlay, surface_definition.tiles[1]}
      local groups = surface_definition.groups
      local sounds = surface_definition.sounds
      -- Replace placeholders in craft recipe
      local craft = marking_data.craft
      local replacement = surface_name:sub(2, -1)
      if craft[1][1] == "?" then craft[1][1] = replacement end
      if craft[1][2] == "?" then craft[1][2] = replacement end
      if craft[1][3] == "?" then craft[1][3] = replacement end
      if craft[2][1] == "?" then craft[2][1] = replacement end
      if craft[2][2] == "?" then craft[2][2] = replacement end
      if craft[2][3] == "?" then craft[2][3] = replacement end
      if craft[3][1] == "?" then craft[3][1] = replacement end
      if craft[3][2] == "?" then craft[3][2] = replacement end
      if craft[3][3] == "?" then craft[3][3] = replacement end
      -- Register the combination of surface and marking
      minetest.register_node(nn, {
        description = description,
        tiles = tiles,
        groups = groups,
        sounds = sounds,
        paramtype = "light",
        paramtype2 = "facedir"
      })
      local craft_output = nn:sub(2, -1)
      -- Register the craft for this node
      minetest.register_craft({
        output = craft_output,
        recipe = craft
      })
    end
  end
end)
