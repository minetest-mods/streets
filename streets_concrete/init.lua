streets.concrete = {}

if minetest.get_modpath("concrete") then
	streets.concrete.texture = "technic_concrete_block.png"
	minetest.register_alias("streets:concrete", "technic:concrete")
else
	streets.concrete.texture = "streets_concrete.png"
	minetest.register_alias("technic:concrete", "streets:concrete")

	minetest.register_node(":streets:concrete", {
		description = "Concrete",
		tiles = { "streets_concrete.png" },
		groups = { cracky = 2, stone = 3, level = 2 },
		sounds = default.node_sound_stone_defaults()
	})

	minetest.register_craft({
		output = "streets:concrete 5",
		recipe = {
			{ "default:steel_ingot", "default:stone", "default:steel_ingot" },
			{ "default:stone", "default:steel_ingot", "default:stone" },
			{ "default:steel_ingot", "default:stone", "default:steel_ingot" },
		}
	})

	streets.helpers.register_stairs("concrete", {
		description = "Concrete",
		tiles = { streets.concrete.texture },
		groups = { cracky = 2, stone = 3 },
		sounds = default.node_sound_stone_defaults()
	}, streets.stairs_subset.all)
end

local modpath = minetest.get_modpath("streets_concrete")

dofile(modpath .. "/walls.lua")
dofile(modpath .. "/reflectors.lua")