local signs = {
	{ "allvehiclesprohibited", "All Vehicles Prohibited" },
	{ "endoflimitation", "End of Limitation" },
	{ "endofnopassing", "End of No Passing" },
	{ "nobikes", "No Bikes Permitted" },
	{ "nocars", "No Cars Permitted" },
	{ "noentry", "No Entry" },
	{ "noequestrians", "No Equestrians Permitted" },
	{ "noparking", "No Parking" },
	{ "nopassing", "No Passing" },
	{ "nopedestrians", "No Pedestrians Permitted" },
	{ "nostopping", "No Stopping" },
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