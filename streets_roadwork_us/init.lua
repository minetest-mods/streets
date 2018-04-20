local digiline_def = {
	wire = {
		rules = {
			{ x = 0, y = 0, z = -1 },
			{ x = 0, y = 0, z = 1 },
			{ x = 1, y = 0, z = 0 },
			{ x = -1, y = 0, z = 0 },
			{ x = 0, y = -1, z = 0 },
			{ x = 0, y = 1, z = 0 },
			{ x = 0, y = 0, z = -2 },
			{ x = 0, y = 0, z = 2 },
			{ x = 2, y = 0, z = 0 },
			{ x = -2, y = 0, z = 0 },
			{ x = 0, y = 2, z = 0 },
			{ x = 0, y = -2, z = 0 },
			{ x = 0, y = 1, z = -1 },
			{ x = 0, y = 1, z = 1 },
			{ x = 1, y = 1, z = 0 },
			{ x = -1, y = 1, z = 0 },
			{ x = 0, y = 2, z = -1 },
			{ x = 0, y = 2, z = 1 },
			{ x = 1, y = 2, z = 0 },
			{ x = -1, y = 2, z = 0 },
		}
	}
}

for direction_name, direction_desc in pairs({ left = "Left", right = "Right"}) do
	minetest.register_node(":streets:roadwork_us_barricade_type_1_" .. direction_name, {
		description = "Type I Barricade (" .. direction_desc .. ")",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		tiles = {
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png^streets_roadwork_us_barricade_type_1_" .. direction_name .. ".png",
		},
		sunlight_propagates = true,
		groups = { snappy = 2, dig_immediate = 2, },
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, -6/16, -6/16, 0.325 }, -- Foot
				{ 6/16, -0.5, -0.5, 0.5, -6/16, 0.325 }, -- Foot
				{ -0.5, -0.5, -0.15, -6/16, 0, -0.025 }, -- Vertical
				{ 6/16, -0.5, -0.15, 0.5, 0, -0.025 }, -- Vertical
				{ -0.5, 0, -0.15, 0.5, 0.5, -0.025 }, -- Background
			}
		},
		sound = default.node_sound_stone_defaults(),
		digiline = digiline_def,
	})

	local factor = direction_name == "left" and -1 or 1

	minetest.register_node(":streets:roadwork_us_barricade_direction_" .. direction_name, {
		description = "Direction Indicator Barricade (" .. direction_desc .. ")",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		tiles = {
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png^streets_roadwork_us_barricade_direction_" .. direction_name .. ".png",
		},
		sunlight_propagates = true,
		groups = { snappy = 2, dig_immediate = 2, },
		node_box = {
			type = "fixed",
			fixed = {
				{ -11/32 + factor * 5/32, -0.5, -0.5, -7/32 + factor * 5/32, -6/16, 0.325 }, -- Foot
				{ 7/32 + factor * 5/32, -0.5, -0.5, 11/32 + factor * 5/32, -6/16, 0.325 }, -- Foot
				{ -11/32 + factor * 5/32, -6/16, -0.15, 11/32 + factor * 5/32, 0.5, -0.025 }, -- Background
			}
		},
		sound = default.node_sound_stone_defaults(),
		digiline = digiline_def,
	})

	minetest.register_node(":streets:roadwork_us_vertical_panel_" .. direction_name, {
		description = "Vertical Panel (" .. direction_desc .. ")",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		tiles = {
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png^streets_roadwork_us_vertical_panel_" .. direction_name .. ".png",
		},
		sunlight_propagates = true,
		groups = { snappy = 2, dig_immediate = 2, },
		node_box = {
			type = "fixed",
			fixed = {
				{ -9/32 + factor * 7/32, -0.5, -0.5, -5/32 + factor * 7/32, -6/16, 0.325 }, -- Foot
				{ 5/32 + factor * 7/32, -0.5, -0.5, 9/32 + factor * 7/32, -6/16, 0.325 }, -- Foot
				{ -9/32 + factor * 7/32, -6/16, -0.15, 9/32 + factor * 7/32, 0.5, -0.025 }, -- Background
			}
		},
		sound = default.node_sound_stone_defaults(),
		digiline = digiline_def,
	})

	minetest.register_node(":streets:roadwork_us_barricade_type_2_" .. direction_name, {
		description = "Type II Barricade (" .. direction_desc .. ")",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		tiles = {
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png^streets_roadwork_us_barricade_type_2_" .. direction_name .. ".png",
		},
		sunlight_propagates = true,
		groups = { snappy = 2, dig_immediate = 2, },
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, -6/16, -6/16, 0.325 }, -- Foot
				{ 6/16, -0.5, -0.5, 0.5, -6/16, 0.325 }, -- Foot
				{ -0.5, -6/16, -0.15, 0.5, 0.5, -0.025 }, -- Background
			}
		},
		sound = default.node_sound_stone_defaults(),
		digiline = digiline_def,
	})

	minetest.register_node(":streets:roadwork_us_barricade_type_3_" .. direction_name, {
		description = "Type III Barricade (" .. direction_desc .. ")",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		tiles = {
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png",
			"streets_pole.png^streets_roadwork_us_barricade_type_3_" .. direction_name .. ".png",
		},
		sunlight_propagates = true,
		groups = { snappy = 2, dig_immediate = 2, },
		node_box = {
			type = "fixed",
			fixed = {
				{ -1.075, -0.5, -0.075, -0.925, 1.5, 0.075 }, -- Pole
				{ 0.925, -0.5, -0.075, 1.075, 1.5, 0.075 }, -- Pole
				{ -1.075, -0.5, -0.5, -0.925, -0.35, 0.5 }, -- Foot
				{ 0.925, -0.5, -0.5, 1.075, -0.35, 0.5 }, -- Foot
				{ -1.4, 0, -0.075, 1.4, 0.25, -0.15 },
				{ -1.4, 0.5, -0.075, 1.4, 0.75, -0.15 },
				{ -1.4, 1, -0.075, 1.4, 1.25, -0.15 },
			}
		},
		sound = default.node_sound_stone_defaults(),
		digiline = digiline_def,
	})
