local signs = {
	{ "danger", "Danger" },
	{ "work", "Work" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2],
		belongs_to = "de:warning",
		style = "flat",
		box = { -0.45, -0.4, 0.45, 0.4 }
	})
end