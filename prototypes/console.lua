local T = "__tardis__"

data:extend {
    {
        type = "container",
        name = "tardis-console",
        icon = T .. "/graphics/console/icon.png",
        icon_size = 64,
        flags = {"not-on-map", "hide-alt-info", "not-deconstructable", "not-blueprintable", "not-flammable", "not-upgradable"},
        selectable_in_game = true,
        hidden = true,
        hidden_in_factoriopedia = true,
        max_health = 1000,
        collision_box = {{-3.6, -3}, {2.5, 1.2}},
        selection_box = {{-3.6, -3}, {2.5, 1.2}},
        collision_mask = {layers = {object = true, player = true, water_tile = true}},
        inventory_size = 10,
        inventory_type = "with_filters_and_bar",
        picture = {
            layers = {
                {
                    filename = T .. "/graphics/console/shadow.png",
                    width = 800,
                    height = 418,
                    scale = 0.5,
                    shift = {2.5, -2},
                    draw_as_shadow = true
                },
                {
                    filename = T .. "/graphics/console/base.png",
                    width = 800,
                    height = 418,
                    scale = 0.5,
                    shift = {2.5, -2},
                }
            }
        },
        render_layer = "object",
    },
    {
        type = "animation",
        name = "tardis-console-animated",
        filename = T .. "/graphics/console/animated.png",
        width = 800,
        height = 418,
        frame_count = 10,
        line_length = 1,
        scale = 0.5,
        shift = {2.5, -2},
        run_mode = "forward-then-backward",
    },
    {
        type = "sound",
        name = "tardis-teleportation",
        filename = T .. "/sound/tardis.ogg",
        volume = 0.8,
    },
    {
        type = "sound",
        name = "tardis-teleport-complete",
        filename = T .. "/sound/scifi.ogg",
        volume = 0.8,
    },
    {
        type = "selection-tool",
        name = "tardis-teleport-selector",
        icon = T .. "/graphics/console/icon.png",
        icon_size = 64,
        hidden = true,
        hidden_in_factoriopedia = true,
        stack_size = 1,
        flags = {"only-in-cursor", "not-stackable", "spawnable"},
        select = {
            border_color = {g = 1},
            cursor_box_type = "copy",
            mode = "nothing",
        },
        alt_select = {
            border_color = {g = 1},
            cursor_box_type = "copy",
            mode = "nothing",
        },
    }
}
