local all_subset = streets.stairs_subset.basic
local basic_subset = {}
if streets.conf.roadmarkings_stairs_variations == "full" then
	all_subset = streets.stairs_subset.all
	basic_subset = {}
elseif streets.conf.roadmarkings_stairs_variations == "limited" then
	all_subset = streets.stairs_subset.basic_slabs
	basic_subset = streets.stairs_subset.basic_without_slabs
end

streets.roads.register_surface({
	name = "asphalt",
	description = "Asphalt",
	tex = "streets_asphalt.png",
	register_base_node_stairs = streets.stairs_subset.all,
	register_all_roadmarking_stairs = all_subset,
	register_basic_roadmarking_stairs = basic_subset,
	register_variants = true,
})

--[[
	## StreetsMod 2.0 ##
	Submod: roadsurface
	Optional: true
	Category: Roads


streets.register_road_surface({
	name = "asphalt",
	friendlyname = "Asphalt",
	tiles = { "streets_asphalt.png" },
	groups = { cracky = 3, asphalt = 1 },
	sounds = default.node_sound_stone_defaults(),
	register_stairs = true,
	craft = {
		output = "streets:asphalt 1",
		type = "cooking",
		recipe = "default:gravel",
		cooktime = 2
	}
})

streets.register_road_surface({
	name = "asphalt_red",
	friendlyname = "Red Asphalt",
	tiles = { "streets_asphalt_red.png" },
	groups = { cracky = 3, asphalt = 1 },
	sounds = default.node_sound_stone_defaults(),
	register_stairs = true,
	craft = {
		output = "streets:asphalt_red 1",
		type = "shapeless",
		recipe = { "streets:asphalt", "dye:red" }
	}
})

streets.register_road_surface({
	name = "asphalt_yellow",
	friendlyname = "Yellow Asphalt",
	tiles = {"streets_asphalt_yellow.png"},
	groups = {cracky = 3,asphalt = 1},
	sounds = default.node_sound_stone_defaults(),
	craft = {
		output = "streets:asphalt_yellow 1",
		type = "shapeless",
		recipe = {"streets:asphalt", "dye:yellow"}
	}
})

streets.register_road_surface({
	name = "asphalt_blue",
	friendlyname = "Blue Asphalt",
	tiles = { "streets_asphalt_blue.png" },
	groups = { cracky = 3, asphalt = 1 },
	sounds = default.node_sound_stone_defaults(),
	register_stairs = false,
	craft = {
		output = "streets:asphalt_blue 1",
		type = "shapeless",
		recipe = { "streets:asphalt", "dye:blue" }
	}
})

minetest.register_node("streets:sidewalk", {
	description = "Sidewalk",
	tiles = { "streets_sidewalk.png" },
	groups = { cracky = 3, stone = 1 },
	sounds = default.node_sound_stone_defaults()
})

if minetest.get_modpath("moreblocks") or minetest.get_modpath("stairsplus") then
	stairsplus:register_all("streets", "sidewalk", "streets:sidewalk", {
		description = "Concrete",
		tiles = { "streets_sidewalk.png" },
		groups = { cracky = 3, asphalt = 1 },
		sounds = default.node_sound_stone_defaults()
	})
end

minetest.register_craft({
	output = "streets:sidewalk 1",
	type = "shapeless",
	recipe = { "streets:asphalt", "dye:white" }
})]]
