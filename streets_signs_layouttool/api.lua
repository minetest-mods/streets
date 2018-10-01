streets.signs_layouttool = {}

streets.signs_layouttool.registered_collections = {}
streets.signs_layouttool.registered_sections = {}
streets.signs_layouttool.registered_signs = {}
streets.signs_layouttool.all_signs = {}

streets.signs_layouttool.register_collection = function(def)
	streets.signs_layouttool.registered_collections[def.name] = def
end


streets.signs_layouttool.register_section = function(def)
	streets.signs_layouttool.registered_sections[def.belongs_to .. ":" .. def.name] = def
end

streets.signs_layouttool.register_sign = function(def)
	streets.signs_layouttool.registered_signs[def.belongs_to .. ":" .. def.name] = def
	streets.signs_layouttool.all_signs[#streets.signs_layouttool.all_signs + 1] = def
end

streets.signs_layouttool.get_collection_definition = function(name)
	local def = streets.signs_layouttool.registered_collections[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.signs_layouttool.get_section_definition = function(name)
	local def = streets.signs_layouttool.registered_sections[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.signs_layouttool.get_sign_definition = function(name)
	local def = streets.signs_layouttool.registered_signs[name]
	if type(def) == "table" then
		return table.copy(def)
	else
		return nil
	end
end

streets.signs_layouttool.get_section_definitions_by_collection = function(name)
	local definitions = {}
	for k, v in pairs(streets.signs_layouttool.registered_sections) do
		if v.belongs_to == name then
			definitions[k] = table.copy(v)
		end
	end
	return definitions
end

streets.signs_layouttool.get_sign_definitions_by_collection = function(name)
	local definitions = {}
	for k, v in pairs(streets.signs_layouttool.registered_signs) do
		if v.belongs_to:find(name) == 1 then
			definitions[k] = table.copy(v)
		end
	end
	return definitions
end

streets.signs_layouttool.get_sign_definitions_by_section = function(name)
	local definitions = {}
	for k, v in pairs(streets.signs_layouttool.registered_signs) do
		if v.belongs_to == name then
			definitions[k] = table.copy(v)
		end
	end
	return definitions
end