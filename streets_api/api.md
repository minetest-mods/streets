# API Documentation of the Streets Mod 3.0

## Helper Functions

* `streets.helpers.get_stairsplus_info(node_name, base_node_name)`
  * Extracts the stair category and alternate out of a given node name.
  * Arguments:
    * `node_name`: The node name where you want to extract the information.
    * `base_node_name`: The name of the base variant of the node, i.e. the solid node.
  * Returns:
    * `staircategory, stairalternate`: The category and the alternate.
* `streets.helpers.get_node_info(node_name)`
  * Gives you Streets Mod-related information about the given node.
  * Arguments:
    * `node_name`: The name of the node you want to get information about.
  * Returns:
    * `{}`: An empty table is returned when
      * the node name doesn't start with `"streets:"`
      * or no information can be found regarding this node.
    * A table with the following fields:
      * `category`: Can either be `sign`, `surface`, `roadmarking` or `roadmarking_on_surface`.
      * `belongs_to`: The collection and section a sign belongs to or the collection a roadmarking belongs to.
        `nil` for surfaces.
      * `name`: The name of the sign, `nil` for other categories.
      * `variation`: The variation of the node, can be `nil`.
      * `surface_name`: The name of the surface.
      * `roadmarking_name`: The name of the roadmarking.
      * `rotation`: The rotation of the roadmarking.
      * `stairlike`: If true, the node is a stairlike one (e.g. stair, slab, panel, slope etc.).
      * `staircategory`: The category of the node's shape, in the format used by `moreblocks/stairsplus`,
        e.g. `stair`, `slab`, `panel`, `slope` etc.
      * `stairalternate`: The alternate of the node's shape, in the format used by `moreblocks/stairsplus`,
        e.g. an empty string, `_1`, `_2`, `_quarter` etc.
* `streets.helpers.register_stairs(name, def, subset)`
  * Registers stairlike nodes. Uses stairplus when available,
    otherwise, the Streets Mod registers a limited subset of stairs, slabs and panels.
  * Arguments:
    * `name`: The name of the base node, without the modname.
    * `def`: The definition of the node, as used in `minetest.register_node()`
    * `subset`: This defines which subset of variations to register.
      Must be a `subset` table as used by `stairsplus:register_custom_subset()`.
* `streets.helpers.split_subset(subset)`
  * Separates the variations which need rotation from those which don't need rotation
  * Arguments:
    * `subset`: Must be a `subset` table as used by `stairsplus:register_custom_subset()`.
  * Returns:
    * `rotation_needed_subset`, `no_rotation_subset`:
      The first subset table contains all variations which require rotation,
      the second one the other variations.

## Stairs Subsets

* `streets.stairs_subset.basic_slabs`: A subset table containing basic slabs in quarter steps.
* `streets.stairs_subset.basic_without_slabs`: A subset table containing basic variations, but no slabs.
* `streets.stairs_subset.basic`: A subset table containing basic variations,
  i.e. the combination of the two tables above.
* `streets.stairs_subset.all`:
  A subset table containing all variations supported by the `moreblocks/stairsplus` mod.

## Colors

* `streets.colors.palette`: A palette of colors commonly used in the Streets Mod in the following form:
  ```lua
  streets.colors.palette = {
      { name = "<name>", description = "<description>", hex = "#rrggbb" },
      ...
  }
  ```

## Street Lights

## Roads

* `streets.roads.registered_roadmarking_collections`:
  A table containing all registered roadmarking collections.
  * Key: The name of the roadmarking collection.
  * Value: The definition table of the roadmarking collection
    as used in `streets.roads.register_roadmarking_collection()`.
  * Whenever possible, don't access this directly, but use one of the getter functions below instead.
* `streets.roads.registered_roadmarkings`:
  A table containing all registered roadmarkings.
  * Key: `<collection name>:<roadmarking name>`
  * Value: The definition table of the roadmarking as used in `streets.roads.register_roadmarking()`.
  * Whenever possible, don't access this direclty, but use one of the getter functions below instead.
* `streets.roads.registered_surfaces`
  A table containing all registered surfaces.
  * Key: The name of the surface.
  * Value: The definition of the surface as used in `streets.roads.register_surface()`.
  * Whenever possible, don't access this directly, but use one of the getter functions below instead.
* `streets.roads.build_node_name(def)`: Generates the node name out of the given parameters.
  * Arguments:
    * `def`: A table containing the following fields (all fields are optional):
      * `rotation`: `nil`, `r0`, `r90`, `r180` or `r270`
      * `omit_mod_name`: If true, the mod name is omitted.
      * `omit_colon`: If true, the leading colon is omitted.
       * `staircategory`: The category of the node's shape, in the format used by `moreblocks/stairsplus`,
         e.g. `stair`, `slab`, `panel`, `slope` etc.
       * `stairalternate`: The alternate of the node's shape, in the format used by `moreblocks/stairsplus`,
         e.g. an empty string, `_1`, `_2`, `_quarter` etc.
       * `belongs_to`: The name of the roadmarking collection.
       * `roadmarking_name`: The name of the roadmarking.
       * `surface_name`: The name of the surface.
       * `variation`: The variation of the node.
