--[[
  ## StreetsMod 2.0 ##
  Submod: roadworks
  Optional: true
]]

local function workshop_form(pos)
  local meta = minetest.get_meta(pos)
  return table.concat({
    "size[9,9;]",
    "tabheader[0,0;asphalt_workshop_tabs;Center lines,Side lines,Arrows,Other;" .. (meta:get_int("tab") or 1) .. ";false;true]",
    "image_button[0,0;1,1;dye_white.png;color_white;]",
    "image_button[1,0;1,1;dye_yellow.png;color_yellow;]",
    "image[0,2;1,2.125;wool_white.png]",
    "image[1,2;1,2.125;wool_yellow.png]",
    "list[context;asphalt_workshop_list;2,0;4,4]",
    "list[context;asphalt_workshop_surface;6,1;1,1]",
    "list[context;asphalt_workshop_template;8,1;1,1]",
    "image[7,2;1,1;gui_furnace_arrow_bg.png^[lowpart:" .. (meta:get_int("progress") or 1) .. ":gui_furnace_arrow_fg.png^[transformR180]",
    "list[context;asphalt_workshop_output;7,3;1,1]",
    "list[current_player;main;0.5,5;8,4]",
  })
end

local function workshop_list(color, tab)
  local markings = {
    -- Center lines
    {
      "streets:rw_line_dashed_",
      "streets:rw_line_solid_",
      "streets:rw_line_solid_double_",
      "streets:rw_line_dashed_double_",
      "streets:rw_line_mixed_double_",
    },
    -- Side lines
    {
      "streets:rw_side_slim_",
      "streets:rw_side_thick_",
      "streets:rw_side_dashed_slim_",
      "streets:rw_side_dashed_thick_",
      "streets:rw_edge_slim_",
      "streets:rw_edge_thick_",
    },
    -- Arrows
    {
      "streets:rw_arrow_straightleftright_",
      "streets:rw_arrow_straightleft_",
      "streets:rw_arrow_straightright_",
      "streets:rw_arrow_leftright_",
      "streets:rw_arrow_straight_",
      "streets:rw_arrow_left_",
      "streets:rw_arrow_right_",
    },
    -- Other
    {
      "streets:rw_parking_",
      "streets:rw_cross_",
      "streets:rw_crosswalk_",
      "streets:rw_zigzag_",
      "streets:rw_forbidden_",
    }
  }
  for k, v in ipairs(markings[tab]) do
    markings[tab][k] = v .. color
  end
  return markings[tab]
end

minetest.register_node(":streets:asphalt_workshop", {
	tiles = {"default_wood.png",},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
  groups = {cracky = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, 0.375, -0.1875, 0.4375, 0.4375, -0.125}, -- rail
			{-0.125, 0.3125, -0.25, -0.0625, 0.375, -0.0625}, -- sprayer
			{-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5}, -- sideL
			{0.4375, -0.5, -0.5, 0.5, 0.5, 0.5}, -- sideR
			{-0.4375, 0.3125, -0.5, -0.375, 0.375, 0.5}, -- railLB
			{-0.4375, 0.4375, -0.5, -0.375, 0.5, 0.5}, -- railLT
			{-0.4375, 0.375, -0.5, -0.375, 0.4375, -0.4375}, -- railLF
			{-0.4375, -0.5, 0.4375, 0.4375, 0.5, 0.5}, -- sideR
			{0.375, 0.3125, -0.5, 0.4375, 0.375, 0.5}, -- railRB
			{0.375, 0.4375, -0.5, 0.4375, 0.5, 0.5}, -- railRT
			{0.375, 0.375, -0.5, 0.4375, 0.4375, -0.4375}, -- railRF
			{-0.4375, 0.375, 0.375, -0.375, 0.4375, 0.4375}, -- railLB
			{0.375, 0.3125, 0.375, 0.4375, 0.375, 0.4375}, -- railRB
			{-0.5, -0.5, -0.5, -0.375, 0.3125, 0.4375}, -- sideL2
			{0.375, -0.5, -0.5, 0.4375, 0.3125, 0.4375}, -- sideR2
			{-0.4375, -0.5, -0.4375, 0.4375, -0.1875, 0.4375}, -- body
		}
	},
	selection_box = {
		type = "regular"
	},
  on_receive_fields = function(pos, formname, fields, sender)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory(pos)
    -- Switch tabs
    if fields.asphalt_workshop_tabs then
      meta:set_int("tab", tonumber(fields.asphalt_workshop_tabs))
      inv:set_list("asphalt_workshop_list", workshop_list(meta:get_string("color"), tonumber(fields.asphalt_workshop_tabs)))
    end
    -- Switch color to white
    if fields.color_white then
      meta:set_string("color", "white")
      inv:set_list("asphalt_workshop_list", workshop_list("white", meta:get_int("tab")))
    end
    -- Switch color to yellow
    if fields.color_yellow then
      meta:set_string("color", "yellow")
      inv:set_list("asphalt_workshop_list", workshop_list("yellow", meta:get_int("tab")))
    end
    -- Prepare form for the next time
    meta:set_string("formspec", workshop_form(pos))
    inv:set_list("asphalt_workshop_list", workshop_list(meta:get_string("color"), meta:get_int("tab")))
  end,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory(pos)
    -- Set up initial meta data (white markings, no production progress, tab 1 active)
    meta:set_string("color", "white")
    meta:set_int("progress", 0)
    meta:set_int("tab", 1)
    -- Generate formspec and set up inventories
    meta:set_string("formspec", workshop_form(pos))
    inv:set_size("asphalt_workshop_list", 16)
    inv:set_list("asphalt_workshop_list", workshop_list("white", 1))
    inv:set_size("asphalt_workshop_template", 1)
    inv:set_size("asphalt_workshop_surface", 1)
    inv:set_size("asphalt_workshop_output", 1)
	end,
  allow_metadata_inventory_put = function(pos, listname, index, stack, player)
    -- Put item into input slot
		if listname ~= "asphalt_workshop_surface" then
			return 0
		else
			return 1
		end
	end,
  allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
    -- list -> template slot
    if from_list == "asphalt_workshop_list" and to_list == "asphalt_workshop_template" then
      return 1
    end
    -- template slot -> list
    if from_list == "asphalt_workshop_template" and to_list == "asphalt_workshop_list" then
      return 1
    end
    -- Every other case
    return 0
  end,
  allow_metadata_inventory_take = function(pos, listname, index, stack, player)
    if listname == "asphalt_workshop_output" or listname == "asphalt_workshop_surface" then
      return 99
    end
    -- Every other case
    return 0
  end
})
