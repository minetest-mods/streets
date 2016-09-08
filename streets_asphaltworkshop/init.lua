--[[
	## StreetsMod 2.0 ##
	Submod: asphaltworkshop
	Optional: true
]]

streets.workshop = {}

function streets.workshop.start(pos)
	local node = minetest.get_node(pos)
	if node.name ~= "streets:asphalt_workshop" then
		return
	end

	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	local template = inv:get_stack("template", 1):get_name()
	local steel = inv:get_stack("steel", 1):get_name()
	local yellow_needed = inv:get_stack("yellow_needed", 1):get_count()
	local white_needed = inv:get_stack("white_needed", 1):get_count()
	local yellow_ok = inv:get_stack("yellow_dye", 1):get_count() >= yellow_needed
	local white_ok = inv:get_stack("white_dye", 1):get_count() >= white_needed

	if not (yellow_ok and white_ok and steel and steel == "default:steel_ingot" and template and template ~= "") then
		return
	end

	if not inv:room_for_item("output", { name = template, count = 1 }) then
		return
	end

	meta:set_string("working_on", template)
	meta:set_int("progress", 0)
	inv:remove_item("yellow_dye", { name = "dye:yellow", count = yellow_needed })
	inv:remove_item("white_dye", { name = "dye:white", count = white_needed })
	inv:remove_item("steel", { name = "default:steel_ingot", count = 1 })
	streets.workshop.step(pos)
end

function streets.workshop.step(pos)
	local node = minetest.get_node(pos)
	if node.name ~= "streets:asphalt_workshop" then
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
		minetest.after(0.2, streets.workshop.step, pos)
	else
		meta:set_int("progress", 0)
		progress = 0
		inv:add_item("output", meta:get_string("working_on"))
		meta:set_string("working_on", "")
		streets.workshop.start(pos)
	end
	meta:set_int("progress", progress)
	streets.workshop.update_formspec(pos)
end

function streets.workshop.update_formspec(pos)
	local node = minetest.get_node(pos)
	if node.name ~= "streets:asphalt_workshop" then
		return
	end
	local meta = minetest.get_meta(pos)
	local fs = "size[9,9;]"
	fs = fs .. "tabheader[0,0;tabs;"
	for k, v in pairs(streets.labels.sections) do
		fs = fs .. minetest.formspec_escape(v.friendlyname) .. ","
	end
	fs = fs:sub(1, -2) --Strip trailing comma
	fs = fs .. ";" .. meta:get_int("section") .. ";false;true]"
	fs = fs .. "label[0,-0.25;Select Color]"
	fs = fs .. "image_button[0,0.25;1,1;dye_white.png;color_white;]"
	fs = fs .. "image_button[1,0.25;1,1;dye_yellow.png;color_yellow;]"
	fs = fs .. "label[0,1.25;Dye Input]"
	fs = fs .. "list[context;white_dye;0,1.75;1,1]"
	fs = fs .. "list[context;yellow_dye;1,1.75;1,1]"
	fs = fs .. "label[0,2.75;Dye Required]"
	fs = fs .. "list[context;white_needed;0,3.25;1,1]"
	fs = fs .. "list[context;yellow_needed;1,3.25;1,1]"
	fs = fs .. "label[2,-0.25;Rotation]"
	fs = fs .. "button[2,0.25;1,1;r0;R0]"
	fs = fs .. "button[2,1.25;1,1;r90;R90]"
	fs = fs .. "button[2,2.25;1,1;r180;R180]"
	fs = fs .. "button[2,3.25;1,1;r270;R270]"
	fs = fs .. "list[context;list;3,0;4,4]"
	fs = fs .. "label[7,0.5;Steel ingot]"
	fs = fs .. "label[8,0.5;Template]"
	fs = fs .. "list[context;steel;7,1;1,1]"
	fs = fs .. "list[context;template;8,1;1,1]"
	fs = fs .. "image[7.5,2;1,1;gui_furnace_arrow_bg.png^[lowpart:" .. meta:get_int("progress") * 10 .. ":gui_furnace_arrow_fg.png^[transformR180]"
	fs = fs .. "list[context;output;7.5,3;1,1]"
	fs = fs .. "list[current_player;main;0.5,5;8,4]"
	if minetest.setting_getbool("creative_mode") then
		fs = fs .. "label[2,4;CREATIVE MODE: Taking templates is enabled]"
	end
	meta:set_string("formspec", fs)
end

