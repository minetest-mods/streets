minetest.register_node(":streets:sign_blank",{
	description = streets.S("Empty sign"),
	tiles = {"streets_sign_back.png"},
	inventory_image = "streets_sign_back.png",
	wield_image = "streets_sign_back.png",
	groups = {snappy = 1,attached_node = 1},
	drawtype = "nodebox",
	node_box = {
		type = "wallmounted",
		fixed = {
			{-0.4,-0.5,-0.4,0.4,-0.4,0.4}
		}
	},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted"
	},
	streets = {
		signworkshop = {
			recipe = {"default:steel_ingot","","",""},
			time = 3
		}
	},
	after_place_node = function(pos)
		local meta = minetest.get_meta(pos)
		
		meta:set_string("infotext", streets.S("Empty Sign"))
	end
})
minetest.register_node(":streets:sign_lava",{
	description = streets.S("Warning sign (lava)"),
	tiles = {"streets_sign_lava.png"},
	inventory_image = "streets_sign_lava.png",
	wield_image = "streets_sign_lava.png",
	groups = {snappy = 1,attached_node = 1},
	drawtype = "nodebox",
	node_box = {
		type = "wallmounted",
		fixed = {
			{-0.4,-0.5,-0.4,0.4,-0.4,0.4}
		}
	},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted"
	},
	streets = {
		signworkshop = {
			recipe = {"streets:sign_blank","bucket:bucket_lava","",""},
			time = 5
		}
	},
	after_place_node = function(pos)
		local meta = minetest.get_meta(pos)
		
		meta:set_string("infotext", streets.S("Warning: Careful of lava"))
	end
})
	
minetest.register_node(":streets:sign_water",{
	description = streets.S("Warning sign (water)"),
	tiles = {"streets_sign_water.png"},
	inventory_image = "streets_sign_water.png",
	wield_image = "streets_sign_water.png",
	groups = {snappy = 1,attached_node = 1},
	drawtype = "nodebox",
	node_box = {
		type = "wallmounted",
		fixed = {
			{-0.4,-0.5,-0.4,0.4,-0.4,0.4}
		}
	},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted"
	},
	streets = {
		signworkshop = {
			recipe = {"streets:sign_blank","bucket:bucket_water","",""},
			time = 5
		}
	},
	after_place_node = function(pos)
		local meta = minetest.get_meta(pos)
		
		meta:set_string("infotext", streets.S("Warning: Water nearby"))
	end
})

minetest.register_node(":streets:sign_construction",{
	description = streets.S("Warning sign (Construction area)"),
	tiles = {"streets_sign_construction.png"},
	inventory_image = "streets_sign_construction.png",
	wield_image = "streets_sign_construction.png",
	groups = {snappy = 1,attached_node = 1},
	drawtype = "nodebox",
	node_box = {
		type = "wallmounted",
		fixed = {
			{-0.4,-0.5,-0.4,0.4,-0.4,0.4}
		}
	},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = {
		type = "wallmounted"
	},
	streets = {
		signworkshop = {
			recipe = {"streets:sign_blank","default:dirt","",""},
			time = 5
		}
	},
	after_place_node = function(pos)
		local meta = minetest.get_meta(pos)
		
		meta:set_string("infotext", streets.S("Warning: Construction area, possible deep excavations"))
	end
})
