--[[
	## StreetsMod 2.0 ##
	Submod: streetsmod
	Optional: false
	Category: Init
]]

local function copytable(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in next, orig, nil do
			copy[copytable(orig_key)] = copytable(orig_value)
		end
		setmetatable(copy, copytable(getmetatable(orig)))
	else
		copy = orig
	end
	return copy
end

function streets.load_submod(dirname)
	-- Check whether submod's init file exists
	local f = io.open(streets.conf.modpath .. "/" .. dirname .. "/init.lua")
	if f ~= nil then
		-- Load it
		f.close()
		dofile(streets.conf.modpath .. "/" .. dirname .. "/init.lua")
	else
		minetest.log("error", "[Streets] '" .. dirname .. "' does not exist")
	end
end

function streets.register_road_surface(data)
	streets.surfaces.surfacetypes["streets:"..data.name] = data
end

function streets.register_road_sign(data)
	streets.signs.signtypes["streets:"..data.name] = data
end

function streets.register_road_marking(data)
	streets.labels.labeltypes[data.name] = data
end
