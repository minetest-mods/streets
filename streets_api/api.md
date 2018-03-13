# API Documentation of the Streets Mod 3.0

## Helper Functions

## Street Lights

## Road Markings

### `streets.roads.register_label_collection()`
```lua
streets.roads.register_label_collection({
    name = "sidelines",
    description = "Sidelines",
})
```

* `name` is an unique technical name for the collection.
  Allowed characters are: `[a-zA-Z0-9-]`
* `description` is a human-readable description of the collection.
  If left blank, it will be auto-generated from the `name` field.

Registered collections are stored in `streets.roads.registered_label_collections`.
`streets.roads.registered_label_collections` is structured as follows:

```lua
streets.roads.registered_collections = {
    ["sidelines"] = {
        name = "sidelines",
        description = "Sidelines",
    }
}
```

`streets.roads.registered_label_collections` must not be accessed directly.
Use `streets.roads.get_label_collection_definition(name)` instead,
which returns a copy of the definition or nil.
`name` is the unique name of the collection, whose definition you want to get.

### `streets.roads.register_label()`
```lua
streets.roads.register_label({
    name = "solid",
    description = "Solid Sideline",
    belongs_to = "sidelines",
})
```

* `name` is an unique technical name inside the collection for the label.
  Allowed characters are: `[a-zA-Z0-9-]`
* `description` is a human-readable description of the label.
  If left blank, it will be auto-generated from the `name` field.
* `belongs_to` is the name of the collection this label belongs to.

To avoid confusions use `<collection name>:<label name>` when referring to labels.

Registered labels are stored in `streets.roads.registered_labels`.
`streets.roads.registered_labels` is structured as follows:

```lua
streets.roads.registered_labels = {
    ["sidelines:solid"] = {
        name = "solid",
        description = "Solid Sideline",
        belongs_to = "sidelines",
    }
}
```

`streets.roads.registered_labels` must not be accessed directly.
Use `streets.roads.get_label_definition(name)` instead,
which returns a copy of the definition or nil.
`name` is the unique name of the label, whose definition you want to get.
It must have the format `<collection name>:<label name>`.

You can get a table of label definitions with 
`streets.signs.get_label_definitions_by_collection(<collection name>)`.

## Road Surface

### `streets.roads.register_surface()`
```lua
streets.roads.register_surface({
    name = "asphalt",
    description = "Asphalt",
})
```

* `name` is an unique technical name for the surface.
  Allowed characters are: `[a-zA-Z0-9-]`
* `description` is a human-readable description of the surface.
  If left blank, it will be auto-generated from the `name` field.

Registered surfaces are stored in `streets.roads.registered_surfaces`.
`streets.roads.registered_surfaces` is structured as follows:

```lua
streets.roads.registered_surfaces = {
    ["asphalt"] = {
        name = "asphalt",
        description = "Asphalt",
    }
}
```

`streets.roads.registered_surfaces` must not be accessed directly.
Use `streets.roads.get_surface_definition(name)` instead,
which returns a copy of the definition or nil.
`name` is the unique name of the surface, whose definition you want to get.

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

* `name` is an unique technical name for the collection.
  Allowed characters are: `[a-zA-Z0-9-]`
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

* `name` is an unique technical name inside the collection for the section.
  Allowed characters are: `[a-zA-Z0-9-]`
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
    style = "box",
    size = {-0.5, -0.5, 0.5, 0.5},
    tex = "streets_signs_minetest_mandatory_straightonly.png",
    -- all other fields used in minetest.register_node()
})
```

* `name` is an unique technical name inside the section for the sign.
  Allowed characters are: `[a-zA-Z0-9-]`
* `description` is a human-readable description of the sign.
  If left blank, it will be auto-generated from the `name` field.
* `belongs` is the unique name of the section this sign belongs to.
  Use the form `<collection name>:<section name>`.
* `style` defines the appearance of the sign.
  Possible options are:
  * `box`
* `size` is an optional field,
  which describes the size of the sign in the format `{-x, -y, +x, +y}`
  when `style = "box` is used.
  Default value is `{-0.5, -0.5, 0.5, 0.5}`.
* `tex` is the front tile of the sign.
  This field is used, when `tiles` is left blank.
  When `tex` is left blank, too,
  the following front tile name will be auto-generated:
  `streets_signs_<collection name>_<section name>_<sign name>.png`


Registered signs are stored in `streets.signs.registered_signs`.
`streets.signs.registered_signs` is structured as follows:

```lua
streets.signs.registered_signs = {
    ["minetest:mandatory:straightonly"] = {
        name = "straightonly",
        description = "Straight Only",
        belongs_to = "minetest:mandatory",
        style = "box",
        size = {-0.5, -0.5, 0.5, 0.5},
        tex = "streets_signs_minetest_mandatory_straightonly.png",
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