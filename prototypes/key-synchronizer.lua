local T = "__tardis__"

data:extend({
    {
        type = "simple-entity",
        name = "tardis-key",
        icon = T .. "/graphics/items/key.png",
        icon_size = 64,
        flags = {"not-on-map", "placeable-off-grid"},
        selectable_in_game = false,
        max_health = 1,
        collision_box = {{0, 0}, {0, 0}},
        selection_box = {{0, 0}, {0, 0}},
        collision_mask = {layers = {}},

        pictures = {{
            filename = T .. "/graphics/items/key.png",
            width = 64,
            height = 64,
        }},
        autoplace = { probability_expression = 0 },
    },
    {
        type = "item-with-tags",
        name = "tardis-key",
        icon = T .. "/graphics/items/key.png",
        icon_size = 64,
        stack_size = 1,
        subgroup = "tardis",
        flags = {"not-stackable"},
        place_result = "tardis-key",
    },
})



data:extend {
    -- Key Synchronizer entity (container with GUI)
    {
        type = "container",
        name = "tardis-key-synchronizer",
        icon = T .. "/graphics/buildings/key-synchronizer/icon.png",
        icon_size = 64,
        flags = {"not-on-map", "hide-alt-info", "not-deconstructable", "not-blueprintable", "not-flammable", "not-upgradable"},
        selectable_in_game = true,
        hidden = true,
        hidden_in_factoriopedia = true,
        max_health = 1000,
        collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        collision_mask = {layers = {object = true, player = true, water_tile = true}},
        inventory_size = 1,
        picture = {
            layers = {
                {
                    filename = T .. "/graphics/buildings/key-synchronizer/shadow.png",
                    width = 314,
                    height = 157,
                    scale = 0.5,
                    draw_as_shadow = true,
                },
                {
                    filename = T .. "/graphics/buildings/key-synchronizer/base.png",
                    width = 314,
                    height = 157,
                    scale = 0.5,
                },
            }
        },
        render_layer = "object",
    },

    -- Key Synchronizer item (for placement)
    {
        type = "item",
        name = "tardis-key-synchronizer",
        icon = T .. "/graphics/buildings/key-synchronizer/icon.png",
        icon_size = 64,
        place_result = "tardis-key-synchronizer",
        stack_size = 1,
        subgroup = "tardis",
        order = "b",
    },
}
