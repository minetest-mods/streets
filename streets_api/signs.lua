streets.signs = {}

streets.signs.registered_collections = {}
streets.signs.registered_sections = {}
streets.signs.registered_signs = {}

streets.signs.register_collection = function(def)
	streets.signs.registered_collections[def.name] = def
end


streets.signs.register_section = function(def)
	streets.signs.registered_sections[def.belongs_to .. ":" .. def.name] = def
end

streets.signs.register_sign = function(def)
	streets.signs.registered_signs[def.belongs_to .. ":" .. def.name] = def
	local normal_def = table.copy(def)
	local polemount_def = table.copy(def)
	minetest.register_node(":streets:sign_" .. def.collection .. "_" .. def.section .. "_" .. def.name, normal_def)
	minetest.register_node(":streets:sign_" .. def.collection .. "_" .. def.section .. "_" .. def.name .. "_polemount", polemount_def)
end


streets.signs.get_collection_definition = function(name)
	local def = streets.signs.registered_collections[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.signs.get_section_definition = function(name)
	local def = streets.signs.registered_sections[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.signs.get_sign_definition = function(name)
	local def = streets.signs.registered_signs[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.signs.get_section_definitions_by_collection = function(name)
	local definitions = {}
	for k, v in pairs(streets.signs.registered_sections) do
		if v.belongs_to == name then
			definitions[k] = table.copy(v)
		end
	end
	return definitions
end

streets.signs.get_sign_definitions_by_collection = function(name)
	local definitions = {}
	for k, v in pairs(streets.signs.registered_signs) do
		if v.belongs_to:find(name) == 1 then
			definitions[k] = table.copy(v)
		end
	end
	return definitions
end

streets.signs.get_sign_definitions_by_section = function(name)
	local definitions = {}
	for k, v in pairs(streets.signs.registered_signs) do
		if v.belongs_to == name then
			definitions[k] = table.copy(v)
		end
	end
	return definitions
end