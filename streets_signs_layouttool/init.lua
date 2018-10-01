local modpath = minetest.get_modpath("streets_signs_layouttool")

local function validHexColor(color)
	return nil ~= color:find("^#%x%x%x%x%x%x$")
end

streets.signs.register_collection({
	name = "canvas",
	description = "Canvas Signs"
})

streets.signs.register_section({ name = "blank", belongs_to = "canvas" })

dofile(modpath .. "/api.lua")

streets.signs_layouttool.register_collection({
	name = "de"
})

streets.signs_layouttool.register_section({
	name = "arrows",
	belongs_to  = "de",
})

streets.signs_layouttool.register_section({
	name = "base",
	belongs_to  = "de",
})

streets.signs_layouttool.register_sign({
	description = "Right Yellow Arrow",
	name = "yellow_right",
	belongs_to = "de:arrows",
	border_left = 6,
	border_right = 38,
	border_top = 6,
	border_bottom = 6,
	top = "streets_signs_de__arrows__yellow_right__top.png",
	left = "streets_signs_de__arrows__yellow_right__left.png",
	bottom = "streets_signs_de__arrows__yellow_right__bottom.png",
	right = "streets_signs_de__arrows__yellow_right__right.png",
	center = "streets_signs_de__arrows__yellow_right__center.png",
	top_left = "streets_signs_de__arrows__yellow_right__top_left.png",
	bottom_left = "streets_signs_de__arrows__yellow_right__bottom_left.png",
	top_right = "rowspan",
	bottom_right = "rowspan",
})

streets.signs_layouttool.register_sign({
	description = "Small White Base Plate",
	name = "white_small",
	belongs_to = "de:base",
	border_left = 4,
	border_right = 4,
	border_top = 4,
	border_bottom = 4,
	top = "streets_signs_de__base__white_small__top.png",
	left = "streets_signs_de__base__white_small__left.png",
	bottom = "streets_signs_de__base__white_small__bottom.png",
	right = "streets_signs_de__base__white_small__right.png",
	center = "streets_signs_de__base__white_small__center.png",
	top_left = "streets_signs_de__base__white_small__top_left.png",
	bottom_left = "streets_signs_de__base__white_small__bottom_left.png",
	top_right = "streets_signs_de__base__white_small__top_right.png",
	bottom_right = "streets_signs_de__base__white_small__bottom_right.png",
})

local presets = {
	["preset:detour_right"] = {
		name = "preset:detour_right",
		description = "Detour Right",
		size = 2,
		content = {
			{
				type = "image",
				h = 60,
				w = 179,
				x = 10,
				y = 0,
				name = "de:arrows:yellow_right",
				transform = "",
			},
			{
				type = "text",
				w = 200,
				h = 50,
				x = 0,
				y = 0,
				scale_x = 1.5,
				scale_y = 1.5,
				maxlines = 2,
				halign = "center",
				valign = "center",
				text = "Umleitung\nDetour",
				color = "#000000"
			}
		}
	},
	["preset:detour_left"] = {
		name = "preset:detour_left",
		description = "Detour left",
		size = 2,
		content = {
			{
				type = "image",
				h = 60,
				w = 179,
				x = 10,
				y = 0,
				name = "de:arrows:yellow_right",
				transform = "",
			},
			{
				type = "text",
				w = 200,
				h = 50,
				x = 0,
				y = 0,
				maxlines = 2,
				halign = "center",
				valign = "center",
				text = "Umleitung",
				color = "#000000"
			}
		}
	}
}


local combine_escape = function(s)
	s = s:gsub(":", "\\:")
	s = s:gsub("%^", "\\%^")
	return s
end

