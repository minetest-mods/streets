--[[
	StreetsMod 1.1 by webdesigner97:
		License : CC-BY-NC (see license.txt)
		Readme	: see readme.txt
		Forum	: http://bit.ly/12cPMeo
		Depends	: default
]]
-- Create variables and tables
	print("Streets: Creating variables and tables...")
	streets	= {}
	streets.version	= "1.3 indev"
	streets.modpath = minetest.get_modpath("streets")
	streets.extendedBy	= {}
	
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
	if minetest.get_modpath("bucket") then
		print("'Bucket' is installed \n\t => All signs are available")
		streets.extendedBy.bucket = true
	else
		print("'Bucket' not installed \n\t => No signs available")
		streets.extendedBy.bucket = false
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
	
-- Done	
	print("Streets: Setup completed, have fun with StreetsMod ".. streets.version .."!")
	print("Streets: Special thanks to everyone who contributed to this mod (except myself): Immanuel_Kant and philipbenr!")