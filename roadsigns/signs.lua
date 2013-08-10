if streets.extendedBy.bucket == true and streets.extendedBy.wool then
	minetest.register_node(":streets:sign_lava",{
		description = "Warning sign (lava)",
		tiles = {"streets_sign_lava.png"},
		inventory_image = "streets_sign_lava.png",
		wield_image = "streets_sign_lava.png",
		groups = {snappy = 1,attached_node = 1},
		drawtype = "signlike",
		paramtype = "light",
		paramtype2 = "wallmounted",
		walkable = false,
		sunlight_propagates = true,
		selection_box = {
			type = "wallmounted"
		}
	})

	minetest.register_craft({
		output = "streets:sign_lava 2",
		recipe = {
			{"wool:red","wool:red","wool:red"},
			{"wool:red","bucket:bucket_lava","wool:red"},
			{"wool:red","wool:red","wool:red"}
		},
		replacements = {
			{"bucket:bucket_lava", "bucket:bucket_empty"}
		}
	})
	
	minetest.register_node(":streets:sign_water",{
		description = "Warning sign (water)",
		tiles = {"streets_sign_water.png"},
		inventory_image = "streets_sign_water.png",
		wield_image = "streets_sign_water.png",
		groups = {snappy = 1,attached_node = 1},
		drawtype = "signlike",
		paramtype = "light",
		paramtype2 = "wallmounted",
		walkable = false,
		sunlight_propagates = true,
		selection_box = {
			type = "wallmounted"
		}
	})

	minetest.register_craft({
		output = "streets:sign_water 2",
		recipe = {
			{"wool:red","wool:red","wool:red"},
			{"wool:red","bucket:bucket_water","wool:red"},
			{"wool:red","wool:red","wool:red"}
		},
		replacements = {
			{"bucket:bucket_water", "bucket:bucket_empty"}
		}
	})
	
	minetest.register_node(":streets:sign_construction",{
		description = "Warning sign (Construction area)",
		tiles = {"streets_sign_construction.png"},
		inventory_image = "streets_sign_construction.png",
		wield_image = "streets_sign_construction.png",
		groups = {snappy = 1,attached_node = 1},
		drawtype = "signlike",
		paramtype = "light",
		paramtype2 = "wallmounted",
		walkable = false,
		sunlight_propagates = true,
		selection_box = {
			type = "wallmounted"
		}
	})
	minetest.register_craft({
		output = "streets:sign_construction 2",
		recipe = {
			{"wool:red","wool:red","wool:red"},
			{"wool:red","default:shovel_steel","wool:red"},
			{"wool:red","wool:red","wool:red"}
		}
	})
end