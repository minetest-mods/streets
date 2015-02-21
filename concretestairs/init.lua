--[[
	StreetsMod: Concrete stairs (compatible to circular saw)
]]
if rawget(_G, "register_stair_slab_panel_micro")
and type(register_stair_slab_panel_micro) == "function" and streets.extendedBy.prefab == false then
	register_stair_slab_panel_micro("streets", "concrete", "streets:concrete", {cracky=2}, {"streets_concrete.png"}, "Concrete", "concrete", nil)
	table.insert(circular_saw.known_stairs,"streets:concrete")
	minetest.register_alias("stairs:stair_concrete","streets:stair_concrete")
else
	minetest.register_alias("stairs:stair_concrete","prefab:concrete_stair")
	minetest.register_alias("stairs:slab_concrete","prefab:concrete_slab")
end
