streets.roads = {}

streets.roads.registered_label_collections = {}

streets.roads.registered_labels = {}

streets.roads.registered_surfaces = {}

local register_combination = function(label_def, surface_def)
	-- register nodes
end

streets.roads.register_label_collection = function(def)
	streets.roads.registered_label_collections[def.name] = def
end

streets.roads.register_label = function(def)
	streets.roads.registered_labels[def.belongs_to .. ":" .. def.name] = def
	for _, surface_def in streets.roads.registered_surfaces do
		register_combination(def, surface_def)
	end
end

streets.roads.register_surface = function(def)
	streets.roads.registered_surfaces[def.name] = def
	for _, label_def in streets.roads.registered_labels do
		register_combination(label_def, def)
	end
end

streets.roads.get_label_collection_definition = function(name)
	local def = streets.roads.registered_collections[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.roads.get_label_definition = function(name)
	local def = streets.roads.registered_labels[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.roads.get_label_definitions_by_collection = function(name)
	local definitions = {}
	for k, v in pairs(streets.roads.registered_labels) do
		if v.belongs_to == name then
			definitions[k] = table.copy(v)
		end
	end
	return definitions
end

streets.roads.get_surface_definition = function(name)
	local def = streets.roads.registered_surfaces[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end