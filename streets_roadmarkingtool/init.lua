streets.roadmarkingtool = {}
streets.roadmarkingtool.collections = {}
streets.roadmarkingtool.palette = {}

minetest.after(0, function()
	for key, value in pairs(streets.roads.registered_roadmarking_collections) do
		table.insert(streets.roadmarkingtool.collections, table.copy(value))
	end
end)

for key, value in ipairs(streets.colors.palette) do
	if value.name ~= "brown" then
		table.insert(streets.roadmarkingtool.palette, value)
	end
end

local show_formspec = function(itemstack, player)
	local playername = player:get_player_name()
	local csrf_token = math.random(10000,10000000)
	local meta = itemstack:get_meta()
	local fs = "size[12,9]"
	fs = fs .. default.gui_bg .. default.gui_bg_img .. default.gui_slots
	fs = fs .. "textlist[0,0;0,0;workaround;;1;true]" -- Workaround, see minetest/minetest#7141
	fs = fs .. "textlist[0,0;3,4;collection;"
	local first = true
	for _, collection in ipairs(streets.roadmarkingtool.collections) do
		if first then
			first = false
		else
			fs = fs .. ","
		end
		fs = fs .. minetest.formspec_escape(collection.description or string.gsub(" " .. collection.name:gsub("_", " "), "%W%l", string.upper):sub(2))
	end
	local collection_index = meta:get_int("collection")
	if not collection_index or collection_index == 0 then
		collection_index = 1
	end
	fs = fs .. ";" .. collection_index .. ";false]"
	local x, y, count, roadmarkings = 0, 0, 0, {}
	local collection_name = streets.roadmarkingtool.collections[collection_index].name
	for key, value in pairs(streets.roads.get_roadmarking_definitions_by_collection(collection_name)) do
		table.insert(roadmarkings, collection_name .. ":" .. value.name)
		count = count + 1
	end
	local page = meta:get_int("page")
	local maxpage = math.ceil(count / 18)
	if page < 1 then
		page = maxpage
	elseif page > maxpage then
		page = 1
	end
	meta:set_int("maxpage", maxpage)
	meta:set_int("page", page)
	player:set_wielded_item(itemstack)

	local color_id = meta:get_int("color_id")
	if not color_id or color_id < 1 or color_id > 8 then
		meta:set_int("color_id", 1)
		color_id = 1
	end
	for key, value in ipairs(roadmarkings) do
		if key > (page - 1) * 18 and key <= page * 18 then
			local def = streets.roads.get_roadmarking_definition(value)
			if def then
				fs = fs .. "image_button[" .. x + 4 .. "," .. y + 1.5 .. ";1,1;"
				fs = fs .. minetest.formspec_escape(def.tex .. "^[multiply:" .. streets.roadmarkingtool.palette[color_id].hex)
				fs = fs .. ";" .. minetest.formspec_escape(value) .. ";]"
				x = x + 1
				if x >= 6 then
					x = 0
					y = y + 1
				end
			end
		end
	end
	if maxpage > 1 then
		fs = fs .. "button[10,1.5;1,1;prevpage;<-]"
		fs = fs .. "button[11,1.5;1,1;nextpage;->]"
		fs = fs .. "label[10.5,2.5;" .. string.format("Page %s of %s", page, maxpage) .. "]"
	end
	for key, value in ipairs(streets.roadmarkingtool.palette) do
		fs = fs .. "image_button[" .. key + 3 .. ",0;1," .. ((color_id == key) and 1 or 0.5) .. ";"
		fs = fs .. minetest.formspec_escape("streets_transparent.png^[noalpha^[colorize:" .. value.hex) .. ";"
		fs = fs .. minetest.formspec_escape(value.name) ..";]"
	end
	local selection = meta:get_string("selection")
	if not selection or selection == "" then
		fs = fs .. "label[0,5;" .. 	minetest.formspec_escape(minetest.colorize("#acacac", "No roadmarking selected currently.")) .. "]"
	else
		local roadmarking_def = streets.roads.get_roadmarking_definition(selection)
		if not roadmarking_def then
			fs = fs .. "label[0,5;" .. 	minetest.formspec_escape(minetest.colorize("#acacac", "No roadmarking selected currently.")) .. "]"
		else
			fs = fs .. "label[0.5,5;Current Selection:]"
			fs = fs .. "image[1,5.5;1,1;"
			fs = fs .. minetest.formspec_escape(roadmarking_def.tex .. "^[multiply:" .. streets.roadmarkingtool.palette[color_id].hex)
			fs = fs .. "]"
		end
	end
	fs = fs .. "textarea[0.5,7;3,2;;;"
	fs = fs .. "To place the selected roadmarking, please rightclick on the ground.\n"
	fs = fs .. "Be sure to have an ink cartridge of the right color in your inventory when not in creative."
	fs = fs .. "]"
	fs = fs .. "list[current_player;main;4,5;8,4]"
	player:set_attribute("streets_roadmarkingtool:csrf_token", csrf_token)
	minetest.show_formspec(playername, "streets_roadmarkingtool:" .. csrf_token, fs)
