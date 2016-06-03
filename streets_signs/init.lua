--[[
	## StreetsMod 2.0 ##
	Submod: signs
	Optional: true
]]

--These register the sections in the workshop that these will be placed into
streets.signs.sections = {
	{name = "dyestorage",friendlyname = "Dye Storage"}, -- Used for dye storage in the workshop
	{name = "warn", friendlyname = "MT Warning"},
	{name = "reg", friendlyname = "MT Regulatory"},
	{name = "info", friendlyname = "MT Information"},
	{name = "usreg", friendlyname = "US Regulatory"},
	{name = "uswarn", friendlyname = "US Warning"},
	{name = "usinfo", friendlyname = "US Information"},
	{name = "usom", friendlyname = "US Object Markers"},
	{name = "usttc", friendlyname = "US TTC"},
	{name = "euprio", friendlyname = "EU Priority"},
	{name = "euwarn", friendlyname = "EU Warning"},
	{name = "euprohib", friendlyname = "EU Prohibitory"},
	{name = "eumandat", friendlyname = "EU Mandatory"},
	{name = "euother", friendlyname = "EU Other"},
}

streets.register_road_sign({
	name = "sign_blank",
	friendlyname = "Blank Sign",
	tiles = {
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png"
	},
	thickness = 0.05
})

