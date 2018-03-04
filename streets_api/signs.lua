streets.signs = {}

streets.signs.registered_systems = {}
streets.signs.registered_sections = {}
streets.signs.registered_signs = {}

streets.signs.register_system = function(def)
	streets.signs.registered_systems[def.id] = def
	streets.signs.registered_sections[def.id] = {}
	streets.signs.registered_signs[def.id] = {}
end


streets.signs.register_section = function(def)
	streets.signs.registered_sections[def.system][def.id] = def
	streets.signs.registered_signs[def.system][def.id] = {}
end

streets.signs.register_sign = function(def)
	streets.signs.registered_signs[def.system][def.section][def.id] = def
	local normal_def = table.copy(def)
	local polemount_def = table.copy(def)
	minetest.register_node(":streets:sign_" .. def.system .. "_" .. def.section .. "_" .. def.id, normal_def)
	minetest.register_node(":streets:sign_" .. def.system .. "_" .. def.section .. "_" .. def.id .. "_polemount", polemount_def)
end