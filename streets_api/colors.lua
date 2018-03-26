streets.colors = {}

streets.colors.palette = {
	{ name = "white",  description = "White",  hex = "#ffffff" },
	{ name = "yellow", description = "Yellow", hex = "#f5cc2d" },
	{ name = "orange", description = "Orange", hex = "#ff7f00" },
	{ name = "red",    description = "Red",    hex = "#ff0000" },
	{ name = "green",  description = "Green",  hex = "#1c8825" },
	{ name = "blue",   description = "Blue",   hex = "#1e40c8" },
	{ name = "brown",  description = "Brown",  hex = "#854c30" },
	{ name = "grey",   description = "Grey",   hex = "#acacac" },
	{ name = "black",  description = "Black",  hex = "#404040" },
}

for k, v in pairs(streets.colors.palette) do
	minetest.register_tool(":streets:ink_cartridge_" .. v.name, {
		inventory_image = "streets_ink_cartridge.png^(streets_ink_cartridge_overlay.png^[colorize:" .. v.hex .. ")",
		description = v.description .. " Ink Cartridge",
	})
end