end

minetest.register_node(":streets:roadwork_us_traffic_drum", {
	description = "Traffic Drum",
	drawtype = "mesh",
	mesh = "streets_roadwork_us_traffic_drum.obj",
	tiles = {
		"streets_black.png",
		"streets_roadwork_us_orange.png^streets_roadwork_us_stripes_white.png",
		"streets_roadwork_us_orange.png^streets_roadwork_us_stripes_orange.png",
		"streets_roadwork_us_orange.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 2, dig_immediate = 2, },
	selection_box = {
		type = "fixed",
		fixed = { -0.3, -0.5, -0.3, 0.3, 0.5, 0.3 }
	},
	collision_box = {
		type = "fixed",
		fixed = { -0.3, -0.5, -0.3, 0.3, 0.5, 0.3 }
	},
})

minetest.register_node(":streets:roadwork_us_tubular_marker", {
	description = "Tubular Marker",
	drawtype = "mesh",
	mesh = "streets_roadwork_us_tubular_marker.obj",
	tiles = {
		"streets_roadwork_us_orange.png",
		"streets_roadwork_us_tubular_marker_stripes.png",
		"streets_black.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 2, dig_immediate = 2, },
	selection_box = {
		type = "fixed",
		fixed = { -0.1, -0.5, -0.1, 0.1, 0.5, 0.1 }
	},
	collision_box = {
		type = "fixed",
		fixed = { -0.1, -0.5, -0.1, 0.1, 0.5, 0.1 }
	},
})

minetest.register_node(":streets:roadwork_us_traffic_cone", {
	description = "Traffic Cone",
	drawtype = "mesh",
	mesh = "streets_roadwork_us_traffic_cone.obj",
	tiles = {
		"streets_roadwork_us_orange.png^streets_roadwork_us_stripes_cone.png",
		"streets_black.png",
	},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { snappy = 2, dig_immediate = 2, },
	selection_box = {
		type = "fixed",
		fixed = {
			{ -0.3, -0.5, -0.3, 0.3, -0.43, 0.3 },
			{ -0.15, -0.43, -0.15, 0.15, 0.27, 0.15 },
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{ -0.3, -0.5, -0.3, 0.3, -0.43, 0.3 },
			{ -0.15, -0.43, -0.15, 0.15, 0.27, 0.15 },
		}
	},
})