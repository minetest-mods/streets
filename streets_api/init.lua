print("[Mod][StreetsMod] Loading...")
-- Register a global streets namespace to operate in
streets = {}

-- Config stuff goes here
streets.conf = {
	version = "3.0",
	licenseCode = "MIT License",
	licenseMedia = "CC-BY-SA 3.0",
	roadmarkings_stairs_variations = "normal",
}

if minetest.settings:get("streets.roadmarkings_stairs_variations") == "full" then
	streets.conf.roadmarkings_stairs_variations = "full"
elseif minetest.settings:get("streets.roadmarkings_stairs_variations") == "limited" then
	streets.conf.roadmarkings_stairs_variations = "limited"
end

if minetest.get_modpath("concrete") then
	streets.conf.concrete_texture = "technic_concrete_block.png"
else
	streets.conf.concrete_texture = "streets_concrete.png"
end

local modpath = minetest.get_modpath("streets_api")

dofile(modpath .. "/helpers.lua")
dofile(modpath .. "/stairs_subset.lua")
dofile(modpath .. "/colors.lua")
dofile(modpath .. "/light.lua")
dofile(modpath .. "/roads.lua")
dofile(modpath .. "/trafficlight.lua")
dofile(modpath .. "/signs.lua")