* `streets.roads.register_roadmarking_collection(def)`:
  Registers a roadmarking collection and adds the definition to
  `streets.roads.registered_roadmarking_collections`.
  * Arguments:
    * `def`: A table containing the following fields:
      * `name`: A unique technical name for the collection.
        Allowed characters are: `[a-zA-Z0-9_]`, two consecutive underscores (`__`) are not allowed.
      * `description`: Human-readable description of the collection.
        If left blank, it will be auto-generated from the name field.
* `streets.roads.register_roadmarking(def)`: Registers a roadmarking and adds the definition to
  `streets.roads.registered_roadmarkings`.
  * Arguments:
    * `def`: a definition table as used in `minetest.register_node()`.
      The following fields have a special meaning:
      * `name`: A unique technical name inside the collection for the roadmarking.
         Allowed characters are: `[a-zA-Z0-9_]`, two consecutive underscores (`__`) are not allowed.
      * `description`: Human-readable description of the roadmarking.
        If left blank, it will be auto-generated from the name field.
      * `belongs_to`: The name of the collection the roadmarking belongs to.
      * `tex`: The texture of the roadmarking, should be white.
      * `ink_needed`: The amount of ink which is consumed when placing the roadmarking.
        Usually, the values are between 1 and 16.
      * `stairs`: Can be nil or a table. If nil, no stairs etc. will be registered from this roadmarking.
        If a table, then the table should specify the needed rotations like this:
        `stairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 }`
      * `basic_stairs`: Can be nil or a table.
        If nil, no stairs etc. will be registered from this roadmarking.
        If a table, then the table should specify the needed rotations like this:
        `basicstairs = { r0 = 1, r90 = 1, r180 = 1, r270 = 1 }`
        The rotations specified here are considered as essential.
        For less important ones, use the `stairs` field.
* `streets.roads.register_surface(def)`: Registers a road surface and adds the definition to
  `streets.roads.registered_surfaces`.
  * Arguments:
    * `def`: a definition table as used in `minetest.register_node()`.
      The following fields have a special meaning:
      * `name`: A unique technical name for the road surface.
         Allowed characters are: `[a-zA-Z0-9_]`, two consecutive underscores (`__`) are not allowed.
      * `description`: Human-readable description of the road surface.
        If left blank, it will be auto-generated from the name field.
      * `tex`: The texture of the surface.
      * `register_base_node_stairs`:
        Must be a `subset` table as used by `stairsplus:register_custom_subset()`.
        This defines which stairs variations are registered for the surface base node.
      * `register_all_roadmarking_stairs`:
        Must be a `subset` table as used by `stairsplus:register_custom_subset()`.
        This defines which stairs variations are registered for all roadmarking combinations.
        This internally uses the `stairs` field of the roadmarking definition.
      * `register_basic_roadmarking_stairs`:
        Must be a `subset` table as used by `stairsplus:register_custom_subset()`.
        this defines which stairs variations are registered for essential roadmarking combinations.
        This internally uses the `basic_stairs` field of the roadmarking definition.
      * `register_variants`: If `true`, variants (manholes, stormdrains etc.) will be registered.
* `streets.roads.get_roadmarking_collection_definition(name)`
  * `name` is the name of the roadmarking collection.
  * Returns a copy of the roadmarking collection definition or nil.
* `streets.roads.get_roadmarking_definition(name)`
  * `name` has the following format: `<collection name>:<roadmarking name>`.
  * Returns a copy of the roadmarking definition or nil.
* `streets.roads.get_roadmarking_definitions_by_collection(name)`
  * `name` is the name of the roadmarking collection.
  * Returns a table of copies of all roadmarking definitions belonging to the given collection
    or an empty table.
* `streets.roads.get_surface_definition(name)`
  * `name` is the name of the surface.
  * Returns a copy of the surface definition or nil.

## Signs

* `streets.signs.registered_collections`:
  A table containing all registered collections.
  * Key: The name of the collection.
  * Value: The definition table of the collection
    as used in `streets.signs.register_collection()`.
  * Whenever possible, don't access this directly, but use one of the getter functions below instead.
* `streets.signs.registered_sections`:
  A table containing all registered sections.
  * Key: The name of the section in the format `<collection name>:<section name>`.
  * Value: The definition table of the section
    as used in `streets.signs.register_section()`.
  * Whenever possible, don't access this directly, but use one of the getter functions below instead.
* `streets.signs.registered_signs`:
  A table containing all registered signs.
  * Key: The name of the sign in the format `<collection name>:<section name>:<sign name>`.
  * Value: The definition table of the sign
    as used in `streets.signs.register_sign()`.
  * Whenever possible, don't access this directly, but use one of the getter functions below instead.
* `streets.signs.build_node_name(belongs_to, name, variation, omit_colon)`:
   Generates the node name out of the given arguments.
  * Arguments:
    * `belongs_to`: `<collection name>:<section name>`.
    * `name`: The name of the sign.
    * `variation`: The variation of the node, e.g. `polemounted`.
    * `omit_colon`: If true, the leading colon is omitted.