local render_image = function(def, grid)
	local p = "[combine:" .. 128 * def.size .. "x" .. 128 * def.size
	if grid then
		p = p .. ":0,0=streets_" .. 128 * def.size .. ".png"
	end
	for k, v in ipairs(def.content) do
		if v.type == "image" then
			local sign_def = streets.signs_layouttool.get_sign_definition(v.name)
			minetest.log(dump(v.x))
			local x1 = (64 * def.size) - (0.5 * v.w) + v.x
			local y1 = (64 * def.size) - (0.5 * v.h) + v.y
			local x2 = x1 + sign_def.border_left
			local y2 = y1 + sign_def.border_top
			local x3 = x1 + v.w - sign_def.border_right
			local y3 = y1 + v.h - sign_def.border_bottom
			local center_height = v.h - sign_def.border_top - sign_def.border_bottom
			local left_height = center_height
			local right_height = center_height
			local center_width = v.w - sign_def.border_left - sign_def.border_right
			local top_width = center_width
			local bottom_width = center_width
			local tlx = x1
			local tly = y1
			local tx = x2
			local ty = y1
			local trx = x3
			local try = y1
			local lx = x1
			local ly = y2
			local rx = x3
			local ry = y2
			local blx = x1
			local bly = y3
			local bx = x2
			local by = y3
			local brx = x3
			local bry = y3
			if sign_def.top_left == "rowspan" then
				left_height = left_height + sign_def.border_top
				ly = y1
			elseif sign_def.top_left == "colspan" then
				top_width = top_width + sign_def.border_left
				tx = x1
			else
				p = p .. ":" .. x1 .. "," .. y1 .. "="
				p = p .. sign_def.top_left
			end
			if sign_def.top_right == "rowspan" then
				right_height = right_height + sign_def.border_top
				ry = y1
			elseif sign_def.top_right == "colspan" then
				top_width = top_width + sign_def.border_right
			else
				p = p .. ":" .. x3 .. "," .. y1 .. "="
				p = p .. sign_def.top_right
			end
			if sign_def.bottom_left == "rowspan" then
				left_height = left_height + sign_def.border_bottom
			elseif sign_def.bottom_left == "colspan" then
				bottom_width = bottom_width + sign_def.border_left
				bx = x1
			else
				p = p .. ":" .. x1 .. "," .. y3 .. "="
				p = p .. sign_def.bottom_left
			end
			if sign_def.bottom_right == "rowspan" then
				right_height = right_height + sign_def.border_bottom
			elseif sign_def.bottom_right == "colspan" then
				bottom_width = bottom_width + sign_def.border_right
			else
				p = p .. ":" .. x3 .. "," .. y3 .. "="
				p = p .. sign_def.bottom_right
			end
			p = p .. ":" .. tx .. "," .. ty .. "="
			p = p .. sign_def.top
			p = p .. "\\^[resize\\:" .. top_width .. "x" .. sign_def.border_top
			p = p .. ":" .. lx .. "," .. ly .. "="
			p = p .. sign_def.left
			p = p .. "\\^[resize\\:" .. sign_def.border_left .. "x" .. left_height
			p = p .. ":" .. x2 .. "," .. y2 .. "="
			p = p .. sign_def.center
			p = p .. "\\^[resize\\:" .. center_width .. "x" .. center_height
			p = p .. ":" .. rx .. "," .. ry .. "="
			p = p .. sign_def.right
			p = p .. "\\^[resize\\:" .. sign_def.border_right .. "x" .. right_height
			p = p .. ":" .. bx .. "," .. by .. "="
			p = p .. sign_def.bottom
			p = p .. "\\^[resize\\:" .. bottom_width .. "x" .. sign_def.border_bottom
		elseif v.type == "text" then
			local x = (64 * def.size) - (0.5 * v.w) + v.x
			local y = (64 * def.size) - (0.5 * v.h) + v.y
			local font = font_api.get_font(font_api.get_default_font_name())
			v.maxlines = v.maxlines or 1
			p = p .. ":" .. x .. "," .. y .. "="
			p = p .. combine_escape(font:make_text_texture(
				v.text,
				font:get_height(v.maxlines) * v.w / v.h / (v.aspect_ratio or 1),
				font:get_height(v.maxlines),v.maxlines, v.halign, v.valign, v.color))
			p = p .. "\\^[resize\\:" .. v.w .. "x" .. v.h
		end
	end
	return p
