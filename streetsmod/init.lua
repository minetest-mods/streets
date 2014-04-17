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
	
-- rubenwardy: smartfs
	dofile(minetest.get_modpath("streetsmod").."/libs/smartfs/smartfs.lua")

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
	streets.forms = {}
	
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
	if minetest.get_modpath("awards") then
		streets.extendedBy.awards = true
	else
		streets.extendedBy.awards = false
	end
	
-- Streets chatcommand
	local function round(num, idp)
		local mult = 10^(idp or 0)
		return math.floor(num * mult + 0.5) / mult
	end
	streets.forms.chatcmd = smartfs.create("streets:chatcmd", function(state)
		state:size(10,6)
		local tlist = state:element("list", { pos={x=0,y=1}, size={w=6,h=5}, name = "streets:chatcmd_modlist" } )
		tlist:removeItem()
		for k, v in pairs(streets.extendedBy) do
			tlist:addItem(tostring(k) .. " " .. S("installed") .. ": " .. tostring(v))
		end
		state:label(6.5, 1, "streets:chatcmd_version", S("Running version") .. ": " .. streets.version)
		state:label(6.5, 1.5, "streets:chatcmd_loadtime", S("Load time") .. ": " .. round(streets.load.fin - streets.load.start,4) .. "s")
	end)
	minetest.register_chatcommand("streets",{
		description = S("Check version of your installed StreetsMod and find information"),
		func = function(name,param)
			streets.forms.chatcmd:show(name);
		end
	})
	
-- Done	
	print("Streets: " .. S("Setup completed, have fun with StreetsMod") .. " " .. streets.version .. "!")
	streets.load.fin = os.clock()
