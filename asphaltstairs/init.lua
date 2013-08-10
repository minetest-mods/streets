--[[
	StreetsMod: These stairs are just a workaround until stairs/stairs+ and circular_saw
	can work together without problems. This definetly needs an API!
]]
if streets.extendedBy.stairs == false then return end
--
dofile(minetest.get_modpath(minetest.get_current_modname()).."/function.lua")

-- Asphalt
streets.register_stair_and_slab("asphalt","Asphalt",{"streets_asphalt.png"},"streets:asphalt")
minetest.register_alias("streets:asphalt_stairs","streets:asphalt_stair")
-- Asphalt with solid line:
streets.register_stair_and_slab("asphalt_solid_line","Asphalt with solid line",{"streets_asphalt.png^streets_asphalt_solid_line.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_solid_line.png"},"streets:asphalt_solid_line")
-- Asphalt with dashed line:
streets.register_stair_and_slab("asphalt_dashed_line","Asphalt with dashed line",{"streets_asphalt.png^streets_asphalt_dashed_line.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png","streets_asphalt.png^streets_asphalt_dashed_line.png"},"streets:asphalt_dashed_line")