end

local check_and_place = function(pos, node_name, player_name, param2, color_id, ink_needed)
	if minetest.registered_nodes[node_name] then
		if minetest.is_protected(pos, player_name) and not minetest.check_player_privs(player_name, { protection_bypass = true }) then
			minetest.record_protection_violation(pos, player_name)
			return false, "protection"
		else
			if not (creative and creative.is_enabled_for(player_name)) then
				local inventory = minetest.get_inventory({ type = "player", name = player_name })
				local found = false
				for i = 1, inventory:get_size("main") do
					local stack = inventory:get_stack("main", i)
					if stack and stack:get_name() == "streets:ink_cartridge_" .. streets.roadmarkingtool.palette[color_id].name then
						stack:set_wear(stack:get_wear() + 256 * ink_needed)
						inventory:set_stack("main", i, stack)
						found = true
						break
					end
				end
				if not found then
					minetest.chat_send_player(player_name,
						minetest.colorize("#ff7f00", "Make sure to have a "
								.. streets.roadmarkingtool.palette[color_id].description
								.. " Ink Cartridge in your inventory!"
						)
					)
					return false, "ink"
				end
			end
			minetest.set_node(pos, { name = node_name, param2 = param2 })
			return true, "success"
		end
	else
		return false, "unkown"
	end
end

local get_rotation = function(param2, player_yaw)
	local rotation_table = {
		nn = "r0", ew = "r0", ss = "r0", we = "r0",
		nw = "r90", es = "r90", se = "r90", wn = "r90",
		ns = "r180", ee = "r180", sn = "r180", ww = "r180",
		ne = "r270", en = "r270", sw = "r270", ws = "r270",
	}
	local dir_table = {"n", "w", "s", "e" }
	local player_direction = dir_table[math.floor(((player_yaw * 180 / math.pi) + 45) % 360 / 90) + 1]
	local node_direction = dir_table[math.floor(((-minetest.dir_to_yaw(minetest.facedir_to_dir(param2)) * 180 / math.pi) + 45) % 360 / 90) + 1]
	return rotation_table[node_direction .. player_direction]
end