end

local validate_int_value = function(value, fallback, no_min)
	if tonumber(value) then
		value = tonumber(value)
		if math.floor(value) then
			value = math.floor(value)
			if value > fallback or no_min then
				return value
			else
				return fallback
			end
		else
			return fallback
		end
	else
		return fallback
	end
end

local validate_positive_number_value = function(value, fallback)
	if tonumber(value) then
		value = tonumber(value)
		if value > 0 then
			return value
		else
			return fallback
		end
	else
		return fallback
	end
end

local validate_def = function(def)
	if def.size then
		def.size = tonumber(def.size)
	end
	if not def.size or def.size < 1 or def.size > 3 then
		def.size = 1
	end
	if not def.content or type(def.content) ~= "table" then
		def.content = {}
	end
	for k,content in ipairs(def.content) do
		local min_w = 1
		local min_h = 1
		if content.type == "image" then
			local img_def = streets.signs_layouttool.get_sign_definition(content.name)
			min_w = img_def.border_left + img_def.border_right + 1
			min_h = img_def.border_top + img_def.border_bottom + 1
		else
			if not validHexColor(content.color) then
				content.color = "#000000"
			end
			content.maxlines = validate_int_value(content.maxlines, 1)
			content.aspect_ratio = validate_positive_number_value(content.aspect_ratio, 1)
			if content.valign ~= "top" or content.valign ~= "bottom" then
				content.valign = "center"
			end
			if content.halign ~= "left" or content.halign ~= "right" then
				content.halign = "center"
			end
		end
		content.w = validate_int_value(content.w, min_w)
		content.h = validate_int_value(content.h, min_h)
		content.x = validate_int_value(content.x, 0, true)
		content.y = validate_int_value(content.y, 0, true)
	end
	if not def.description then
		def.description = ""
	end
	return def
end

local get_data = function(name, data, preset)
	local result
	if data[name] and type(data[name]) == "table" then
		result = validate_def(data[name])
	elseif type(preset) == "table" and preset[name] and type(preset[name]) == "table" then
		result = validate_def(preset[name])
		result.preset = true
	end
	return result
end

