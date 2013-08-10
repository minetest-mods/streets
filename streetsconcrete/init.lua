--[[
	StreetsMod: Concrete, Concrete wall (flat), Concrete wall (full)
]]
minetest.register_alias("streets:concrete","technic:concrete")
if streets.extendedBy.technic == true then 
	-- Use technic's concrete block for the seperating wall
	minetest.register_node(":streets:concrete_wall",{
		description = "Conrete wall",
		tiles = {"technic_concrete_block.png"},
		groups = {cracky=2},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4, -0.5, -0.5, 0.4, -0.4, 0.5},
				{-0.1, -0.4, -0.5, 0.1, 0.5, 0.5}
			}
		}
	})
	minetest.register_craft({
		output = "streets:concrete_wall",
		recipe = {
			{"","technic:conrete",""},
			{"","technic:concrete",""},
			{"technic:concrete","technic:concrete","technic:concrete"}
		}
	})
	minetest.register_node(":streets:concrete_wall_flat",{
		description = "Conrete wall",
		tiles = {"technic_concrete_block.png"},
		groups = {cracky=2},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1, -0.5, -0.5, 0.1, 0.5, 0.5}
			}
		}
	})
	minetest.register_craft({
		output = "streets:concrete_wall_flat 3",
		recipe = {
			{"","technic:concrete",""},
			{"","technic:concrete",""},
			{"","",""}
		}
	})
else
	-- Register technic's concrete block with streets's texture and then the seperating wall
	minetest.register_node(":technic:concrete",{
		description = "Concrete",
		tiles = {"streets_concrete.png"},
		groups = {cracky=2}
	})
	minetest.register_node(":streets:concrete_wall",{
		description = "Conrete wall",
		tiles = {"streets_concrete.png"},
		groups = {cracky=2},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.4, -0.5, -0.5, 0.4, -0.4, 0.5},
				{-0.1, -0.4, -0.5, 0.1, 0.5, 0.5}
			}
		}
	})
	minetest.register_craft({
		output = "streets:concrete_wall 5",
		recipe = {
			{"","technic:concrete",""},
			{"","technic:concrete",""},
			{"technic:concrete","technic:concrete","technic:concrete"}
		}
	})
	minetest.register_node(":streets:concrete_wall_flat",{
		description = "Conrete wall",
		tiles = {"streets_concrete.png"},
		groups = {cracky=2},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.1, -0.5, -0.5, 0.1, 0.5, 0.5}
			}
		}
	})
	minetest.register_craft({
		output = "streets:concrete_wall_flat 3",
		recipe = {
			{"","technic:concrete",""},
			{"","technic:concrete",""},
			{"","",""}
		}
	})
	minetest.register_craft({
		type = "shapeless",
		output = "technic:concrete",
		recipe = {"default:stone"}
	})
end