local euprio = {
	{ "standrews", "St. Andrews Cross", { white = 2, red = 1 } },
	{ "yield", "Yield", { white = 2, red = 2 } },
	{ "stop", "Stop", { white = 1, red = 3 } },
	{ "givewayoncoming", "Give Way to Oncoming Traffic", { white = 2, red = 2, black = 1 } },
	{ "priooveroncoming", "Priority over Oncoming Traffic", { white = 1, red = 1, blue = 2 } },
	{ "rightofway", "Right of Way on the Next Crossing", { white = 2, red = 2, black = 1 } },
	{ "majorroad", "Major Road", { white = 2, yellow = 2 } },
	{ "endmajorroad", "End of Major Road", { white = 2, yellow = 2, black = 1 } },
	{ "greenarrow", "Green Arrow (Right Turn on Red Allowed)", { green = 2, black = 2 } },
}

for k, v in pairs(euprio) do
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
		section = "euprio",
		dye_needed = v[3]
	})
end