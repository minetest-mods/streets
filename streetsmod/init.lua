--[[
	StreetsMod 1.1 by webdesigner97:
		License : CC-BY-SA 3.0 Unported (see license.txt)
		Readme	: see readme.txt
		Forum	: http://bit.ly/12cPMeo
		Depends	: default
]]
-- kaeza: intllib
	-- Boilerplate to support localized strings if intllib mod is installed.
	-- local S
	if (minetest.get_modpath("intllib")) then
	  dofile(minetest.get_modpath("intllib").."/intllib.lua")
	  S = intllib.Getter(minetest.get_current_modname())
	else
	  S = function ( s ) return s end
	end
-- Create variables and tables
	print("Streets: " .. S("Creating variables and tables..."))
	streets	= {}
	streets.version	= "1.4.4dev"
	streets.modpath = minetest.get_modpath("streets")
	streets.extendedBy	= {}
	streets.load = {
		start = os.clock(),
		fin = 0
	}
	
-- Check for mods which change this mod's beahaviour
	print("Streets: " .. S("Checking installed mods..."))
	if minetest.get_modpath("wool")	 then
		streets.extendedBy.wool = true
	else
		streets.extendedBy.wool = false
	end
	if minetest.get_modpath("technic")	then
		streets.extendedBy.technic = true
	else
		streets.extendedBy.technic = false
	end
	if minetest.get_modpath("moreblocks") then
		streets.extendedBy.moreblocks = true
	else
		streets.extendedBy.moreblocks = false
	end
	if minetest.get_modpath("mesecons") then
		streets.extendedBy.mesecons = true
	else
		streets.extendedBy.mesecons = false
	end
	if minetest.get_modpath("digilines") then
		streets.extendedBy.digilines = true
	else
		streets.extendedBy.digilines = false
	end
	if minetest.get_modpath("prefab") then
		streets.extendedBy.prefab = true
	else
		streets.extendedBy.prefab = false
	end
	
-- Streets chatcommand
	local function round(num, idp)
		local mult = 10^(idp or 0)
		return math.floor(num * mult + 0.5) / mult
	end
	minetest.register_chatcommand("streets",{
		description = S("Check version of your installed StreetsMod and find information"),
		func = function(name,param)
			minetest.show_formspec(name, "streets:streetsform", table.concat({
				"size[10,6]",
				"label[0,1;Wool installed: " .. tostring(streets.extendedBy.wool) .. "]",
				"label[0,1.5;Technic installed: " .. tostring(streets.extendedBy.technic) .. "]",
				"label[0,2;Moreblocks installed: " .. tostring(streets.extendedBy.moreblocks) .. "]",
				"label[0,2.5;Mesecons installed: " .. tostring(streets.extendedBy.mesecons) .. "]",
				"label[0,3;Digilines installed: " .. tostring(streets.extendedBy.digilines) .. "]",
				"label[0,3.5;Prefab installed: " .. tostring(streets.extendedBy.prefab) .. "]",
				"label[0,4.5;Running version: " .. streets.version .. "]",
				"label[0,5;Load time: " .. round(streets.load.fin - streets.load.start,4) .. "s]"
			}))
		end
	})
	
-- Done	
	print("Streets: " .. S("Setup completed, have fun with StreetsMod") .. " " .. streets.version .. "!")
	streets.load.fin = os.clock()
