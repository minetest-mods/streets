--[[
  ## StreetsMod 2.0 ##
  Submod: signs
  Optional: true
]]

--These register the sections in the workshop that these will be placed into
streets.signs.sections = {
	{name="dyestorage",friendlyname="Dye Storage"}, -- Used for dye storage in the workshop
	{name="warn",friendlyname="Warning"},
	{name="reg",friendlyname="Regulatory"},
	{name="info",friendlyname="Information"},
}

streets.register_road_sign({
	name = "sign_blank",
	friendlyname = "Blank Sign",
	tiles = {
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png"
	},
	thickness = 0.05
})

streets.register_road_sign({
	name = "sign_curve_chevron_right",
	friendlyname = "Curve Chevron Sign (Right)",
	tiles = {
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
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
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_tl_bg.png",
		"streets_curve_sign.png^[transformFX"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {yellow = 3,black = 3}
})

streets.register_road_sign({
	name = "sign_stop",
	friendlyname = "Stop Sign",
	tiles = {
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_transparent.png",
		"streets_stop_sign_back.png",
		"streets_stop_sign_front.png"
	},
	thickness = 0.01,
	section = "reg",
	dye_needed = {red = 4,white = 1}
})

streets.register_road_sign({
	name = "sign_water",
	friendlyname = "Water Warning Sign",
	tiles = {
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_square_sign_back.png",
		"streets_sign_water.png"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {green = 1,blue = 3,black = 1}
})

streets.register_road_sign({
	name = "sign_lava",
	friendlyname = "Lava Warning Sign",
	tiles = {
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_square_sign_back.png",
		"streets_sign_lava.png"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {green = 1,red = 3}
})

streets.register_road_sign({
	name = "sign_construction",
	friendlyname = "Construction Warning Sign",
	tiles = {
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_square_sign_back.png",
		"streets_sign_construction.png"
	},
	thickness = 0.05,
	section = "warn",
	dye_needed = {green = 1,blue = 1,brown = 1}
})

streets.register_road_sign({
	name = "sign_grass",
	friendlyname = "No Walking on Grass Sign",
	tiles = {
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_square_sign_back.png",
		"streets_sign_grass.png"
	},
	thickness = 0.05,
	section = "reg",
	dye_needed = {green = 3,red = 2}
})

streets.register_road_sign({
	name = "sign_mine",
	friendlyname = "Mine Sign",
	tiles = {
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_square_sign_back.png",
		"streets_sign_mine.png"
	},
	thickness = 0.05,
	section = "info",
	dye_needed = {blue = 2,yellow = 1}
})

streets.register_road_sign({
	name = "sign_shop",
	friendlyname = "Shop Sign",
	tiles = {
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_square_sign_back.png",
		"streets_sign_shop.png"
	},
	thickness = 0.05,
	section = "info",
	dye_needed = {blue = 1,red = 1,yellow = 1,blue = 1}
})

streets.register_road_sign({
	name = "sign_work_shop",
	friendlyname = "Workshop Sign",
	tiles = {
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_tl_bg.png^[colorize:#D20000FF",
		"streets_square_sign_back.png",
		"streets_sign_workshop.png"
	},
	thickness = 0.05,
	section = "info",
	dye_needed = {red = 1,yellow = 2,blue = 1}
})
