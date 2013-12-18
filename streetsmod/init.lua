--[[
	StreetsMod 1.1 by webdesigner97:
		License : CC-BY-SA 3.0 Unported (see license.txt)
		Readme	: see readme.txt
		Forum	: http://bit.ly/12cPMeo
		Depends	: default
]]
-- Create variables and tables
	print("Streets: Creating variables and tables...")
	streets	= {}
	streets.version	= "1.4.3"
	streets.modpath = minetest.get_modpath("streets")
	streets.extendedBy	= {}
	streets.load = {
		start = os.clock(),
		fin = 0
	}
	
-- Check for mods which change this mod's beahaviour
	print("Streets: Checking installed mods...")
	if minetest.get_modpath("wool")	 then
		print("'Wool' is installed \n\t => You can craft labels for your asphalt blocks")
		streets.extendedBy.wool = true
	else
		print("'Wool' not installed \n\t => You can't craft any labels")
		streets.extendedBy.wool = false
	end
	if minetest.get_modpath("technic")	then
		print("'Technic' is installed \n\t => You can use its concrete also in this mod")
		streets.extendedBy.technic = true
	else
		print("'Technic' not installed \n\t => StreetsMod will register its own concrete block")
		streets.extendedBy.technic = false
	end
	if minetest.get_modpath("moreblocks") then
		print("'Moreblocks' is installed \n\t => There will be stairs and slabs'")
		streets.extendedBy.moreblocks = true
	else
		print("'Moreblocks' not installed \n\t => There won't be stairs and slabs'")
		streets.extendedBy.moreblocks = false
	end
	if minetest.get_modpath("mesecons") then
		print("'Mesecons' is installed \n\t => Trafficlights might be available. Checking for digilines. Streetlamps available")
		streets.extendedBy.mesecons = true
	else
		print("'Mesecons' not installed \n\t => No trafficlight and streetlamps, sorry.")
		streets.extendedBy.mesecons = false
	end
	if minetest.get_modpath("digilines") then
		print("'Digilines' is installed \n\t => Trafficlights might be available")
		streets.extendedBy.digilines = true
	else
		print("'Digilines' not installed \n\t => No trafficlight, sorry.")
		streets.extendedBy.digilines = false
	end
	if minetest.get_modpath("prefab") then
		print("'Prefab concrete' is installed \n\t => Use its concrete block for streets' crafting recipes.")
		streets.extendedBy.prefab = true
	else
		print("'Prefab concrete' not installed \n\t => Streets will register its own concrete block.")
		streets.extendedBy.prefab = false
	end
	
-- Streets chatcommand
	local function round(num, idp)
		local mult = 10^(idp or 0)
		return math.floor(num * mult + 0.5) / mult
	end
	minetest.register_chatcommand("streets",{
		description = "Check version of you installed StreetsMod and find information",
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
	print("Streets: Setup completed, have fun with StreetsMod ".. streets.version .."!")
	print("Streets: Special thanks to everyone who contributed to this mod (except myself): Immanuel_Kant and philipbenr!")
	streets.load.fin = os.clock()