local show_formspec = function(itemstack, player)
	if not player then
		return nil
	end
	local playername = player:get_player_name()
	local csrf_token = math.random(10000,10000000)
	local meta = itemstack:get_meta()
	local data = minetest.deserialize(meta:get_string("data")) or {}
	local fs = "size[12,9]"
	fs = fs .. "dropdown[0,0;0;workaround;;]"
	if meta:get_string("delete") ~= nil and get_data(meta:get_string("delete"), data) then
		local def = get_data(meta:get_string("delete"), data)
		fs = fs .. 'label[1,1;Do you really want to delete "' .. def.description .. '"?]'
		fs = fs .. "button[1,2;2,1;yes;" .. minetest.colorize("red", "YES – DELETE") .. "]"
		fs = fs .. "button[4,2;2,1;no;" .. minetest.colorize("green", "NO – KEEP") .. "]"
	elseif meta:get_int("remove") > 0 and meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data) then
		fs = fs .. 'label[1,1;Do you really want to delete this element?]'
		fs = fs .. "button[1,2;2,1;yes;" .. minetest.colorize("red", "YES – DELETE") .. "]"
		fs = fs .. "button[4,2;2,1;no;" .. minetest.colorize("green", "NO – KEEP") .. "]"
	elseif meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data) and meta:get_int("edit") > 0 then
		fs = fs .. "button[0,0;1,1;back;Back]"
		fs = fs .. "image[0.05,2.65;6.5,6.5;"
		fs = fs .. minetest.formspec_escape(render_image(get_data(meta:get_string("select"), data), true))
		fs = fs .."]"
		fs = fs .. "button[1,0;1,1;save;Save]"
		local def = get_data(meta:get_string("select"), data)
		if def.content[meta:get_int("edit")] and type(def.content[meta:get_int("edit")]) == "table" then
			local content = def.content[meta:get_int("edit")]
			fs = fs .. "field[6,0.5;2.5,1;w;Width;" .. (content.w or "") .. "]"
			fs = fs .. "field[8.5,0.5;2.5,1;h;Height;" .. (content.h or "") .. "]"
			fs = fs .. "field[6,1.5;2.5,1;x;X Offset;" .. (content.x or "") .. "]"
			fs = fs .. "field[8.5,1.5;2.5,1;y;Y Offset;" .. (content.y or "") .. "]"
			if content.type == "image" then
				fs = fs .. "textlist[5.75,2.5;5,6;image_name;"
				local first = true
				local sign_to_int = {}
				for k,v in ipairs(streets.signs_layouttool.all_signs) do
					if first then
						first = false
					else
						fs = fs .. ","
					end
					sign_to_int[v.belongs_to .. ":" .. v.name] = k
					fs = fs .. minetest.formspec_escape(v.description .. " (" .. v.belongs_to .. ":" .. v.name .. ")")
				end
				fs = fs .. ";" .. sign_to_int[content.name] .. ";false]"
			elseif content.type == "text" then
				fs = fs .. "field[6,2.5;2.5,1;maxlines;Max Lines;" .. (content.maxlines or "") .. "]"
				fs = fs .. "field[8.5,2.5;2.5,1;aspect_ratio;Aspect Ratio;" .. (content.aspect_ratio or "") .. "]"
				fs = fs .. "field[6,3.5;5,1;color;Color;" .. content.color .. "]"
				local valign_to_int = {top = 1, center = 2, bottom = 3}
				local halign_to_int = {left = 1, center = 2, right = 3}
				fs = fs .. "label[5.75,4;Vertical Align]"
				fs = fs .. "dropdown[5.75,4.5;2.5;valgin;top,center,bottom;" .. (valign_to_int[content.valign] or "2") .. "]"
				fs = fs .. "label[8.25,4;Horizontal Align]"
				fs = fs .. "dropdown[8.25,4.5;2.5;halgin;left,center,right;" .. (halign_to_int[content.halign] or "2") .. "]"
				fs = fs .. "textarea[6,5.5;5,2;text;Text;" .. (content.text or "") .. "]"
			end
		end

	elseif meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data, presets) then
		local def = get_data(meta:get_string("select"), data, presets)
		fs = fs .. "button[0,0;1,1;back;Back]"
		fs = fs .. "button[1,0;1.5,1;add_text;Add Text]"
		fs = fs .. "button[2.5,0;1.5,1;add_image;Add Image]"
		fs = fs .. "image[0.05,2.65;6.5,6.5;"
		fs = fs .. minetest.formspec_escape(render_image(def, true))
		fs = fs .."]"
		fs = fs .. "field[6,0.5;5,1;description;Description;" .. def.description .. "]"
		fs = fs .. "field[6,1.5;5,1;id;ID;" .. def.name .. "]"
		fs = fs .. "label[5.75,2;Size]"
		fs = fs .. "dropdown[5.75,2.5;5;size;1: Small (max. 128x128px / 1x1m),2: Medium (max. 256x256px / 2x2m),3: Large (max. 384x384px / 3x3m);"
		fs = fs .. def.size .. "]"
		local y = 3.5
		local even = true
		for k, v in ipairs(def.content) do
			if not def.preset then
				fs = fs .. "image_button[5.75," .. y + 0.05 .. ";0.75,0.5;streets_transparent.png;edit__" .. k .. ";Edit]"
				fs = fs .. "image_button[6.5," .. y + 0.05 .. ";0.75,0.5;streets_transparent.png;duplicate__" .. k .. ";Copy]"
				fs = fs .. "image_button[7.25," .. y + 0.05 .. ";0.5,0.5;streets_transparent.png;remove__" .. k .. ";"
				fs = fs .. minetest.colorize("#f00", "X") .. "]"
				fs = fs .. "image_button[7.75," .. y + 0.05 .. ";0.5,0.5;streets_transparent.png;up__" .. k .. ";^]"
				fs = fs .. "image_button[8.25," .. y + 0.05 .. ";0.5,0.5;streets_transparent.png;down__" .. k .. ";v]"
			end
			if v.type == "text" then
				fs = fs .. "label[8.75," .. y .. ";" .. minetest.colorize(even and "aqua" or "wheat", "Text: " .. v.text:gsub("\n", " ")) .. "]"
			elseif v.type == "image" then
				fs = fs .. "label[8.75," .. y .. ";" .. minetest.colorize(even and "aqua" or "wheat", "Image: " .. v.name) .. "]"
			end
			y = y + 0.5
			even = not even
		end
		if not def.preset then
			fs = fs .. "button[4,0;1,1;save;Save]"
		end
	else
		fs = fs .. "label[3,0;Description]label[8,0;ID]box[0,0.4;11.5,0.05;#ffffff]"
		fs = fs .. "label[0,0.5;CUSTOM SIGNS]"
		local y = 1
		local even = true
		-- if data is nil or data table is empty
		if data == nil or next(data) == nil then
			fs = fs .. "label[0," .. y .. ";" .. minetest.colorize("grey", "No entries found.") .. "]"
			y = y + 0.5
		else
			for k, v in pairs(data) do
				v = validate_def(v)
				fs = fs .. "image[0.05," .. y .. ";0.5,0.5;" .. minetest.formspec_escape(render_image(v)) .."]"
				fs = fs .. "image_button[0.5," .. y + 0.05 .. ";1,0.5;streets_transparent.png;select__" .. v.name .. ";Select]"
				fs = fs .. "image_button[1.5," .. y + 0.05 .. ";1,0.5;streets_transparent.png;copy__" .. v.name .. ";Copy]"
				fs = fs .. "image_button[2.5," .. y + 0.05 .. ";0.5,0.5;streets_transparent.png;delete__" .. v.name .. ";"
				fs = fs .. minetest.colorize("#f00", "X") .. "]"
				fs = fs .. "label[3," .. y .. ";" .. minetest.colorize(even and "aqua" or "wheat", v.description) .. "]"
				fs = fs .. "label[8," .. y .. ";" .. minetest.colorize(even and "aqua" or "wheat", v.name) .. "]"
				y = y + 0.5
				even = not even
			end
		end
		fs = fs .. "label[0," .. y .. ";PRESETS]"
		y = y + 0.5
		if presets == nil or next(presets) == nil then
			fs = fs .. "label[0," .. y .. ";" .. minetest.colorize("grey", "No entries found.") .. "]"
			y = y + 0.5
		else
			for k, v in pairs(presets) do
				v = validate_def(v)
				fs = fs .. "image[0.05," .. y .. ";0.5,0.5;" .. minetest.formspec_escape(render_image(v)) .."]"
				fs = fs .. "image_button[0.5," .. y + 0.05 .. ";1,0.5;streets_transparent.png;select__" .. v.name .. ";Select]"
				fs = fs .. "image_button[1.5," .. y + 0.05 .. ";1,0.5;streets_transparent.png;copy__" .. v.name .. ";Copy]"
				fs = fs .. minetest.colorize("#f00", "X") .. "]"
				fs = fs .. "label[3," .. y .. ";" .. minetest.colorize(even and "aqua" or "wheat", v.description) .. "]"
				fs = fs .. "label[8," .. y .. ";" .. minetest.colorize(even and "aqua" or "wheat", v.name) .. "]"
				y = y + 0.5
				even = not even
			end
		end
		fs = fs .. "button[9,8;3,1;new;" .. minetest.colorize("green", "+") .. " Add Sign]"
	end
	player:set_attribute("streets_signs_layouttool:csrf_token", csrf_token)
	minetest.show_formspec(playername, "streets_signs_layouttool:" .. csrf_token, fs)