local place_roadmarking = function(pointed_thing, player, meta, color_id)
	if pointed_thing.type ~= "node" then
		return
	end
	local player_name = player:get_player_name()
	local selection = meta:get_string("selection")
	if not selection or selection == "" then
		return
	end
	local roadmarking_def = streets.roads.get_roadmarking_definition(selection)
	if not roadmarking_def then
		return
	end
	local upper_pos = table.copy(pointed_thing.under)
	upper_pos.y = upper_pos.y + 1
	local pos = pointed_thing.under
	local node = minetest.get_node(pos)
	local surface_info = streets.helpers.get_node_info(node.name)
	local colorparam2 = (color_id - 1) * 32
	if not player.get_look_horizontal then -- to prevent a crash with pipeworks:deployer
		return
	end
	local player_yaw = player:get_look_horizontal()
	local dirparam2 = minetest.dir_to_facedir(minetest.yaw_to_dir(player_yaw))
	local ink_needed = roadmarking_def.ink_needed
	if surface_info.category == "surface" then
		if surface_info.stairlike then
			if surface_info.staircategory == "slab" and surface_info.stairalternate ~= "_two_sides"
					and surface_info.stairalternate ~= "_three_sides" and surface_info.stairalternate ~= "_three_sides_u" then
				local success, reason = check_and_place(pos, streets.roads.build_node_name({
					belongs_to = roadmarking_def.belongs_to,
					roadmarking_name = roadmarking_def.name,
					surface_name = surface_info.surface_name,
					omit_colon = true,
					staircategory = "slab",
					stairalternate = surface_info.stairalternate,
				}), player_name, colorparam2 + dirparam2, color_id, ink_needed)
				if success or reason == "ink" then
					return
				end
			else
				local rotation = get_rotation(node.param2, player_yaw)
				local new_name = streets.roads.build_node_name({
					belongs_to = roadmarking_def.belongs_to,
					roadmarking_name = roadmarking_def.name,
					surface_name = surface_info.surface_name,
					omit_colon = true,
					staircategory = surface_info.staircategory,
					stairalternate = surface_info.stairalternate,
					rotation = rotation
				})
				if rotation ~= "r0" and not minetest.registered_nodes[new_name] then
					rotation = "r" .. ((rotation:sub(2) + 180) % 360)
					new_name = streets.roads.build_node_name({
						belongs_to = roadmarking_def.belongs_to,
						roadmarking_name = roadmarking_def.name,
						surface_name = surface_info.surface_name,
						omit_colon = true,
						staircategory = surface_info.staircategory,
						stairalternate = surface_info.stairalternate,
						rotation = rotation
					})
					if rotation ~= "r0" and not minetest.registered_nodes[new_name] then
						rotation = "r0"
						new_name = streets.roads.build_node_name({
							belongs_to = roadmarking_def.belongs_to,
							roadmarking_name = roadmarking_def.name,
							surface_name = surface_info.surface_name,
							omit_colon = true,
							staircategory = surface_info.staircategory,
							stairalternate = surface_info.stairalternate,
							rotation = rotation
						})
					end
				end
				local success, reason = check_and_place(pos, new_name, player_name, colorparam2 + node.param2, color_id, ink_needed)
				if success or reason == "ink" then
					return
				end
			end
		else
			local success, reason = check_and_place(pos, streets.roads.build_node_name({
				belongs_to = roadmarking_def.belongs_to,
				roadmarking_name = roadmarking_def.name,
				surface_name = surface_info.surface_name,
				omit_colon = true,
			}), player_name, colorparam2 + dirparam2, color_id, ink_needed)
			if success or reason == "ink" then
				return
			end
		end
	end
	local upper_node_def = minetest.registered_nodes[minetest.get_node(upper_pos).name]
	if not (upper_node_def and upper_node_def.buildable_to) then
		return
	end
	local forbidden_drawtypes = {
		airlike = 1, liquid = 1, flowingliquid = 1, torchlike = 1, signlike = 1,
		plantlike = 1, firelike = 1, fencelike = 1, raillike = 1, nodebox = 1, mesh = 1,
	}
	local node_def = minetest.registered_nodes[node.name]
	if node_def and forbidden_drawtypes[node_def.drawtype] then
		return
	end
	check_and_place(upper_pos, streets.roads.build_node_name({
		belongs_to = roadmarking_def.belongs_to,
		roadmarking_name = roadmarking_def.name,
		omit_colon = true,
	}), player_name, colorparam2 + dirparam2, color_id, ink_needed)
end

