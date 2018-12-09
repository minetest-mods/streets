local signs = {
	{ "autobahn" },
	{ "crosswalk" },
	{ "deadend" },
	{ "endofautobahn", "End of Autobahn" },
	{ "firstaid", "First Aid" },
	{ "info" },
	{ "parking" },
	{ "tunnel" },
}

for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2] or v[1]:sub(1,1):upper() .. v[1]:sub(2),
		belongs_to = "de:info",
		style = "flat",
		box = { -0.3, -0.3, 0.3, 0.3 }
	})
end

streets.signs.register_sign({
	name = "endoftrafficcalmingzone",
	description = "End of Traffic Calming Zone",
	belongs_to = "de:info",
	style = "flat",
	box = { -0.45, -0.3, 0.45, 0.3 }
})

streets.signs.register_sign({
	name = "trafficcalmingzone",
	description = "Traffic Calming Zone",
	belongs_to = "de:info",
	style = "flat",
	box = { -0.45, -0.3, 0.45, 0.3 }
})

streets.signs.register_sign({
	name = "endofpedestrianzone",
	description = "End of Pedestrian Zone",
	belongs_to = "de:info",
	style = "flat",
	box = { -0.42, -0.42, 0.42, 0.42 }
})

streets.signs.register_sign({
	name = "pedestrianzone",
	description = "Pedestrian Zone",
	belongs_to = "de:info",
	style = "flat",
	box = { -0.42, -0.42, 0.42, 0.42 }
})

streets.signs.register_sign({
	name = "left",
	description = "Left Curve",
	belongs_to = "de:info",
	style = "flat",
	box = { -0.25, -0.25, 0.25, 0.25 }
})

streets.signs.register_sign({
	name = "right",
	description = "Right Curve",
	belongs_to = "de:info",
	style = "flat",
	box = { -0.25, -0.25, 0.25, 0.25 }
})