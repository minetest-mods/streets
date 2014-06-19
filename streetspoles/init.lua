--[[
	StreetsMod: Poles
]]

-- Simple pole
minetest.register_node(":streets:pole_bottom",{
	description = streets.S("Pole"),
	tiles = {"streets_pole.png"},
	groups = {cracky=2},
	inventory_image = "streets_pole_inv.png",
	wield_image = "streets_pole_inv.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4},
			{-0.125,-0.5,-0.525,0.125,-0.3,-0.375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4}
		}
	},
	after_place_node = function(pos,placer,itemstack)
		pos.y = pos.y +1
		if minetest.get_node(pos).name == "air" then
			minetest.add_node(pos,{name = "streets:pole_top", param2 = minetest.dir_to_facedir(placer:get_look_dir())})
		else
			minetest.chat_send_player(placer:get_player_name(),"Not enough free space! A pole has a height of 2 blocks!")
			pos.y = pos.y -1
			minetest.remove_node(pos)
		end
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		pos.y = pos.y +1
		if minetest.get_node(pos).name == "streets:pole_top" then
			minetest.remove_node(pos)
		end
	end
})

minetest.register_node(":streets:pole_top",{
	description = streets.S("Y u no play minetest without cheating?"),
	tiles = {"streets_pole.png"},
	groups = {not_in_creative_inventory=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	drop = "",
	diggable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4}
		}
	}
})

minetest.register_craft({
	output = "streets:pole_bottom 3",
	recipe = {
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	}
})

-- Big pole

minetest.register_node(":streets:bigpole", {
	description = "Pole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
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
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
				{x= 0, y=-2, z= 0}
			}
		}
	}
})
minetest.register_node(":streets:bigpole_edge", {
	description = "Pole",
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.15,0.15},
			{-0.15,-0.15,-0.15,0.15,0.15,-0.5}
		}
	},
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
			}
		}
	}
})
minetest.register_node(":streets:bigpole_tjunction", {
	description = "Pole",
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.15, 0.15},
			{-0.15, -0.15, -0.5, 0.15, 0.15, 0.5}
		}
	},
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
			}
		}
	}
})
minetest.register_craft({
	output = "streets:bigpole 3",
	recipe = {
		{"","",""},
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	}
})
minetest.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{"","",""},
		{"streets:bigpole","streets:bigpole",""},
		{"streets:bigpole","",""}
	}
})
minetest.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{"","",""},
		{"streets:bigpole","streets:bigpole",""},
		{"","streets:bigpole",""}
	}
})
minetest.register_craft({
	output = "streets:bigpole_tjunction 2",
	recipe = {
		{"","",""},
		{"streets:bigpole_edge","streets:bigpole",""},
		{"","",""}
	}
})