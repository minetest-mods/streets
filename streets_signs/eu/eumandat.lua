local eumandat = {
	{ "rightonly", "Right Only", { blue = 2, white = 1 } },
	{ "rightonly_", "Right Only", { blue = 2, white = 1 } },
	{ "leftonly", "Left Only", { blue = 2, white = 1 } },
	{ "leftonly_", "Left Only", { blue = 2, white = 1 } },
	{ "straightonly", "Straight Only", { blue = 2, white = 1 } },
	{ "straightrightonly", "Straight and Right Only", { blue = 2, white = 1 } },
	{ "straightleftonly", "Straight and Left Only", { blue = 2, white = 1 } },
	{ "roundabout", "Roundabout", { blue = 2, white = 1 } },
	{ "onewayright", "One Way Road", { blue = 2, white = 1, black = 1 } },
	{ "onewayleft", "One Way Road", { blue = 2, white = 1, black = 1 } },
	{ "passingright", "Passing Right", { blue = 2, white = 1 } },
	{ "passingleft", "Passing Left", { blue = 2, white = 1 } },
	{ "busstation", "Busstation", { green = 2, yellow = 2 } },
	{ "cyclepath", "Cycle Path", { blue = 2, white = 1 } },
	{ "bridlepath", "Bridle Path", { blue = 2, white = 1 } },
	{ "walkway", "Walkway", { blue = 2, white = 1 } },
	{ "sharedpedestriansbicyclists", "Shared Way for Pedestrians and Bicyclists", { blue = 2, white = 1 } },
	{ "seperatedpedestriansbicyclists", "Seperated Way for Pedestrians and Bicyclists", { blue = 2, white = 1 } },
	{ "pedestrianszone", "Pedestrians Zone", { blue = 2, white = 2, black = 1 } },
	{ "pedestrianszoneend", "Pedestrians Zone", { grey = 2, white = 2, black = 1 } },
}

for k, v in pairs(eumandat) do
	streets.register_road_sign({
		name = "sign_eu_" .. v[1],
		friendlyname = v[2] .. " Sign",
		tiles = {
			"streets_transparent.png",
			"streets_transparent.png",
			"streets_transparent.png",
			"streets_transparent.png",
			"streets_sign_back.png",
			"streets_sign_eu_" .. v[1] .. ".png"
		},
		thickness = 0.01,
		section = "eumandat",
		dye_needed = v[3]
	})
end