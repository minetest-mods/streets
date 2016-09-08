--[[
	## StreetsMod 2.0 ##
	Submod: signworkshop
	Optional: true
]]

streets.signworkshop = {}

function streets.signworkshop.start(pos)
	local node = minetest.get_node(pos)
	if node.name ~= "streets:sign_workshop" then
		return
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local template = inv:get_stack("template", 1):get_name()
	if not (template and template ~= "") then
		return
	end
	local surface = inv:get_stack("surface", 1):get_name()
	if not (surface and surface ~= "") then
		return
	end
	local dyes_needed = streets.signs.signtypes[template].dye_needed
	if not (dyes_needed) then
		return
	end
	local dye_level_ok = true
	for k, v in pairs(dyes_needed) do
		dye_level_ok = dye_level_ok and inv:contains_item("dye", { name = "dye:" .. k, count = v })
	end
	if not dye_level_ok then
		return
	end
	if not inv:room_for_item("output", { name = template, count = 1 }) then
		return
	end
	meta:set_string("working_on", template)
	meta:set_int("progress", 0)
	inv:remove_item("surface", { name = inv:get_stack("surface", 1):get_name(), count = 1 })
	for k, v in pairs(dyes_needed) do
		inv:remove_item("dye", { name = "dye:" .. k, count = v })
	end
	streets.signworkshop.step(pos)
end

function streets.signworkshop.step(pos)
	local node = minetest.get_node(pos)
	if node.name ~= "streets:sign_workshop" then
		return
	end
	local meta = minetest.get_meta(pos)
	if meta:get_string("working_on") == "" then
		return
	end
	local inv = meta:get_inventory()
	local progress = meta:get_int("progress")
	progress = progress + 1
	if progress < 10 then
		minetest.after(0.2, streets.signworkshop.step, pos)
	else
		meta:set_int("progress", 0)
		progress = 0
		inv:add_item("output", meta:get_string("working_on"))
		meta:set_string("working_on", "")
		streets.signworkshop.start(pos)
	end
	meta:set_int("progress", progress)
	streets.signworkshop.update_formspec(pos)
end

function streets.signworkshop.update_formspec(pos)
	local node = minetest.get_node(pos)
	if node.name ~= "streets:sign_workshop" then
		return
	end
	local meta = minetest.get_meta(pos)
	local page = meta:get_int("page")
	local maxpage = meta:get_int("maxpage")
	if page < 1 then
		page = maxpage
	elseif page > maxpage then
		page = 1
	end
	meta:set_int("page", page)
	local fs = "size[9,9;]"
	fs = fs .. "tabheader[0,0;tabs;"
	fs = fs .. minetest.formspec_escape("Dye Storage") .. ","
	fs = fs .. minetest.formspec_escape("Select Section") .. ","
	fs = fs .. minetest.formspec_escape("Craft Signs") .. ";"
	fs = fs .. meta:get_int("tab") .. ";false;true]"
	if meta:get_int("tab") == 1 then
		fs = fs .. "list[context;dye;0,0;8,6]"
		fs = fs .. "listring[context;dye]"
		fs = fs .. "listring[current_player;main]"
	elseif meta:get_int("tab") == 2 then
		local x_pos = 0.5
		local y_pos = 0
		for k, v in pairs(streets.signs.sections) do
			fs = fs .. "button[" .. x_pos .. "," .. y_pos .. ";2.5,1;"
			fs = fs .. minetest.formspec_escape(v.name) .. ";"
			fs = fs .. minetest.formspec_escape(v.friendlyname) .. "]"
			y_pos = y_pos + 0.8
			if y_pos > 4 then
				y_pos = 0
				x_pos = x_pos + 2.5
			end
		end
	elseif meta:get_int("tab") == 3 then
		fs = fs .. "label[0,0;Dyes Needed]"
		fs = fs .. "list[context;dye_needed;0,0.5;2,3]"
		fs = fs .. "list[context;list;2.25,0;4,4;" .. tostring((page - 1) * 16) .. "]" --Each page is a 4x4 grid (16 items)
		fs = fs .. "label[6.5,0.5;Blank Sign]"
		fs = fs .. "label[7.5,0.5;Template]"
		fs = fs .. "list[context;surface;6.5,1;1,1]"
		fs = fs .. "list[context;template;7.5,1;1,1]"
		fs = fs .. "image[7,2;1,1;gui_furnace_arrow_bg.png^[lowpart:" .. meta:get_int("progress") * 10 .. ":gui_furnace_arrow_fg.png^[transformR180]"
		fs = fs .. "list[context;output;7,3;1,1]"
		fs = fs .. "button[2.25,4;1,1;prevpage;<-]"
		fs = fs .. "button[5.25,4;1,1;nextpage;->]"
		fs = fs .. "label[3.75,4;" .. string.format("Page %s of %s", page, maxpage) .. "]"
		if minetest.setting_getbool("creative_mode") then
			fs = fs .. "label[0,3.5;CREATIVE MODE\nTaking templates\nis enabled]"
		end
	end
	fs = fs .. "list[current_player;main;0.5,5;8,4]"
	meta:set_string("formspec", fs)
