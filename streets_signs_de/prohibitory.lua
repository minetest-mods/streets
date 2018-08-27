local signs = {
	{ "allvehiclesprohibited", "All Vehicles Prohibited" },
	{ "noentry", "No Entry" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2],
		belongs_to = "de:prohibitory",
		style = "flat",
		box = { -0.38, -0.38, 0.38, 0.38 }
	})
end