local function update_inventory(pos)
	local node = minetest.get_node(pos)
	if node.name ~= "streets:asphalt_workshop" then
		return
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	inv:set_size("white_dye", 1)
	inv:set_size("yellow_dye", 1)
	inv:set_size("white_needed", 0)
	inv:set_size("yellow_needed", 0)
	inv:set_size("list", 0)
	inv:set_size("white_needed", 1)
	inv:set_size("yellow_needed", 1)
	inv:set_size("list", 16) -- 4x4
	inv:set_size("steel", 1)
	inv:set_size("template", 1)
	inv:set_size("output", 1)

	local color = meta:get_string("color")
	local section = meta:get_int("section")
	local rotation = meta:get_string("rotation")
	local sectionname = streets.labels.sections[section].name
	for k, v in pairs(streets.labels.labeltypes) do
		if v.section == sectionname then
			if v.rotation then
				if v.rotation.r90 and rotation == "r90" then
					inv:add_item("list", "streets:tool_" .. v.name:gsub("{color}", color:lower()) .. "_r90")
				elseif v.rotation.r180 and rotation == "r180" then
					inv:add_item("list", "streets:tool_" .. v.name:gsub("{color}", color:lower()) .. "_r180")
				elseif v.rotation.r270 and rotation == "r270" then
					inv:add_item("list", "streets:tool_" .. v.name:gsub("{color}", color:lower()) .. "_r270")
				end
			end
			if rotation == "r0" then
				inv:add_item("list", "streets:tool_" .. v.name:gsub("{color}", color:lower()))
			end
		end
	end
	local templatestack = inv:get_stack("template", 1)
	local markingcolor = ""
	if templatestack and templatestack:to_string() ~= "" then
		local selectedmarking = templatestack:to_table().name:sub(14)
		if selectedmarking:find("white") then
			markingcolor = "white"
		elseif selectedmarking:find("yellow") then
			markingcolor = "yellow"
		end
		selectedmarking = selectedmarking:gsub("white", "{color}")
		selectedmarking = selectedmarking:gsub("yellow", "{color}")
		selectedmarking = selectedmarking:gsub("_r90", "")
		selectedmarking = selectedmarking:gsub("_r180", "")
		selectedmarking = selectedmarking:gsub("_r270", "")
		local dyesneeded = streets.labels.labeltypes[selectedmarking].dye_needed
		if markingcolor == "white" then
			inv:add_item("white_needed", { name = "dye:white", count = dyesneeded })
		end
		if markingcolor == "yellow" then
			inv:add_item("yellow_needed", { name = "dye:yellow", count = dyesneeded })
		end
	end
	streets.workshop.update_formspec(pos)
	streets.workshop.start(pos)
end

local function on_receive_fields(pos, formname, fields, sender)
	local meta = minetest.get_meta(pos)
	if fields.tabs then
		meta:set_int("section", fields.tabs)
	elseif fields.color_white then
		meta:set_string("color", "white")
	elseif fields.color_yellow then
		meta:set_string("color", "yellow")
	elseif fields.r0 then
		meta:set_string("rotation", "r0")
	elseif fields.r90 then
		meta:set_string("rotation", "r90")
	elseif fields.r180 then
		meta:set_string("rotation", "r180")
	elseif fields.r270 then
		meta:set_string("rotation", "r270")
	end
	update_inventory(pos)
end

local function on_construct(pos)
	local meta = minetest.get_meta(pos)
	meta:set_int("section", 1)
	meta:set_string("color", "white")
	meta:set_string("rotation", "r0")
	meta:set_int("progress", 0)
	meta:set_string("working_on", "")
	update_inventory(pos)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	if listname == "output" or listname == "steel" or listname == "white_dye" or listname == "yellow_dye" or (listname == "list" and minetest.setting_getbool("creative_mode")) then
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
	if listname == "yellow_dye" or listname == "white_dye" or (listname == "list" and minetest.setting_getbool("creative_mode")) then
		return stack:get_count()
	elseif listname == "steel" and (stack:get_name() == "default:steel_ingot") then
		return stack:get_count()
	else
		return 0
	end
end

local function can_dig(pos, player)
	local inv = minetest.get_meta(pos):get_inventory()
	if inv:is_empty("yellow_dye") and inv:is_empty("white_dye") and inv:is_empty("steel") and inv:is_empty("output") then
		return true
	else
		return false
	end
end

minetest.register_node(":streets:asphalt_workshop", {
	description = "Asphalt Workshop",
	tiles = {
		"default_steel_block.png^(streets_asphalt.png^[opacity:200)",
		"default_steel_block.png^(streets_asphalt.png^[opacity:200)",
		"default_steel_block.png^(streets_asphalt.png^[opacity:200)",
		"default_steel_block.png^(streets_asphalt.png^[opacity:200)",
		"default_steel_block.png^(streets_asphalt.png^[opacity:200)",
		"default_steel_block.png^(streets_asphalt.png^[opacity:200)",
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

minetest.register_lbm({
	name = "streets:update_asphalt_workshop",
	nodenames = { "streets:asphalt_workshop" },
	action = function(pos, node)
		update_inventory(pos)
	end,
})

minetest.register_craft({
	output = "streets:asphalt_workshop",
	recipe = {
		{ "streets:asphalt", "streets:asphalt", "streets:asphalt" },
		{ "streets:asphalt", "default:mese_crystal_fragment", "streets:asphalt" },
		{ "streets:asphalt", "streets:asphalt", "streets:asphalt" },
	}
})