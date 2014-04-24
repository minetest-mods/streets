--[[
	StreetsMod: inDev Trafficlights
]]
minetest.register_node(":digiline_vertical:wire", {
    description = "Vertical digiline",
    tiles = {"default_brick.png"},
    wield_image = "digiline_std_inv.png",
    paramtype = "light",
    digiline = 
    {
        wire = 
        {
            rules = streets.rules_pole
        }
    },
    groups = {dig_immediate = 3}
})
minetest.register_node(":streets:bigpole", {
	description = "Pole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
		}
	},
	on_place = minetest.rotate_node,
	digiline = {
		wire = {
			rules = streets.rules_pole
		}
	}
})
minetest.register_node(":streets:bigpole_edge", {
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	groups = {cracky = 1, level = 2, not_in_creative_inventory = 1, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.15,0.15},
			{-0.15,-0.15,-0.125,0.15,0.15,-0.5}
		}
	},
})