streets.register_road_sign({
	name = "sign_curve_chevron_right",
	friendlyname = "Curve Chevron Sign (Right)",
	tiles = {
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_curve_sign.png"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_curve_chevron_left",
	friendlyname = "Curve Chevron Sign (Left)",
	tiles = {
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_sign_back.png",
		"streets_curve_sign.png^[transformFX"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_warning",
	friendlyname = "Warning Sign",
	tiles = {
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png",
		"streets_square_sign_empty.png^streets_sign_warning.png"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {black = 2}
})

streets.register_road_sign({
	name = "sign_water",
	friendlyname = "Water Warning Sign",
	tiles = {
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png",
		"streets_square_sign_empty.png^streets_sign_water.png"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {green = 1,blue = 3,black = 1}
})

streets.register_road_sign({
	name = "sign_lava",
	friendlyname = "Lava Warning Sign",
	tiles = {
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png",
		"streets_square_sign_empty.png^streets_sign_lava.png"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {green = 1,red = 3}
})

streets.register_road_sign({
	name = "sign_construction",
	friendlyname = "Construction Warning Sign",
	tiles = {
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png",
		"streets_square_sign_empty.png^streets_sign_construction.png"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {green = 1,blue = 1,brown = 1}
})

streets.register_road_sign({
	name = "sign_grass",
	friendlyname = "No Walking on Grass Sign",
	tiles = {
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png",
		"streets_square_sign_empty.png^streets_sign_grass.png"
	},
	thickness = 0.05,
	section = "reg",
	dye_needed = {green = 3,red = 2}
})

streets.register_road_sign({
	name = "sign_mine",
	friendlyname = "Mine Sign",
	tiles = {
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png",
		"streets_square_sign_empty.png^streets_sign_mine.png"
	},
	thickness = 0.05,
	section = "info",
	dye_needed = {blue = 2,yellow = 1}
})

streets.register_road_sign({
	name = "sign_shop",
	friendlyname = "Shop Sign",
	tiles = {
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png",
		"streets_square_sign_empty.png^streets_sign_shop.png"
	},
	thickness = 0.05,
	section = "info",
	dye_needed = {blue = 1,red = 1,yellow = 1,blue = 1}
})

streets.register_road_sign({
	name = "sign_work_shop",
	friendlyname = "Workshop Sign",
	tiles = {
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png^[colorize:#D20000FF",
		"streets_sign_back.png",
		"streets_square_sign_empty.png^streets_sign_workshop.png"
	},
	thickness = 0.05,
	section = "info",
	dye_needed = {red = 1,yellow = 2,blue = 1}
})

--US Signs

streets.register_road_sign({
	name = "sign_us_4wayintersection",
	friendlyname = "4-Way Intersection Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_4wayintersection.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_arrow_exitgore",
	friendlyname = "Exit Gore Arrow Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_arrow_exitgore.png"
	},
	thickness = 0.01,
	section = "usinfo",
	dye_needed = {green = 4,white = 2}
})

streets.register_road_sign({
	name = "sign_us_arrow_left",
	friendlyname = "Left Arrow Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_arrow_left.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_arrow_right",
	friendlyname = "Right Arrow Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_arrow_left.png^[transformFX"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_arrow_leftright",
	friendlyname = "Left/Right Arrow Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_arrow_leftright.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_bepreparedtostop",
	friendlyname = "Be Prepared to Stop Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_bepreparedtostop.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 2}
})

streets.register_road_sign({
	name = "sign_us_bikelane",
	friendlyname = "Bike Lane Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_bikelane.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 2,black = 4}
})

streets.register_road_sign({
	name = "sign_us_crossbuck",
	friendlyname = "Railroad Crossing Crossbuck",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_crossbuck.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {white = 3,black = 1}
})

streets.register_road_sign({
	name = "sign_us_deadend",
	friendlyname = "Dead End Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_deadend.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_divhwyend",
	friendlyname = "Divided Highway End Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_divhwyend.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_divhwystart",
	friendlyname = "Divided Highway Start Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_divhwystart.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_donotenter",
	friendlyname = "Do Not Enter Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_donotenter.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {red = 4,white = 3}
})

streets.register_road_sign({
	name = "sign_us_donotstopontracks",
	friendlyname = "Do Not Stop on Tracks Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_donotstopontracks.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2}
})

streets.register_road_sign({
	name = "sign_us_emergencyhybridbeacon",
	friendlyname = "Emergency Vehicle Hybrid Beacon Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_emergencyhybridbeacon.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_emergencysignal",
	friendlyname = "Emergency Signal Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_emergencysignal.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2}
})

streets.register_road_sign({
	name = "sign_us_endschoolspeedlimit",
	friendlyname = "End School Speed Limit Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_endschoolspeedlimit.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_arrow_left",
	friendlyname = "Left Arrow",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_arrow_left.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_arrow_exitclosed",
	friendlyname = "Exit Closed Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_exitclosed.png"
	},
	thickness = 0.01,
	section = "usttc",
	dye_needed = {orange = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_firetruckwarning",
	friendlyname = "Fire Truck Warning Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_firetruckwarning.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 2}
})

streets.register_road_sign({
	name = "sign_us_fork",
	friendlyname = "Fork Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_fork.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 2}
})

streets.register_road_sign({
	name = "sign_us_keepright",
	friendlyname = "Keep Right Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_keepright.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftcurve",
	friendlyname = "Left Curve Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftcurve.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_rightcurve",
	friendlyname = "Right Curve Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftcurve.png^[transformFX"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftongreenarrowonly",
	friendlyname = "Left on Green Arrow Only Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftongreenarrowonly.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftreversecurve",
	friendlyname = "Left Reverse Curve Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftreversecurve.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_rightreversecurve",
	friendlyname = "Right Reverse Curve Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftreversecurve.png^[transformFX"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftreverseturn",
	friendlyname = "Left Reverse Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftreversecurve.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_rightreverseturn",
	friendlyname = "Right Reverse Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftreverseturn.png^[transformFX"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftturn",
	friendlyname = "Left Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftturn.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_rightturn",
	friendlyname = "Right Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftturn.png^[transformFX"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftturnonly",
	friendlyname = "Left Turn Only Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftturnonly.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftturnsignal",
	friendlyname = "Left Turn Signal Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftturnsignal.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftturnyieldongreen",
	friendlyname = "Left Turn Yield on Green Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_leftturnyieldongreen.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3,green = 1}
})

streets.register_road_sign({
	name = "sign_us_merge_newlane",
	friendlyname = "Merge into New Lane Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_merge_newlane.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 4}
})

streets.register_road_sign({
	name = "sign_us_merge_samelane",
	friendlyname = "Merge Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_merge_samelane.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_nobicycles",
	friendlyname = "No Bicycles Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_nobicycles.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2,red = 2}
})

streets.register_road_sign({
	name = "sign_us_noleftturn",
	friendlyname = "No Left Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_noleftturn.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2,red = 2}
})

streets.register_road_sign({
	name = "sign_us_nooutlet",
	friendlyname = "No Outlet Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_nooutlet.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_noparkingboth",
	friendlyname = "No Parking (Left/Right) Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_noparkingboth.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,red = 3}
})

streets.register_road_sign({
	name = "sign_us_noparkingleft",
	friendlyname = "No Parking (Left) Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_noparkingleft.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,red = 3}
})

streets.register_road_sign({
	name = "sign_us_noparkingright",
	friendlyname = "No Parking (Right) Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_noparkingright.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,red = 3}
})

streets.register_road_sign({
	name = "sign_us_nopassing",
	friendlyname = "No Passing Zone Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_nopassing.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_noped",
	friendlyname = "No Pedestrians Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_noped.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2,red = 2}
})

streets.register_road_sign({
	name = "sign_us_norightturn",
	friendlyname = "No Right Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_norightturn.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2,red = 2}
})

streets.register_road_sign({
	name = "sign_us_notrucks",
	friendlyname = "No Trucks Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_notrucks.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2,red = 2}
})

streets.register_road_sign({
	name = "sign_us_noturnonred",
	friendlyname = "No Turn on Red Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_noturnonred.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2,red = 1}
})

streets.register_road_sign({
	name = "sign_us_nouturn",
	friendlyname = "No U-Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_nouturn.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2,red = 2}
})

streets.register_road_sign({
	name = "sign_us_om1",
	friendlyname = "Object Marker Type 1",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_om1.png"
	},
	thickness = 0.01,
	section = "usom",
	dye_needed = {yellow = 5}
})

streets.register_road_sign({
	name = "sign_us_om2",
	friendlyname = "Object Marker Type 2",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_om2.png"
	},
	thickness = 0.01,
	section = "usom",
	dye_needed = {yellow = 2}
})

streets.register_road_sign({
	name = "sign_us_om3l",
	friendlyname = "Object Marker Type 3 (Left)",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_om3l.png"
	},
	thickness = 0.01,
	section = "usom",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_om3c",
	friendlyname = "Object Marker Type 3 (Center)",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_om3c.png"
	},
	thickness = 0.01,
	section = "usom",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_om3r",
	friendlyname = "Object Marker Type 3 (Right)",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_om3r.png"
	},
	thickness = 0.01,
	section = "usom",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_om4",
	friendlyname = "Object Marker Type 4",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_om4.png"
	},
	thickness = 0.01,
	section = "usom",
	dye_needed = {red = 5}
})

