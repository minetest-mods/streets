streets.signs.register_collection({
	name = "minetest",
	description = "Minetest-Style Signs"
})

streets.signs.register_section({ name = "warning", belongs_to = "minetest" })
streets.signs.register_section({ name = "prohibitory", belongs_to = "minetest" })
streets.signs.register_section({ name = "priority", belongs_to = "minetest" })
streets.signs.register_section({ name = "info", belongs_to = "minetest" })
streets.signs.register_section({ name = "writeable", belongs_to = "minetest" })

local modpath = minetest.get_modpath("streets_signs_minetest")

dofile(modpath .. "/warning.lua")
dofile(modpath .. "/prohibitory.lua")
dofile(modpath .. "/priority.lua")
dofile(modpath .. "/info.lua")

if display_api and font_api and signs_api then
	dofile(modpath .. "/writeable.lua")
end

minetest.register_alias("streets:sign_blank", "default:sign_wall_steel")

minetest.register_alias("streets:sign_curve_chevron_left", "streets:signs_minetest_warning_chevron_left")
minetest.register_alias("streets:sign_curve_chevron_right", "streets:signs_minetest_warning_chevron_right")
minetest.register_alias("streets:sign_warning", "streets:signs_minetest_warning_danger")
minetest.register_alias("streets:sign_lava", "streets:signs_minetest_warning_lava")
minetest.register_alias("streets:sign_water", "streets:signs_minetest_warning_water")
minetest.register_alias("streets:sign_construction", "streets:signs_minetest_warning_work")

minetest.register_alias("streets:sign_grass", "streets:signs_minetest_prohibitory_no_pedestrians")



--[[
streets.signs.sections = {
	{ name = "reg", friendlyname = "MT Regulatory" },
	{ name = "info", friendlyname = "MT Information" },
	{ name = "usreg", friendlyname = "US Regulatory" },
	{ name = "uswarn", friendlyname = "US Warning" },
	{ name = "usinfo", friendlyname = "US Information" },
	{ name = "usom", friendlyname = "US Object Markers" },
	{ name = "usttc", friendlyname = "US TTC" },
	{ name = "euprio", friendlyname = "EU Priority" },
	{ name = "euwarn", friendlyname = "EU Warning" },
	{ name = "euprohib", friendlyname = "EU Prohibitory" },
	{ name = "eumandat", friendlyname = "EU Mandatory" },
	{ name = "euinfo", friendlyname = "EU Info" },
	{ name = "euother", friendlyname = "EU Other" }
}

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
	type = "minetest",
	section = "info",
	dye_needed = { blue = 2, yellow = 1 }
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
	type = "minetest",
	section = "info",
	dye_needed = { blue = 1, red = 1, yellow = 1, blue = 1 }
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
	type = "minetest",
	section = "info",
	dye_needed = { red = 1, yellow = 2, blue = 1 }
})

--US Signs
dofile(streets.conf.modpath .. "/streets_signs/us/usreg.lua")
dofile(streets.conf.modpath .. "/streets_signs/us/uswarn.lua")
dofile(streets.conf.modpath .. "/streets_signs/us/usinfo.lua")
dofile(streets.conf.modpath .. "/streets_signs/us/usom.lua")
dofile(streets.conf.modpath .. "/streets_signs/us/usttc.lua")

--EU Signs
dofile(streets.conf.modpath .. "/streets_signs/eu/euwarn.lua")
dofile(streets.conf.modpath .. "/streets_signs/eu/euother.lua")
dofile(streets.conf.modpath .. "/streets_signs/eu/euprio.lua")
dofile(streets.conf.modpath .. "/streets_signs/eu/eumandat.lua")
dofile(streets.conf.modpath .. "/streets_signs/eu/euprohib.lua")
dofile(streets.conf.modpath .. "/streets_signs/eu/euinfo.lua")

]]
