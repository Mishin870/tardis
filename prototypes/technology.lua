local T = "__tardis__"
local pf = "p-q-"
local config = require("difficulty-config")

local effects = {
    {
        type = "unlock-recipe",
        recipe = "tardis"
    },
    {
        type = "unlock-space-location",
        space_location = "tardis-pocket-surface",
        use_icon_overlay_constant = false,
    },
    {
        type = "unlock-recipe",
        recipe = "tardis-key-synchronizer",
    },
    {
        type = "unlock-recipe",
        recipe = "tardis-key",
    },
}

local difficulty = settings.startup["tardis-technology-difficulty"].value
local tech = config.technology[difficulty]

data:extend {{
    type = "technology",
    name = "tardis",
    icon = T .. "/graphics/technology/tardis.png",
    icon_size = 256,
    prerequisites = tech.prerequisites,
    effects = effects,
    unit = {
        count = tech.count,
        ingredients = tech.ingredients,
        time = tech.time
    },
    order = pf .. "a-a",
}}
