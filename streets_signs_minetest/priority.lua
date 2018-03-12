local signs = {
	{ "priority_road", "Priority Road" },
	{ "priority_road_end", "Priority Road (End)" },
	{ "stop", "Stop" },
	{ "yield", "Yield" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2],
		belongs_to = "minetest:priority",
		style = "box",
	})
end