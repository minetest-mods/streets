--local signs = {
--	{ "priority_road", "Priority Road" },
--	{ "priority_road_end", "Priority Road (End)" },
--	{ "stop", "Stop" },
--	{ "yield", "Yield" },
--}
--
--
--for k,v in pairs(signs) do
--	streets.signs.register_sign({
--		name = v[1],
--		description = v[2],
--		belongs_to = "minetest:priority",
--		style = "box",
--	})
--end

streets.signs.register_sign({
	name = "yield",
	description = "Yield",
	belongs_to = "de:priority",
	style = "flat",
	box = { -0.45, -0.4, 0.45, 0.4 }
})

streets.signs.register_sign({
	name = "stop",
	description = "Stop",
	belongs_to = "de:priority",
	style = "flat",
	box = { -0.45, -0.45, 0.45, 0.45 }
})

streets.signs.register_sign({
	name = "priorityroad",
	description = "Priority Road",
	belongs_to = "de:priority",
	style = "flat",
	box = { -0.43, -0.43, 0.43, 0.43 }
})

streets.signs.register_sign({
	name = "endpriorityroad",
	description = "End of Priority Road",
	belongs_to = "de:priority",
	style = "flat",
	box = { -0.43, -0.43, 0.43, 0.43 }
})