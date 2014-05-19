streets.forms.chatcmd = smartfs.create("streets:chatcmd", function(state)
	state:size(10,6)
	local tlist = state:element("list", { pos={x=0,y=1}, size={w=6,h=5}, name = "streets:chatcmd_modlist" } )
	tlist:removeItem()
	for k, v in pairstreets.S(streets.extendedBy) do
		tlist:addItem(tostring(k) .. " " .. streets.S("installed") .. ": " .. tostring(v))
	end
	state:label(6.5, 1, "streets:chatcmd_version", streets.S("Running version") .. ": " .. streets.version)
	state:label(6.5, 1.5, "streets:chatcmd_loadtime", streets.S("Load time") .. ": " .. round(streets.load.fin - streets.load.start,4) .. "s")
end)