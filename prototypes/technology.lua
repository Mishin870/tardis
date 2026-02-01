local T = "__tardis__"
local pf = "p-q-"

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
}

-- tardis buildings

data:extend {{
    type = "technology",
    name = "tardis",
    icon = T .. "/graphics/technology/tardis.png",
    icon_size = 256,
    prerequisites = {"stone-wall", "logistics"},
    effects = effects,
    unit = {
        count = 200,
        ingredients = {{"automation-science-pack", 1}},
        time = 30
    },
    order = pf .. "a-a",
}}
