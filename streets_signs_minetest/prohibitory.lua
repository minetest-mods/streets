local signs = {
	{ "no_entry", "No Entry" },
	{ "no_left", "No Left Turn" },
	{ "no_parking", "No Parking" },
	{ "no_pedestrians", "No Pedestrians" },
	{ "no_right", "No Right Turn" },
	{ "no_straight", "No Straight Through" },
	{ "slow", "Slow" },
	{ "slow_end", "Slow (End)" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2],
		belongs_to = "minetest:prohibitory",
		style = "box",
	})
end