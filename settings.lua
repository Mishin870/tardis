local config = require("difficulty-config")

data:extend {
    {
        type = "string-setting",
        name = "tardis-technology-difficulty",
        setting_type = "startup",
        default_value = "easy",
        allowed_values = {"easy", "medium", "hard"},
        order = "a",
        localised_description = config.build_description("technology", "tardis-technology-difficulty")
    },
    {
        type = "string-setting",
        name = "tardis-recipe-difficulty",
        setting_type = "startup",
        default_value = "easy",
        allowed_values = {"easy", "medium", "hard"},
        order = "b",
        localised_description = config.build_description("recipe", "tardis-recipe-difficulty")
    },
    {
        type = "string-setting",
        name = "tardis-fuel-type",
        setting_type = "startup",
        default_value = "uranium-fuel-cell",
        allowed_values = mods["space-age"]
            and {"coal", "solid-fuel", "rocket-fuel", "nuclear-fuel", "uranium-fuel-cell", "promethium-asteroid-chunk"}
            or  {"coal", "solid-fuel", "rocket-fuel", "nuclear-fuel", "uranium-fuel-cell"},
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
        type = "int-setting",
        name = "tardis-fuel-amount",
        setting_type = "startup",
        default_value = 5,
        minimum_value = 1,
        maximum_value = 100,
        order = "d"
    }
}
