local T = "__tardis__";

data:extend {
    {
        type = "storage-tank",
        name = "tardis",
        icon = T .. "/graphics/tardis/icon.png",
        icon_size = 64,
        flags = {"player-creation", "placeable-player"},
        minable = {mining_time = 0.5, result = "tardis-instantiated", count = 1},
        placeable_by = {item = "tardis", count = 1},
        max_health = 2000,
        collision_box = {{-2, -0.8}, {2.2, 2.8}},
        selection_box = {{-2, -0.8}, {2.2, 2.8}},
        pictures = {
            picture = {
                layers = {
                    {
                        filename = T .. "/graphics/tardis/shadow.png",
                        width = 211 * 2,
                        height = 182 * 2,
                        scale = 0.5,
                        shift = {1.5, 0},
                        draw_as_shadow = true
                    },
                    {
                        filename = T .. "/graphics/tardis/base.png",
                        width = 211 * 2,
                        height = 182 * 2,
                        scale = 0.5,
                        shift = {1.5, 0},
                    }
                }
            },
        },
        window_bounding_box = {{0, 0}, {0, 0}},
        fluid_box = {
            volume = 1,
            pipe_connections = {},
        },
        flow_length_in_ticks = 1,
        circuit_wire_max_distance = 0,
        map_color = {r = 0.8, g = 0.7, b = 0.55},
        is_military_target = true,
        moc_ignore = true,
    },
    {
        type = "item-with-tags",
        name = "tardis-instantiated",
        localised_name = {"item-name.tardis-packed", {"entity-name.tardis"}},
        icons = {
            {
                icon = T .. "/graphics/tardis/icon.png",
                icon_size = 64,
            },
            {
                icon = T .. "/graphics/tardis/packed.png",
                icon_size = 64,
            }
        },
        subgroup = "tardis",
        order = "b-a",
        place_result = "tardis",
        stack_size = 1,
        weight = 100000000,
        flags = {"not-stackable"},
        hidden_in_factoriopedia = true,
        factoriopedia_alternative = "tardis"
    },
    {
        type = "item",
        name = "tardis",
        icon = T .. "/graphics/tardis/icon.png",
        icon_size = 64,
        subgroup = "tardis",
        order = "b-a",
        weight = 100000000,
        place_result = "tardis",
        stack_size = 1,
        flags = {"primary-place-result", "not-stackable"}
    }
}