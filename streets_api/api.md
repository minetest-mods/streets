# API Documentation of the Streets Mod 3.0

## Helper Functions

## Street Lights

## Road Markings

## Road Surface

## Signs

### `streets.signs.register_system()`
```lua
streets.signs.register_system({
    id = "minetest",
    name = "Minetest-style Signs",
    description = "This signs are meant to be internationally understandable."
        .. "Blue signs are mandatory signs."
        .. "Yellow signs are danger signs."
        .. "White-red signs are prohibitory signs.",
})
```

* `id` is an unique technical identifier for the system. Allowed characters: `[a-zA-Z0-9-]`
* `name` is a human-readable name of the system.
* `description` is a human-readable description of the system.

Registered systems are stored in `streets.signs.registered_systems`.
`streets.signs.registered_systems` is structured as follows:

```lua
streets.signs.registered_systems = {
    minetest = {
        id = "minetest",
        name = "Minetest-style Signs",
        description = "This signs are meant to be internationally understandable."
            .. "Blue signs are mandatory signs."
            .. "Yellow signs are danger signs."
            .. "White-red signs are prohibitory signs.",
    }
}
```

### `streets.signs.register_section()`
```lua
streets.signs.register_section({
    id = "mandatory",
    name = "Mandatory",
    system = "minetest",
})
```

* `id` is an unique technical identifier inside the system for the section. Allowed characters: `[a-zA-Z0-9-]`
* `name` is a human-readable name of the section.
* `system` is the id of the system this section belongs to.

To avoid confusions use `<system id>:<section id>` when referring to sections.

Registered sections are stored in `streets.signs.registered_sections`.
`streets.signs.registered_sections` is structured as follows:

```lua
streets.signs.registered_sections = {
    minetest = {
        mandatory = {
            id = "mandatory",
            name = "Mandatory",
            system = "minetest",
        }
    }
}
```

### `streets.signs.register_sign()`
```lua
streets.signs.register_sign({
    id = "straightonly",
    name = "Straight Only",
    system = "minetest",
    section = "mandatory",
    -- all other fields used in minetest.register_node()
})
```

* `id` is an unique technical identifier inside the section for the sign. Allowed characters: `[a-zA-Z0-9-]`
* `name` is a human-readable name of the sign.
* `system` is the id of the system this sign belongs to.
* `section` is the id of the section this sign belongs to.

Registered signs are stored in `streets.signs.registered_signs`.
`streets.signs.registered_signs` is structured as follows:

```lua
streets.signs.registered_signs = {
    minetest = {
        mandatory = {
            straightonly = {
                id = "straightonly",
                name = "Straight Only",
                system = "minetest",
                section = "mandatory",
                -- all other fields used in minetest.register_node()
            }
        }
    }
}
```

## Traffic Lights