end

local function update_inventory(pos)
	local node = minetest.get_node(pos)
	if node.name ~= "streets:sign_workshop" then
		return
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local section = meta:get_string("section")
	local itemcount = 0
	for k, v in pairs(streets.signs.signtypes) do
		if v.section == section then
			itemcount = itemcount + 1
		end
	end
	inv:set_size("dye_needed", 0)
	inv:set_size("list", 0)
	inv:set_size("dye_needed", 6)
	inv:set_size("list", math.ceil(itemcount / 16) * 16)
	inv:set_size("dye", 32) -- 8x4
	inv:set_size("surface", 1)
	inv:set_size("template", 1)
	inv:set_size("output", 1)
	for k, v in pairs(streets.signs.signtypes) do
		if v.section == section then
			inv:add_item("list", "streets:" .. v.name)
		end
	end
	meta:set_int("maxpage", math.ceil(itemcount / 16))
	local templatestack = inv:get_stack("template", 1)
	if templatestack and templatestack:to_string() ~= "" then
		local selectedmarking = templatestack:to_table().name
		local dyesneeded = streets.signs.signtypes[selectedmarking].dye_needed
		for k, v in pairs(dyesneeded) do
			inv:add_item("dye_needed", { name = "dye:" .. k, count = v })
		end
	end
	streets.signworkshop.update_formspec(pos)
	if meta:get_string("working_on") == "" then
		streets.signworkshop.start(pos)
	end
end

local function on_receive_fields(pos, formname, fields, sender)
	local meta = minetest.get_meta(pos)
	if fields.tabs then
		meta:set_int("tab", fields.tabs)
		meta:set_int("page", 1)
	elseif fields.prevpage then
		meta:set_int("page", meta:get_int("page") - 1)
	elseif fields.nextpage then
		meta:set_int("page", meta:get_int("page") + 1)
	else
		for k, v in pairs(streets.signs.sections) do
			if fields[v.name] then
				meta:set_string("section", v.name)
				meta:set_int("tab", 3)
			end
		end
	end
	update_inventory(pos)
end

local function on_construct(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("section", streets.signs.sections[1].name)
	meta:set_int("tab", 1)
	meta:set_int("progress", 0)
	meta:set_int("page", 1)
	meta:set_int("maxpage", 1)
	meta:set_string("working_on", "")
	update_inventory(pos)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if listname == "output" or listname == "surface" or listname == "dye" or (listname == "list" and minetest.setting_getbool("creative_mode")) then
		return stack:get_count()
	else
		return 0
	end
end

local function allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	if from_list == "list" and to_list == "template" then
		return 1
	elseif from_list == "template" and to_list == "list" then
		local inv = minetest.get_meta(pos):get_inventory()
		return 1
	elseif from_list == "dye" and to_list == "dye" then
		return count
	else
		return 0
	end
end

local function on_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player)
	update_inventory(pos)
