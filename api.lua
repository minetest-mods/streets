--[[
  ## StreetsMod 2.0 ##
  Submod: streetsmod
  Optional: false
  Category: Init
]]

function streets.load_submod(dirname)
  -- Check whether submod's init file exists
  local f = io.open(streets.conf.modpath .. "/" .. dirname .. "/init.lua")
  if f ~= nil then
    -- Load it
    f.close()
    dofile(streets.conf.modpath .. "/" .. dirname .. "/init.lua")
  else
    minetest.log("error", "[Streets] '" .. dirname .. "' does not exist")
  end
end

function streets.register_road_surface(nodename, nodedef)
  streets.api.register_road_surfaces[nodename] = nodedef
end

function streets.register_road_marking(markingname, texture)
  streets.api.register_road_markings[markingname] = texture
end