end

minetest.register_craftitem(":streets:signs_layouttool", {
	description = "Signs Layouttool",
	inventory_image = "default_sign_steel.png^default_stick.png",
	on_use = function(itemstack, player, pointed_thing)
		show_formspec(itemstack, player)
	end,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing and pointed_thing.type == "node" then
			local pos = pointed_thing.under
			local node = minetest.get_node(pos)
			if not minetest.is_protected(pos, placer:get_player_name()) then
				local item_meta = itemstack:get_meta()
				local data = minetest.deserialize(item_meta:get_string("data")) or {}
				if item_meta:get_string("select") then
					local def = get_data(item_meta:get_string("select"), data, presets)
					local node_name = node.name
					if (def.size == 1 and node_name:sub(1, 34) == "streets:signs_canvas__blank__small") or
							(def.size == 2 and node_name:sub(1, 35) == "streets:signs_canvas__blank__medium") or
							(def.size == 3 and node_name:sub(1, 34) == "streets:signs_canvas__blank__large") then
						local node_meta = minetest.get_meta(pos)
						if def and def.preset then
							node_meta:set_string("def", nil)
							node_meta:set_string("preset", def.name)
						elseif def then
							node_meta:set_string("preset", nil)
							node_meta:set_string("def", minetest.serialize(def))
						end
						display_api.update_entities(pos)
					end
				end
			end
		end
		return itemstack
	end,
	stack_max = 1,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if not fields then return end
	if fields.quit == "true" then
		player:set_attribute("streets_roadmarkingtool:csrf_token", "")
		return
	end
	local csrf_token = player:get_attribute("streets_signs_layouttool:csrf_token")
	if not csrf_token then
		return
	elseif formname ~= "streets_signs_layouttool:" .. csrf_token then
		return
	end
	local wielded_item = player:get_wielded_item()
	if not wielded_item or wielded_item:get_name() ~= "streets:signs_layouttool" then
		return
	end
	local meta = wielded_item:get_meta()
	local data = minetest.deserialize(meta:get_string("data")) or {}

	if fields.yes then
		if meta:get_string("delete") ~= nil and get_data(meta:get_string("delete"), data) then
			data[meta:get_string("delete")] = nil
			meta:set_string("delete", nil)
		elseif meta:get_int("remove") > 0 and meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data) then
			table.remove(get_data(meta:get_string("select"), data).content, meta:get_int("remove"))
			meta:set_int("remove", 0)
		end
		meta:set_string("delete", nil)
	elseif fields.no then
		meta:set_string("delete", nil)
		meta:set_string("remove", nil)
	elseif fields.back then
		meta:set_string("delete", nil)
		meta:set_string("remove", nil)
		if meta:get_int("edit") > 0 then
			meta:set_int("edit", 0)
		else
			meta:set_string("select", nil)
		end
	elseif fields.new then
		local random = math.random(10000,10000000)
		data["new:" .. random] = {
			name = "new:" .. random,
		}
		meta:set_string("select", "new:" .. random)
	elseif fields.add_text then
		if meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data) then
			local def = get_data(meta:get_string("select"), data)
			table.insert(def.content, {
				type = "text",
				w = 128,
				h = 64,
				x = 0,
				y = 0,
				maxlines = 3,
				halign = "center",
				valign = "center",
				text = "New Text",
				color = "#000000"
			})
		end
	elseif fields.add_image then
		if meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data) then
			local def = get_data(meta:get_string("select"), data)
			table.insert(def.content, {
				type = "image",
				h = 128,
				w = 128,
				x = 0,
				y = 0,
				name = "de:arrows:yellow_right",
				transform = "",
			})
		end
	elseif fields.save then
		if meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data) then
			local def = get_data(meta:get_string("select"), data)
			if meta:get_int("edit") > 0 then
				if def.content[meta:get_int("edit")] and type(def.content[meta:get_int("edit")]) == "table" then
					local content = def.content[meta:get_int("edit")]
					content.w = fields.w
					content.h = fields.h
					content.x = fields.x
					content.y = fields.y
					if content.type == "text" then
						content.maxlines = fields.maxlines
						content.aspect_ratio = fields.aspect_ratio
						content.color = fields.color
						local int_to_valign = {"top", "center", "bottom"}
						local int_to_halign = {"left", "center", "right"}
						content.valign = int_to_valign[fields.valign] or "center"
						content.halign = int_to_halign[fields.halign] or "center"
						content.text = fields.text
					elseif content.type == "image" then
					end
				end
			else
				def.description = fields.description
				def.size = fields.size:sub(1,1);
				if not get_data(fields.id, data, presets) then
					data[fields.id] = table.copy(get_data(meta:get_string("select"), data))
					data[meta:get_string("select")] = nil
					local new_def = get_data(fields.id, data)
					new_def.name = fields.id
				end
			end
			def = validate_def(def)
		end
	elseif fields.image_name and meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data)
			and meta:get_int("edit") > 0 then
		local def = get_data(meta:get_string("select"), data)
		if def.content[meta:get_int("edit")] and type(def.content[meta:get_int("edit")]) == "table" then
			local content = def.content[meta:get_int("edit")]
			local result = minetest.explode_textlist_event(fields.image_name)
			if streets.signs_layouttool.all_signs[result.index] and content.type == "image" then
				content.name = streets.signs_layouttool.all_signs[result.index].belongs_to .. ":" .. streets.signs_layouttool.all_signs[result.index].name
			end
		end
	else
		if meta:get_string("select") ~= nil and get_data(meta:get_string("select"), data) then
			local def = get_data(meta:get_string("select"), data)
			for i = 1,#def.content do
				-- SIGN CONTENTS
				if fields["edit__" .. i] then
					meta:set_int("edit", i)
					meta:set_int("remove", 0)
				elseif fields["remove__" .. i] then
					minetest.chat_send_all("TEST")
					meta:set_int("remove", i)
					meta:set_int("edit", 0)
				elseif fields["duplicate__" .. i] then
					local def = get_data(meta:get_string("select"), data)
					table.insert(def.content, table.copy(def.content[i]))
				elseif fields["up__" .. i] and i ~= 1 then
					local def = get_data(meta:get_string("select"), data)
					local temp = table.copy(def.content[i])
					def.content[i] = table.copy(def.content[i-1])
					def.content[i-1] = table.copy(temp)
				elseif fields["down__" .. i] and i ~= #def.content then
					local def = get_data(meta:get_string("select"), data)
					local temp = table.copy(def.content[i])
					def.content[i] = table.copy(def.content[i+1])
					def.content[i+1] = table.copy(temp)
				end
			end
		end
		for k,v in pairs(data) do
			-- SIGNS
			if fields["select__" .. v.name] then
				meta:set_string("select", v.name)
				meta:set_string("delete", nil)
			elseif fields["delete__" .. v.name] then
				if get_data(v.name, data) then
					meta:set_string("delete", v.name)
					meta:set_string("select", nil)
				end
			elseif fields["copy__" .. v.name] then
				meta:set_string("select", nil)
				meta:set_string("delete", nil)
				if not get_data("copied:" .. v.name, data, presets) then
					data["copied:" .. v.name] = table.copy(get_data(v.name, data, presets))
					local new_def = get_data("copied:" .. v.name, data)
					new_def.name = "copied:" .. v.name
				end
			end
		end
		for k,v in pairs(presets) do
			if fields["select__" .. v.name] then
				meta:set_string("select", v.name)
				meta:set_string("delete", nil)
			elseif fields["copy__" .. v.name] then
				meta:set_string("select", nil)
				meta:set_string("delete", nil)
				if not get_data("copied:" .. v.name, data, presets) then
					data["copied:" .. v.name] = table.copy(get_data(v.name, data, presets))
					local new_def = get_data("copied:" .. v.name, data)
					new_def.name = "copied:" .. v.name
					new_def.preset = false
				end
			end
		end
	end
	meta:set_string("data", minetest.serialize(data))
	player:set_wielded_item(wielded_item)
	show_formspec(wielded_item, player)
