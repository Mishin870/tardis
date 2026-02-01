require "prototypes.tardis"
require "prototypes.console"
require "prototypes.component"
require "prototypes.recipe"
require "prototypes.technology"
require "prototypes.tile"
require "prototypes.space-location"
require "prototypes.ceiling"
require "prototypes.quality-tooltips"

data:extend {
    {
        type = "item-subgroup",
        name = "tardis",
        group = "logistics",
        order = "e-e"
    },
    {
        type = "custom-input",
        name = "tardis-rotate",
        key_sequence = "R",
        controller_key_sequence = "controller-rightstick"
    },
    {
        type = "custom-input",
        name = "tardis-increase",
        key_sequence = "SHIFT + R",
        controller_key_sequence = "controller-dpright"
    },
    {
        type = "custom-input",
        name = "tardis-decrease",
        key_sequence = "CONTROL + R",
        controller_key_sequence = "controller-dpleft"
    },
}
