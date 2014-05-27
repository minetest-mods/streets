-- Form for chatcommand /streets
	streets.forms.chatcmd = smartfs.create("streets:chatcmd", function(state)
		state:load(streets.modpath .. "/forms/cmd_streets.smartfs")
	end)