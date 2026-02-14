local config = require("difficulty-config")

local fuel_types = {"wood", "coal", "solid-fuel", "rocket-fuel", "nuclear-fuel", "uranium-fuel-cell"}
if mods["space-age"] then
    fuel_types[#fuel_types + 1] = "carbon"
    fuel_types[#fuel_types + 1] = "fusion-power-cell"
    fuel_types[#fuel_types + 1] = "bioflux"
    fuel_types[#fuel_types + 1] = "promethium-asteroid-chunk"
end

local difficulty_levels = {"easy", "medium", "hard"}
local default_difficulty = "hard"
if mods["space-age"] then
    difficulty_levels[#difficulty_levels + 1] = "space"
    default_difficulty = "space"
end

data:extend {
    {
        type = "string-setting",
        name = "tardis-technology-difficulty",
        setting_type = "startup",
        default_value = default_difficulty,
        allowed_values = difficulty_levels,
        order = "a",
        localised_description = config.build_description("technology", "tardis-technology-difficulty")
    },
    {
        type = "string-setting",
        name = "tardis-recipe-difficulty",
        setting_type = "startup",
        default_value = default_difficulty,
        allowed_values = difficulty_levels,
        order = "b",
        localised_description = config.build_description("recipe", "tardis-recipe-difficulty")
    },
    {
        type = "string-setting",
        name = "tardis-fuel-type",
        setting_type = "startup",
        default_value = "uranium-fuel-cell",
        allowed_values = fuel_types,
        order = "c"
    },
    {
        type = "bool-setting",
        name = "tardis-map-teleport",
        setting_type = "startup",
        default_value = true,
        order = "e"
    },
    {
        type = "bool-setting",
        name = "tardis-block-space-platforms",
        setting_type = "startup",
        default_value = false,
        order = "f"
    },
    {
        type = "int-setting",
        name = "tardis-fuel-amount",
        setting_type = "startup",
        default_value = 5,
        minimum_value = 1,
        maximum_value = 100,
        order = "d"
    }
}
