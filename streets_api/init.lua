print("[Mod][StreetsMod] Loading...")
-- Register a global streets namespace to operate in
streets = {}

-- Config stuff goes here
streets.conf = {
	version = "3.0",
	licenseCode = "MIT License",
	licenseMedia = "CC-BY-SA 3.0",
}

local modpath = minetest.get_modpath("streets_api")

dofile(modpath .. "/helpers.lua")
dofile(modpath .. "/light.lua")
dofile(modpath .. "/roads.lua")
dofile(modpath .. "/trafficlight.lua")
dofile(modpath .. "/signs.lua")
