local config = require("difficulty-config")

local difficulty = settings.startup["tardis-recipe-difficulty"].value
local recipe = config.recipe[difficulty]

data:extend {
    {
        type = "recipe",
        name = "tardis",
        enabled = false,
        energy_required = recipe.energy_required,
        ingredients = recipe.ingredients,
        results = {{type = "item", name = "tardis", amount = 1}},
        main_product = "tardis",
        localised_name = {"entity-name.tardis"},
        category = data.raw["recipe-category"]["metallurgy-or-assembling"] and "metallurgy-or-assembling" or nil
    }
}

-- small vanilla change to allow factories to be crafted at the start of the game
if data.raw["recipe-category"]["metallurgy-or-assembling"] then
    table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories or {}, "metallurgy-or-assembling")
end