* `streets.signs.build_texture_name(belongs_to, name)`:
  Generates the default texture name out of the given arguments.
  * Arguments:
    * `belongs_to`: `<collection name>:<section name>`.
    * `name`: The name of the sign.
* `streets.signs.register_collection(def)`:
  Registers a collection and adds the definition to `streets.signs.registered_collections`.
  * Arguments:
    * `def`: A table containing the following fields:
      * `name`: A unique technical name for the collection.
        Allowed characters are: `[a-zA-Z0-9_]`, two consecutive underscores (`__`) are not allowed.
      * `description`: Human-readable description of the collection.
        If left blank, it will be auto-generated from the name field.
* `streets.signs.register_section(def)`:
  Registers a section and adds the definition to `streets.signs.registered_sections`.
  * Arguments:
    * `def`: A table containing the following fields:
      * `name`: A unique technical inside the collection name for the section.
        Allowed characters are: `[a-zA-Z0-9_]`, two consecutive underscores (`__`) are not allowed.
      * `description`: Human-readable description of the section.
        If left blank, it will be auto-generated from the name field.
      * `belongs_to`: The collection where the section belongs to.
* `streets.signs.register_sign(def)`:
  Registers a sign and adds the definition to `streets.signs.registered_signs`.
  * Arguments:
    * `def`: A table containing the following fields:
      * `name`: A unique technical inside the section name for the sign.
        Allowed characters are: `[a-zA-Z0-9_]`, two consecutive underscores (`__`) are not allowed.
      * `description`: Human-readable description of the sign.
        If left blank, it will be auto-generated from the name field.
      * `belongs_to`: `<collection name>:<section name>`.
      * `style` defines the appearance of the sign.
        Possible options are:
        * `box`
      * `size`: Describes the size of the sign in the format `{-x, -y, +x, +y}`
        when `style = "box` is used.
        Default value is `{-0.5, -0.5, 0.5, 0.5}`.
      * `tex`: The front tile of the sign.
        This field is used, when `tiles` is left blank.
        When `tex` is left blank, too,
        the following front tile name will be auto-generated:
        `streets_signs_<collection name>__<section name>__<sign name>.png`
* `streets.signs.get_collection_definition(name)`
  * `name` is the name of the collection.
  * Returns a copy of the collection definition or nil.
* `streets.signs.get_section_definition(name)`
  * `name` has the following format: `<collection name>:<section name>`.
  * Returns a copy of the section definition or nil.
* `streets.signs.get_sign_definition(name)`
  * `name` has the following format: `<collection name>:<section name>:<sign name>`.
  * Returns a copy of the sign definition or nil.
* `streets.signs.get_section_definitions_by_collection(name)`
  * `name` is the name of the collection.
  * Returns a table of copies of all section definitions belonging to the given collection
    or an empty table.
* `streets.signs.get_sign_definitions_by_collection(name)`
  * `name` is the name of the collection.
  * Returns a table of copies of all sign definitions belonging to the given collection
    or an empty table.
* `streets.signs.get_sign_definitions_by_section(name)`
  * `name` has the following format: `<collection name>:<section name>`.
  * Returns a table of copies of all sign definitions belonging to the given section
    or an empty table.

## Traffic Lights

* `streets.trafficlights.registered_trafficlights`:
  A table containing all registered trafficlights.
  * Key: `<trafficlight name>`
  * Value: The definition table of the trafficlight as used in `streets.trafficlights.register_trafficlight()`.
  * Whenever possible, don't access this direclty, but use the getter function below instead.
* `streets.trafficlights.get_trafficlight_definition(name)`
  * `name` has the following format: `<trafficlight name>`.
  * Returns a copy of the trafficlight definition or nil.
* `streets.trafficlights.register_trafficlight(def)`:
  Registers a trafficlight and adds the definition to `streets.trafficlights.registered_trafficlights`.
  * Arguments:
    * `def`: A table containing the following fields:
      * `name`: A unique technical name for the trafficlight.
        Allowed characters are: `[a-zA-Z0-9_]`, two consecutive underscores (`__`) are not allowed.
      * `description`: Human-readable description of the trafficlight.
      * `aspects`: Number of the aspects of the trafficlight. Can be between 1 and 5.
      * `horizontal`: If true, the trafficlight will be horizontal.
      * `hybrid`: If true, the trafficlight will have the shape of a hybrid beacon;
        `aspects` is automatically set to 3 then.
      * `default`: A table in the following form:
         ```lua
         default = {
         		aspect_1 = "streets_trafficlight_red_off.png",
         		aspect_2 = "streets_trafficlight_yellow_off.png",
         		aspect_3 = "streets_trafficlight_green_off.png",
         }
         ```
      * `phases`: A table in the following form:
         ```lua
         phases = {
         	red = {
         		aspect_1 = "streets_trafficlight_red_on.png",
         	},
         	yellow = {
         		aspect_2 = "streets_trafficlight_yellow_on.png",
         	},
         	green = {
         		aspect_3 = "streets_trafficlight_green_on.png",
         	},
         	-- Further phases can be defined, an "off" phase will be inserted automatically.
         }
         ```