streets.register_road_sign({
	name = "sign_us_onewayleft",
	friendlyname = "One Way (Left) Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_onewayleft.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_onewayright",
	friendlyname = "One Way (Right) Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_onewayright.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_pedhybridbeacon",
	friendlyname = "Pedestrian Hybrid Beacon Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_pedhybridbeacon.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3,red = 1}
})

streets.register_road_sign({
	name = "sign_us_pedwarning",
	friendlyname = "Pedestrian Warning Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_pedwarning.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_pushtocross_left",
	friendlyname = "Push to Cross (Left) Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_pushtocross_left.png"
	},
	thickness = 0.01,
	section = "usinfo",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_pushtocross_right",
	friendlyname = "Push to Cross (Right) Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_pushtocross_right.png"
	},
	thickness = 0.01,
	section = "usinfo",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_rightturn270",
	friendlyname = "270-Degree Right Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_rightturn270.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_leftturn270",
	friendlyname = "270-Degree Left Turn Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_rightturn270.png^[transformFX"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_rightturnonly",
	friendlyname = "Right Turn Only Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_rightturnonly.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_roadclosed",
	friendlyname = "Road Closed Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_roadclosed.png"
	},
	thickness = 0.01,
	section = "usttc",
	dye_needed = {white = 3,black = 2}
})

streets.register_road_sign({
	name = "sign_us_roadclosedahead",
	friendlyname = "Road Closed Ahead Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_roadclosedahead.png"
	},
	thickness = 0.01,
	section = "usttc",
	dye_needed = {orange = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_roadclosedtothrutraffic",
	friendlyname = "Road Closed to Thru Traffic Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_roadclosedtothrutraffic.png"
	},
	thickness = 0.01,
	section = "usttc",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_roadnarrows",
	friendlyname = "Road Narrows Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_roadnarrows.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_roadworkahead",
	friendlyname = "Road Work Ahead Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_roadworkahead.png"
	},
	thickness = 0.01,
	section = "usttc",
	dye_needed = {orange = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_roundaboutchevron",
	friendlyname = "Roundabout Chevron Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_roundaboutchevron.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 4,black = 4}
})

streets.register_road_sign({
	name = "sign_us_rrxing",
	friendlyname = "Railroad Crossing Advance Warning Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_rrxing.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_schoolcrossing",
	friendlyname = "School Crossing Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_schoolcrossing.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 1,green = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_schoolspeedlimit20",
	friendlyname = "School Speed Limit 20 Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_schoolspeedlimit20.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {green = 1,yellow = 1,white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_speedlimit50",
	friendlyname = "Speed Limit 50 Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_speedlimit50.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_stopahead",
	friendlyname = "Stop Ahead Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_stopahead.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 1,red = 1}
})