end)



local on_display_update = function (pos, objref)
	local meta = minetest.get_meta(pos)
	local preset = meta:get_string("preset")
	local def = {}
	if preset then
		def = get_data(preset, {}, presets)
		if not def then
			def = minetest.deserialize(meta:get_string("def"))
		end
	else
		def = minetest.deserialize(meta:get_string("def"))
	end
	local entity = objref:get_luaentity()
	local ndef = minetest.registered_nodes[minetest.get_node(pos).name]
	if not def or next(def) == nil then
		objref:set_properties({
			textures = {
				"streets_signs_back.png",
				"streets_signs_back.png",
			},
			visual_size = ndef.display_entities[entity.name].size
		})
		return
	end
	def = validate_def(def)

	if entity and ndef.display_entities[entity.name] then
		local tex = render_image(def)
		objref:set_properties({
			textures = {
				tex	.. "^[colorize:#fff^[mask:(" .. combine_escape(tex)	.. "^streets_signs_back.png)^[transformFX",
				tex,
			},
			visual_size = ndef.display_entities[entity.name].size
		})
	end
end

display_api.register_display_entity("streets:sign_canvas")

streets.signs.register_sign({
	name = "small",
	description = "Small Sign",
	belongs_to = "canvas:blank",
	style = "flat",
	tex = "streets_transparent.png",
	size = 1,
	display_entities = {
		["streets:sign_canvas"] = {
			on_display_update = on_display_update,
			size = {x = 1, y = 1},
		}
	},
	on_construct = function(pos)
		display_api.on_construct(pos)
	end,
	box = {-0.5, -0.5, 0.5, 0.5},
	on_destruct = display_api.on_destruct,
	on_rotate = display_api.on_rotate,
	on_punch = function(pos, node, player, pointed_thing) display_api.update_entities(pos) end,
})

