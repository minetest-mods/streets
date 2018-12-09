local signs = {
	{ "bikes" },
	{ "children" },
	{ "crosswalk" },
	{ "danger" },
	{ "deer" },
	{ "ice" },
	{ "narrow", "Narrowed Road" },
	{ "narrow_left", "Narrowed Road (Left-hand side)" },
	{ "narrow_right", "Narrowed Road (Right-hand side)" },
	{ "pedestrians" },
	{ "trafficlight", "Traffic Light Ahead" },
	{ "trains" },
	{ "work" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2] or v[1]:sub(1,1):upper() .. v[1]:sub(2),
		belongs_to = "de:warning",
		style = "flat",
		box = { -0.45, -0.4, 0.45, 0.4 }
	})
end