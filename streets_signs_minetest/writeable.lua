local signs = {
	{ "white", "Writeable Sign (White)" },
	{ "yellow", "Writeable Sign (Yellow)" },
	{ "green", "Writeable Sign (Green)" },
}


for k,v in pairs(signs) do
	streets.signs.register_sign({
		name = v[1],
		description = v[2],
		belongs_to = "minetest:writeable",
		style = "box",
		display_entities = {
			["signs:display_text"] = {
				on_display_update = font_lib.on_display_update,
				size = { x = 13/16, y = 13/16 },
				resolution = { x = 9, y = 5 },
				maxlines = 4,
				color = v[1] == "green" and "#fff" or "#000",
				halign = "center",
			}
		},
		on_construct = function(pos)
			signs_api.set_formspec(pos)
			display_lib.on_construct(pos)
		end,
		on_destruct = display_lib.on_destruct,
		on_rotate = display_lib.on_rotate,
		on_receive_fields =  signs_api.on_receive_fields,
		on_punch = function(pos, node, player, pointed_thing) display_lib.update_entities(pos) end,
	})

	streets.signs.register_sign({
		name = v[1] .. "_half",
		description = "Half" .. v[2],
		belongs_to = "minetest:writeable",
		style = "box",
		size = {-0.5, 0, 0.5, 0.5},
		display_entities = {
			["signs:display_text"] = {
				on_display_update = font_lib.on_display_update,
				size = { x = 13/16, y = 6/16 },
				resolution = { x = 9, y = 5.5 },
				maxlines = 2,
				color = v[1] == "green" and "#fff" or "#000",
				height = 0.25,
				halign = "center",
			}
		},
		on_construct = function(pos)
			signs_api.set_formspec(pos)
			display_lib.on_construct(pos)
		end,
		on_destruct = display_lib.on_destruct,
		on_rotate = display_lib.on_rotate,
		on_receive_fields =  signs_api.on_receive_fields,
		on_punch = function(pos, node, player, pointed_thing) display_lib.update_entities(pos) end,
	})
end