streets.signs.register_sign({
	name = "medium",
	description = "Medium Sign",
	belongs_to = "canvas:blank",
	style = "flat",
	tex = "streets_transparent.png",
	size = 2,
	display_entities = {
		["streets:sign_canvas"] = {
			on_display_update = on_display_update,
			size = {x = 2, y = 2},
		}
	},
	on_construct = function(pos)
		display_api.on_construct(pos)
	end,
	box = {-0.5, -0.5, 0.5, 0.5},
	on_destruct = display_api.on_destruct,
	on_rotate = display_api.on_rotate,
	on_punch = function(pos, node, player, pointed_thing) display_api.update_entities(pos) end,
})

streets.signs.register_sign({
	name = "large",
	description = "Large Sign",
	belongs_to = "canvas:blank",
	style = "flat",
	tex = "streets_transparent.png",
	size = 3,
	display_entities = {
		["streets:sign_canvas"] = {
			on_display_update = on_display_update,
			size = {x = 3, y = 3},
		}
	},
	on_construct = function(pos)
		display_api.on_construct(pos)
	end,
	box = {-0.5, -0.5, 0.5, 0.5},
	on_destruct = display_api.on_destruct,
	on_rotate = display_api.on_rotate,
	on_punch = function(pos, node, player, pointed_thing) display_api.update_entities(pos) end,
})