end

local function on_metadata_inventory_put(pos, listname, index, stack, player)
	update_inventory(pos)
end

local function on_metadata_inventory_take(pos, listname, index, stack, player)
	update_inventory(pos)
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	if listname == "dye" and stack:get_name():sub(1, 4) == "dye:" then
		return stack:get_count()
	elseif (listname == "surface" and stack:get_name() == "streets:sign_blank") or (listname == "list" and minetest.setting_getbool("creative_mode")) then
		return stack:get_count()
	else
		return 0
	end
end

local function can_dig(pos, player)
	local inv = minetest.get_meta(pos):get_inventory()
	if inv:is_empty("dye") and inv:is_empty("surface") and inv:is_empty("output") then
		return true
	else
		return false
	end
end

minetest.register_node(":streets:sign_workshop", {
	description = "Sign Workshop",
	tiles = {
		"default_wood.png", "default_wood.png",
		"default_wood.png^default_sign_steel.png", "default_wood.png^default_sign_steel.png",
		"default_wood.png^default_sign_steel.png", "default_wood.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = { cracky = 1 },
	node_box = {
		type = "fixed",
		fixed = {
			{ -0.4375, 0.375, -0.1875, 0.4375, 0.4375, -0.125 }, -- rail
			{ -0.125, 0.3125, -0.25, -0.0625, 0.375, -0.0625 }, -- sprayer
			{ -0.5, -0.5, -0.5, -0.4375, 0.5, 0.5 }, -- sideL
			{ 0.4375, -0.5, -0.5, 0.5, 0.5, 0.5 }, -- sideR
			{ -0.4375, 0.3125, -0.5, -0.375, 0.375, 0.5 }, -- railLB
			{ -0.4375, 0.4375, -0.5, -0.375, 0.5, 0.5 }, -- railLT
			{ -0.4375, 0.375, -0.5, -0.375, 0.4375, -0.4375 }, -- railLF
			{ -0.4375, -0.5, 0.4375, 0.4375, 0.5, 0.5 }, -- sideR
			{ 0.375, 0.3125, -0.5, 0.4375, 0.375, 0.5 }, -- railRB
			{ 0.375, 0.4375, -0.5, 0.4375, 0.5, 0.5 }, -- railRT
			{ 0.375, 0.375, -0.5, 0.4375, 0.4375, -0.4375 }, -- railRF
			{ -0.4375, 0.375, 0.375, -0.375, 0.4375, 0.4375 }, -- railLB
			{ 0.375, 0.3125, 0.375, 0.4375, 0.375, 0.4375 }, -- railRB
			{ -0.5, -0.5, -0.5, -0.375, 0.3125, 0.4375 }, -- sideL2
			{ 0.375, -0.5, -0.5, 0.4375, 0.3125, 0.4375 }, -- sideR2
			{ -0.4375, -0.5, -0.4375, 0.4375, -0.1875, 0.4375 }, -- body
		}
	},
	selection_box = {
		type = "regular"
	},
	on_receive_fields = on_receive_fields,
	on_construct = on_construct,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
	allow_metadata_inventory_move = allow_metadata_inventory_move,
	allow_metadata_inventory_put = allow_metadata_inventory_put,
	on_metadata_inventory_move = on_metadata_inventory_move,
	on_metadata_inventory_put = on_metadata_inventory_put,
	on_metadata_inventory_take = on_metadata_inventory_take,
	can_dig = can_dig,
})

minetest.register_craft({
	output = "streets:sign_workshop",
	recipe = {
		{ "streets:sign_blank", "streets:sign_blank", "streets:sign_blank" },
		{ "streets:sign_blank", "default:mese_crystal_fragment", "streets:sign_blank" },
		{ "streets:sign_blank", "streets:sign_blank", "streets:sign_blank" },
	}
})