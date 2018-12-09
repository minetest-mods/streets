local signs = {
	{ "bike", "Bike Lane" },
	{ "equestrian", "Bridleway" },
	{ "left", "Keep Left" },
	{ "leftonly", "Left Only" },
	{ "leftrightonly", "Left and Right Only" },
	{ "pedestrian", "Pedestrian Lane" },
	{ "pedestrian_bike_separated", "Shared, but Separated Bicycle and Pedestrian Path" },
	{ "pedestrian_bike_shared", "Shared Use Path" },
	{ "right", "Keep Right" },
	{ "rightonly", "Right Only" },
	{ "roundabout" },
	{ "straightleftonly", "Straight and Left Only" },
	{ "straightonly", "Straight Only" },
	{ "straightrightonly", "Straight and Right Only" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2] or v[1]:sub(1,1):upper() .. v[1]:sub(2),
		belongs_to = "de:mandatory",
		style = "flat",
		box = { -0.38, -0.38, 0.38, 0.38 },
	})
end