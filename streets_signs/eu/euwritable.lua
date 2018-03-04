local euwritable = {
	{ "complementary4", "Complementary Plate (4 lines)", { white = 2, black = 1 }, { lines = 4, color = "#000", size = { x = 14/16, y = 14/16 }, resolution = { x = 9.5, y = 5 } } },
	{ "complementary3", "Complementary Plate (3 lines)", { white = 2, black = 1 }, { lines = 3, color = "#000", size = { x = 14/16, y = 10/16 }, resolution = { x = 9, y = 5 }, height = 1/16 } },
	{ "complementary2", "Complementary Plate (2 lines)", { white = 1, black = 1 }, { lines = 2, color = "#000", size = { x = 14/16, y = 6/16 }, resolution = { x = 9, y = 5 }, height = 29/128 - 1/16 } },
	{ "complementary1", "Complementary Plate (1 line)", { white = 1, black = 1 }, { lines = 1, color = "#000", size = { x = 14/16, y = 6/16 }, resolution = { x = 6, y = 3.3 }, height = 29/128 - 1/16 } },
	{ "complementaryfor", "Complementary Plate (For ...)", { white = 1, black = 1 }, { lines = 1, color = "#000", size = { x = 9/16, y = 6/16 }, resolution = { x = 6, y = 3.3 }, height = 29/128 - 1/16 } },
	{ "numberyellow", "Yellow Number", { yellow = 1, black = 1 }, { lines = 1, color = "#000", size = { x = 7/16, y = 5/16 }, resolution = { x = 6, y = 3.3 } } },
	{ "numberblue", "Blue Number", { blue = 1, white = 1 }, { lines = 1, color = "#fff", size = { x = 7/16, y = 5/16 }, resolution = { x = 6, y = 3.3 } } },
}

for k, v in pairs(euwritable) do
	streets.register_road_sign({
		name = "sign_eu_" .. v[1],
		friendlyname = v[2] .. " Sign",
		light_source = 3,
		tiles = {
			"streets_sign_eu_" .. v[1] .. ".png",
			"streets_sign_back.png",
		},
		type = "normal",
		section = "euwritable",
		dye_needed = v[3],
		writable = v[4]
	})
end

local euwritable_big = {
	{ "townstart", "Town (Start)", { yellow = 3, black = 1 }, { lines = 3, color = "#000", size = { x = 22/16, y = 14/16 }, resolution = { x = 5, y = 3 } } },
	{ "townend", "Town (End)", { yellow = 3, black = 1, red = 1 }, { lines = 2, color = "#000", size = { x = 22/16, y = 14/16 }, resolution = { x = 5, y = 2.25 } } },
	{ "directionyellowminorleft", "Yellow Minor Left Direction", { yellow = 2, black = 1 }, { lines = 1 , color = "#000", size = { x = 18/16, y = 3/16 }, resolution = { x = 7.5, y = 3.75 }, height = 0.015 } },
	{ "directionyellowminorright", "Yellow Minor Right Direction", { yellow = 2, black = 1 }, { lines = 1 , color = "#000", size = { x = 18/16, y = 4.5/16 }, resolution = { x = 7.5, y = 3.75 }, height = 0.015 } },
	{ "blankdetour", "Blank Detour", { yellow = 2, black = 1 }, { lines = 1 , color = "#000", size = { x = 22/16, y = 7/16 }, resolution = { x = 4, y = 2.5 } } },
	{ "blankdetourend", "Blank Detour End", { yellow = 2, black = 1, red = 1 }, { lines = 1 , color = "#000", size = { x = 22/16, y = 7/16 }, resolution = { x = 4, y = 2.5 } } },
	{ "placename", "Place Name", { green = 2, yellow = 1 }, { lines = 1 , color = "#f0cb00", size = { x = 22/16, y = 7/16 }, resolution = { x = 6, y = 3 } } },
	{ "touristattraction", "Tourist Attraction", { brown = 2, white = 1 }, { lines = 2 , color = "#fff", size = { x = 22/16, y = 7/16 }, resolution = { x = 8, y = 4.5 }, height = 0.015 } },
	{ "exitaheadblue", "Exit Ahead (Blue)", { blue = 6, white = 2 }, { lines = 3 , color = "#fff", size = { x = 32/16, y = 16/16 }, resolution = { x = 4.5, y = 3 }, height = 0.4, right = 0.1, halign = "left" } },
	{ "exitaheadyellow", "Exit Ahead (Yellow)", { yellow = 6, black = 2 }, { lines = 3 , color = "#000", size = { x = 32/16, y = 16/16 }, resolution = { x = 4.5, y = 3 }, height = 0.4, right = 0.1, halign = "left" } },
	{ "exitaheadwhite", "Exit Ahead (White)", { white = 6, black = 2 }, { lines = 3 , color = "#000", size = { x = 32/16, y = 16/16 }, resolution = { x = 4.5, y = 3 }, height = 0.4, right = 0.1, halign = "left" } },
}

for k, v in pairs(euwritable_big) do
	streets.register_road_sign({
		name = "sign_eu_" .. v[1],
		friendlyname = v[2] .. " Sign",
		light_source = 3,
		tiles = {
			"streets_sign_eu_" .. v[1] .. ".png",
			"streets_sign_back.png",
		},
		type = "big",
		section = "euwritable",
		dye_needed = v[3],
		writable = v[4],
		inventory_image = "streets_sign_eu_" .. v[1] .. "_inv.png",
	})
end

local arrows = {
	{"white", "#000", { white = 3, black = 1}, },
	{"yellow", "#000", { yellow = 3, black = 1}, },
	{"blue", "#fff", { blue = 3, white = 1}, },
	{"brown", "#fff", { brown = 3, white = 1}, },
}

for a, color in pairs(arrows) do
	for b, direction in pairs({"left", "right"}) do
		for c, line in pairs({1, 2}) do
			streets.register_road_sign({
				name = "sign_eu_direction" .. color[1] .. direction .. line,
				friendlyname = color[1]:sub(1,1):upper() .. color[1]:sub(2) .. " " .. direction:sub(1,1):upper() .. direction:sub(2) .. " Direction Sign (" .. line .. ( (line == 2) and " lines)" or " line)" ),
				light_source = 3,
				tiles = {
					"streets_sign_eu_direction" .. color[1] .. direction .. ".png",
					"streets_sign_back.png",
				},
				type = "big",
				section = "euwritable",
				dye_needed = color[3],
				writable = {
					lines = line,
					color = color[2],
					size = { x = 23/16, y = 6/16 },
					resolution = { x = 5 * line, y = 2.5 * line },
					height = (line == 1) and 0.035,
				},
				inventory_image = "streets_sign_eu_direction" .. color[1] .. direction .. "_inv.png",
			})
		end
	end
end