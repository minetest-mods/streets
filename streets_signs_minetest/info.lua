local signs = {
	{ "parking", "Parking" },
	{ "pedestrians", "Pedestrians" },
	{ "roundabout", "Roundabout" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2],
		belongs_to = "minetest:info",
		style = "box",
	})
end