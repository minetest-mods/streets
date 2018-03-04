streets.roads = {}

streets.roads.registered_labels = {}

streets.roads.registered_surfaces = {}

local register_combination = function(label_name, label_def, surface_name, surface_def)
	-- register nodes
end

streets.roads.register_surface = function(name, def)
	streets.roads.registered_surfaces[name] = def
	for label_name, label_def in streets.roads.registered_labels do
		register_combination(label_name, label_def, name, def)
	end
end

streets.roads.register_label = function(name, def)
	streets.roads.registered_labels[name] = def
	for surface_name, surface_def in streets.roads.registered_surfaces do
		register_combination(name, def, surface_name, surface_def)
	end
end