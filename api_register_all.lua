--[[
  ## StreetsMod 2.0 ##
  Submod: streetsapi
  Optional: false
  Category: Init
]]

minetest.after(0, function()
  for nodename, nodedef in pairs(streets.api.register_road_surfaces) do
    -- Register the node
    minetest.register_node(nodename, nodedef)
    -- Register all markings for this node
    for markingname, markingtexture in pairs(streets.api.register_road_markings) do
      minetest.register_node(nodename .. "_" .. markingname, {
        tiles = {nodedef.tiles[1] .. "^" .. markingtexture, nodedef.tiles[1]},
        groups = nodedef.groups
      })
    end

    -- Register the craft
    if nodedef.craft ~= nil then
      minetest.register_craft(nodedef.craft)
    end
  end
end)
