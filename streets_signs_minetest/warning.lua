local signs = {
	{ "chevron_left", "Chevron (Left)" },
	{ "chevron_right", "Chevron (Right)" },
	{ "crossroad_priority", "Right of Way on Next Crossroad/Junction" },
	{ "curve_left", "Curve (Left)" },
	{ "curve_right", "Curve (Right)" },
	{ "danger", "Danger" },
	{ "devidedhighway_end", "Devided Highway (End)" },
	{ "devidedhighway_start", "Devided Highway (Start)" },
	{ "lava", "Lava" },
	{ "pedestrians", "Pedestrians" },
	{ "roadnarrows", "Road Narrows" },
	{ "roadnarrows_left", "Road Narrows (Left)" },
	{ "roadnarrows_right", "Road Narrows (Right)" },
	{ "roundabout", "Roundabout" },
	{ "trafficlights", "Traffic Lights" },
	{ "train", "Train" },
	{ "twowaytraffic", "Two-Way Traffic" },
	{ "unevensurface", "Uneven Surface" },
	{ "water", "Water" },
	{ "work", "Work" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2],
		belongs_to = "minetest:warning",
		style = "box",
	})
end