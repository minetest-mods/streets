# API Documentation of the Streets Mod 3.0

## Helper Functions

## Street Lights

## Road Markings

## Road Surface

## Signs

### `streets.signs.register_collection()`
```lua
streets.signs.register_collection({
    name = "minetest",
    description = "Minetest-style Signs",
    info = "This signs are meant to be internationally understandable."
        .. "Blue signs are mandatory signs."
        .. "Yellow signs are danger signs."
        .. "White-red signs are prohibitory signs.",
})
```

* `name` is an unique technical name for the collection. Allowed characters: `[a-zA-Z0-9-]`
* `description` is a human-readable description of the collection.
  If left blank, it will be auto-generated from the `name` field.
* `info` is a human-readable info text of the collection.
  This field is optional.

Registered collections are stored in `streets.signs.registered_collections`.
`streets.signs.registered_collections` is structured as follows:

```lua
streets.signs.registered_collections = {
    ["minetest"] = {
        name = "minetest",
        description = "Minetest-style Signs",
        info = "This signs are meant to be internationally understandable."
            .. "Blue signs are mandatory signs."
            .. "Yellow signs are danger signs."
            .. "White-red signs are prohibitory signs.",
    }
}
```

`streets.signs.registered_collections` must not be accessed directly.
Use `streets.signs.get_collection_definition(name)` instead,
which returns a copy of the definition or nil.
`name` is the unique name of the collection, whose definition you want to get.

### `streets.signs.register_section()`
```lua
streets.signs.register_section({
    name = "mandatory",
    description = "Mandatory",
    belongs_to = "minetest",
})
```

* `name` is an unique technical name inside the collection for the section. Allowed characters: `[a-zA-Z0-9-]`
* `description` is a human-readable description of the section.
  If left blank, it will be auto-generated from the `name` field.
* `belongs_to` is the name of the collection this section belongs to.

To avoid confusions use `<collection name>:<section name>` when referring to sections.

Registered sections are stored in `streets.signs.registered_sections`.
`streets.signs.registered_sections` is structured as follows:

```lua
streets.signs.registered_sections = {
    ["minetest:mandatory"] = {
        name = "mandatory",
        description = "Mandatory",
        belongs_to = "minetest",
    }
}
```

`streets.signs.registered_sections` must not be accessed directly.
Use `streets.signs.get_section_definition(name)` instead,
which returns a copy of the definition or nil.
`name` is the unique name of the section, whose definition you want to get.
It must have the format `<collection name>:<section name>`.

You can get a table of sign definitions with 
`streets.signs.get_section_definitions_by_collection(<collection name>)`.

### `streets.signs.register_sign()`
```lua
streets.signs.register_sign({
    name = "straightonly",
    description = "Straight Only",
    belongs_to = "minetest:mandatory",
    -- all other fields used in minetest.register_node()
})
```

* `name` is an unique technical name inside the section for the sign. Allowed characters: `[a-zA-Z0-9-]`
* `description` is a human-readable description of the sign.
  If left blank, it will be auto-generated from the `name` field.
* `belongs` is the unique name of the section this sign belongs to.
  Use the form `<collection name>:<section name>`.

Registered signs are stored in `streets.signs.registered_signs`.
`streets.signs.registered_signs` is structured as follows:

```lua
streets.signs.registered_signs = {
    ["minetest:mandatory:straightonly"] = {
        name = "straightonly",
        description = "Straight Only",
        belongs_to = "minetest:mandatory",
        -- all other fields used in minetest.register_node()
    }
}
```

`streets.signs.registered_signs` must not be accessed directly.
Use `streets.signs.get_sign_definition(name)` instead,
which returns a copy of the definition or nil.
`name` is the unique name of the sign, whose definition you want to get.
It must have the format `<collection name>:<section name>:<sign name>`.

You can get a table of sign definitions with 
`streets.signs.get_sign_definitions_by_collection(<collection name>)` and
`streets.signs.get_sign_definitions_by_section(<collection name>:<section name>)`.

## Traffic Lights