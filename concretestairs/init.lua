--[[
	StreetsMod: Concrete stairs (not compatible to circular_saw
]]
if streets.extendedBy.stairs == true and streets.extendedBy.prefab == false then
	 stairs.register_stair_and_slab("concrete", "streets:concrete", {cracky = 2, level = 2}, {"streets_concrete.png"}, "Concrete stair", "Concrete slab", nil)
else
	minetest.register_alias("stairs:stair_concrete","prefab:concrete_stair")
	minetest.register_alias("stairs:slab_concrete","prefab:concrete_slab")
end