minetest.register_craftitem(":streets:roadmarkingtool", {
	description = "Roadmarking Tool",
	inventory_image = "streets_asphalt.png^default_stick.png", -- TODO Find a good inventory_image.
	on_place = function(itemstack, player, pointed_thing)
		if not player then
			return
		end
		local meta = itemstack:get_meta()
		local color_id = meta:get_int("color_id")
		local collection = meta:get_int("collection")
		if not color_id or color_id < 1 or color_id > 8 then
			meta:set_int("color_id", 1)
			color_id = 1
		end
		if not collection or collection < 1 or collection > #streets.roadmarkingtool.collections then
			meta:set_int("collection", 1)
		end
		player:set_wielded_item(itemstack)
		if player:get_player_control().sneak then
			show_formspec(itemstack, player)
		else
			place_roadmarking(pointed_thing, player, meta, color_id)
		end
	end,
	on_use = function(itemstack, player, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		local player_name = player:get_player_name()
		local pos = pointed_thing.under
		if minetest.is_protected(pos, player_name) and not minetest.check_player_privs(player_name, { protection_bypass = true }) then
			minetest.record_protection_violation(pos, player_name)
			return
		end
		local node = minetest.get_node(pos)
		local name = node.name
		local info = streets.helpers.get_node_info(name)
		if info.category == "roadmarking_on_surface" then
			minetest.set_node(pos, {
				name = streets.roads.build_node_name({
					surface_name = info.surface_name,
					omit_colon = true,
					staircategory = info.staircategory,
					stairalternate = info.stairalternate,
				}),
				param1 = node.param1,
				param2 = node.param2 - minetest.strip_param2_color(node.param2, "colorfacedir")
			})
		elseif info.category == "roadmarking" then
			minetest.remove_node(pos)
		end
	end,
	on_secondary_use = function(itemstack, player, pointed_thing)
		local meta = itemstack:get_meta()
		local color_id = meta:get_int("color_id")
		local collection = meta:get_int("collection")
		if not color_id or color_id < 1 or color_id > 8 then
			meta:set_int("color_id", 1)
		end
		if not collection or collection < 1 or collection > #streets.roadmarkingtool.collections then
			meta:set_int("collection", 1)
		end
		player:set_wielded_item(itemstack)
		if not player then
			return
		end
		show_formspec(itemstack, player)
	end,
	stack_max = 1,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if not fields then return end
	if fields.quit then
		player:set_attribute("streets_roadmarkingtool:csrf_token", "")
		return
	end
	local csrf_token = player:get_attribute("streets_roadmarkingtool:csrf_token")
	if not csrf_token then
		return
	elseif formname ~= "streets_roadmarkingtool:" .. csrf_token then
		return
	end
	local wielded_item = player:get_wielded_item()
	if not wielded_item or wielded_item:get_name() ~= "streets:roadmarkingtool" then
		return
	end
	local meta = wielded_item:get_meta()
	if fields.collection then
		local collection_data = minetest.explode_textlist_event(fields.collection)
		if collection_data.index and streets.roadmarkingtool.collections[collection_data.index] then
			meta:set_int("collection", collection_data.index)
		end
	elseif fields.prevpage then
		meta:set_int("page", meta:get_int("page") - 1)
	elseif fields.nextpage then
		meta:set_int("page", meta:get_int("page") + 1)
	else
		local found = false
		for key, value in ipairs(streets.roadmarkingtool.palette) do
			if fields[value.name] then
				found = true
				meta:set_int("color_id", key)
				break
			end
		end
		if not found then
			local collection = meta:get_int("collection")
			if not collection or collection < 1 or collection > #streets.roadmarkingtool.collections then
				meta:set_int("collection", 1)
			end
			player:set_wielded_item(wielded_item)
			if not player then
				return
			end
			local collection_name = streets.roadmarkingtool.collections[meta:get_int("collection")].name
			for key, value in pairs(streets.roads.get_roadmarking_definitions_by_collection(collection_name)) do
				if fields[collection_name .. ":" .. value.name] then
					meta:set_string("selection", collection_name .. ":" .. value.name)
				end
			end
		end
	end
	player:set_wielded_item(wielded_item)
	show_formspec(wielded_item, player)
end)
