--[[
  ## StreetsMod 2.0 ##
  Submod: roadworks
  Optional: true
]]

local function workshop_form(tab, color, progress)
  return table.concat({
    "size[9,9;]",
    "tabheader[0,0;asphalt_workshop_tabs;Center lines,Side lines,Arrows,Other;" .. tab .. ";false;true]",
    "image_button[0,0;1,1;dye_white.png;color_white;]",
    "image_button[1,0;1,1;dye_yellow.png;color_yellow;]",
    "image[0,2;1,2.125;wool_white.png]",
    "image[1,2;1,2.125;wool_yellow.png]",
    "list[context;asphalt_workshop_list;2,0;4,4]",
    "list[context;asphalt_workshop_surface;6,1;1,1]",
    "list[context;asphalt_workshop_template;8,1;1,1]",
    "image[7,2;1,1;gui_furnace_arrow_bg.png^[lowpart:" .. progress .. ":gui_furnace_arrow_fg.png^[transformR180]",
    "list[context;asphalt_workshop_output;7,3;1,1]",
    "list[current_player;main;0.5,5;8,4]",
  })
end

local function workshop_list(color, tab)
  local markings = {
    {
      "streets:rw_line_dashed_white"
    }
  }
  if color == "yellow" then
    for k, v in ipairs(r) do
      r[k] = v .. "_yellow"
    end
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
    if fields.asphalt_workshop_tabs then
      if fields.asphalt_workshop_tabs == "1" then
        local meta = minetest.get_meta(pos)
        local inv = meta:get_inventory(pos)
        minetest.chat_send_all(minetest.write_json(workshop_list(meta:get_string("color"), meta:get_int("tab") or 1)))
        inv:set_list("asphalt_workshop_list", workshop_list(meta:get_string("color"), meta:get_int("tab") or 1))
      end
    end
  end,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
    local meta = minetest.get_meta(pos)
    local inv = meta:get_inventory(pos)
    meta:set_string("formspec", workshop_form(1, "white", 0))
    meta:set_string("color", "white")
    meta:set_int("progress", 0)
    meta:set_int("tab", 1)
    inv:set_size("asphalt_workshop_list", 16)
    inv:set_size("asphalt_workshop_template", 1)
    inv:set_size("asphalt_workshop_surface", 1)
    inv:set_size("asphalt_workshop_output", 1)
	end
})