streets.register_road_sign({
	name = "sign_us_stopforped",
	friendlyname = "Stop Here for Pedestrians Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_stopforped.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3,red = 1}
})

streets.register_road_sign({
	name = "sign_us_stophereonred",
	friendlyname = "Stop Here on Red Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_stophereonred.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_straightonly",
	friendlyname = "Straight Only Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_straightonly.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_tintersection",
	friendlyname = "T-Intersection Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_tintersection.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_tintersection_stem",
	friendlyname = "T-Intersection (Stem) Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_tintersection_stem.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_trafficlightahead",
	friendlyname = "Traffic Light Ahead Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_trafficlightahead.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 1,red = 1,green = 1}
})

streets.register_road_sign({
	name = "sign_us_twowaytraffic",
	friendlyname = "Two-Way Traffic Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_twowaytraffic.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_utilityworkahead",
	friendlyname = "Utility Work Ahead Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_utilityworkahead.png"
	},
	thickness = 0.01,
	section = "usttc",
	dye_needed = {orange = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_us_wrongway",
	friendlyname = "Wrong Way Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_wrongway.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {red = 5,white = 2}
})

streets.register_road_sign({
	name = "sign_us_yield",
	friendlyname = "Yield Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_yield.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {red = 4,white = 3}
})

streets.register_road_sign({
	name = "sign_us_yieldahead",
	friendlyname = "Yield Ahead Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_yieldahead.png"
	},
	thickness = 0.01,
	section = "uswarn",
	dye_needed = {yellow = 3,black = 1,red = 1,white = 1}
})

streets.register_road_sign({
	name = "sign_us_yieldtoped",
	friendlyname = "Yield Here to Pedestrians Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_yieldtoped.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {white = 3,black = 2,red = 1}
})

streets.register_road_sign({
	name = "sign_us_stop",
	friendlyname = "Stop Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_us_stop.png"
	},
	thickness = 0.01,
	section = "usreg",
	dye_needed = {red = 4,white = 1}
})

streets.register_road_sign({
	name = "sign_eu_twowaytraffic",
	friendlyname = "Two-Way traffic Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_twowaytraffic.png"
	},
	thickness = 0.01,
	section = "euwarn",
	dye_needed = {red = 2, white = 2, black = 1}
})

streets.register_road_sign({
	name = "sign_eu_100m",
	friendlyname = "100m Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_100m.png"
	},
	thickness = 0.01,
	section = "euother",
	dye_needed = {white = 2, black = 1}
})

streets.register_road_sign({
	name = "sign_eu_exit_autobahn",
	friendlyname = "Autobahn exit Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_exit_autobahn.png"
	},
	thickness = 0.01,
	section = "euother",
	dye_needed = {white = 1, blue = 4}
})

streets.register_road_sign({
	name = "sign_eu_additional_lane",
	friendlyname = "Additional lane Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_additional_lane.png"
	},
	thickness = 0.01,
	section = "euother",
	dye_needed = {white = 3, black = 1}
})

streets.register_road_sign({
	name = "sign_eu_trafficlightahead",
	friendlyname = "Trafficlight Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_trafficlightahead.png"
	},
	thickness = 0.01,
	section = "euwarn",
	dye_needed = {red = 2, white = 2, black = 1}
})

streets.register_road_sign({
	name = "sign_eu_standrews",
	friendlyname = "St. Andrews Cross",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_standrews.png"
	},
	thickness = 0.01,
	section = "euwarn",
	dye_needed = {white = 2, red = 1}
})

streets.register_road_sign({
	name = "sign_eu_farmanimals",
	friendlyname = "Farm Animals Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_farmanimals.png"
	},
	thickness = 0.01,
	section = "euwarn",
	dye_needed = {red = 2, white = 2, black = 1}
})

streets.register_road_sign({
	name = "sign_eu_arrow_bw_R0",
	friendlyname = "Arrow additional Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_arrow_bw.png"
	},
	thickness = 0.01,
	section = "euother",
	dye_needed = {white = 2, black = 1}
})

streets.register_road_sign({
	name = "sign_eu_arrow_bw_R180",
	friendlyname = "Arrow additional Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_sign_back.png",
		"streets_sign_eu_arrow_bw.png^[transformR180"
	},
	thickness = 0.01,
	section = "euother",
	dye_needed = {white = 2, black = 1}
})
