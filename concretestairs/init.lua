--[[
	StreetsMod: Concrete stairs (not compatible to circular_saw
]]
if streets.extendedBy.stairs == true then
	 stairs.register_stair_and_slab("concrete", "streets:concrete", {cracky = 2, level = 2}, {"streets_concrete.png"}, "Concrete stair", "Concrete slab", nil)
end