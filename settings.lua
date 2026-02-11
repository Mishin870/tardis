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
    }
}
