local signs = {
	{ "parking", "Parking" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2],
		belongs_to = "de:info",
		style = "flat",
		box = { -0.3, -0.3, 0.3, 0.3 }
	})
end