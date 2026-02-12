local find_surrounding_tardis = remote_api.find_surrounding_tardis

-- INITIALIZATION --

tardis.on_event(tardis.events.on_init(), function()
    storage.tardis_valid_keys = storage.tardis_valid_keys or {}
end)

-- GUID GENERATION --

local function generate_guid()
    return game.tick .. "-" .. math.random(100000, 999999)
end

-- PLACEMENT RESTRICTION & KEY ACTIVATION --

tardis.on_event(tardis.events.on_built(), function(event)
    local entity = event.entity
    if not entity.valid then return end

    -- Handle key-synchronizer placement
    if entity.name == "tardis-key-synchronizer" then
        if not remote_api.is_tardis_surface(entity.surface) then
            tardis.cancel_creation(entity, event.player_index, {"tardis-key-gui.wrong-surface"})
            return
        end

        local tardis_data = find_surrounding_tardis(entity.surface, entity.position)
        if not tardis_data then
            tardis.cancel_creation(entity, event.player_index, {"tardis-key-gui.wrong-surface"})
            return
        end
        return
    end

    -- Handle key activation (place_result entity)
    if entity.name == "tardis-key" then
        local player = game.get_player(event.player_index)
        if not player then
            entity.destroy()
            return
        end

        -- Get tags from the item that was used to plant
        local tags = event.tags or (event.stack and event.stack.valid_for_read and event.stack.tags)

        -- Immediately destroy the dummy entity
        entity.destroy()

        -- Helper to restore key to cursor
        local function restore_key_to_cursor(tags)
            if player.cursor_stack then
                player.cursor_stack.set_stack {
                    name = "tardis-key",
                    count = 1,
                    tags = tags
                }
            end
        end

        if not tags or not tags.tardis_id or not tags.key_guid then
            restore_key_to_cursor(tags or {})
            player.create_local_flying_text {text = {"tardis-key-gui.unbound-key"}, create_at_cursor = true}
            player.play_sound {path = "utility/cannot_build"}
            return
        end

        -- Validate GUID
        local valid_keys = storage.tardis_valid_keys[tags.tardis_id]
        if not valid_keys or not valid_keys[tags.key_guid] then
            restore_key_to_cursor(tags)
            player.create_local_flying_text {text = {"tardis-key-gui.invalid-key"}, create_at_cursor = true}
            player.play_sound {path = "utility/cannot_build"}
            return
        end

        -- Look up TARDIS data
        local tardis_data = storage.factories[tags.tardis_id]
        if not tardis_data then
            restore_key_to_cursor(tags)
            player.create_local_flying_text {text = {"tardis-key-gui.invalid-key"}, create_at_cursor = true}
            player.play_sound {path = "utility/cannot_build"}
            return
        end

        -- Attempt teleport (all checks are done inside)
        local target_position = {player.position.x + 4, player.position.y}
        local success = remote_api.attempt_teleport(player, tardis_data, target_position, player.surface)

        -- Always restore key to cursor
        restore_key_to_cursor(tags)
        return
    end
end)

-- KEY SYNCHRONIZER GUI --

local function destroy_key_gui(player)
    local frame = player.gui.relative["tardis-key-panel"]
    if frame then frame.destroy() end
end

local function create_key_gui(player, entity)
    destroy_key_gui(player)

    local anchor = {
        gui = defines.relative_gui_type.container_gui,
        position = defines.relative_gui_position.right,
        name = "tardis-key-synchronizer",
    }

    local frame = player.gui.relative.add {
        type = "frame",
        name = "tardis-key-panel",
        direction = "vertical",
        anchor = anchor,
    }

    frame.add {
        type = "label",
        caption = {"tardis-key-gui.title"},
        style = "frame_title",
    }

    local content = frame.add {
        type = "flow",
        name = "tardis-key-content",
        direction = "vertical",
        style = "inset_frame_container_vertical_flow",
    }

    local inner = content.add {
        type = "frame",
        name = "tardis-key-inner",
        style = "inside_shallow_frame_with_padding",
        direction = "vertical",
    }

    inner.add {
        type = "button",
        name = "tardis-key-bind",
        caption = {"tardis-key-gui.bind"},
        tooltip = {"tardis-key-gui.bind-tooltip"},
        style = "confirm_button",
    }
end

tardis.on_event(defines.events.on_gui_opened, function(event)
    local entity = event.entity
    if not entity or not entity.valid then return end
    if entity.name ~= "tardis-key-synchronizer" then return end

    create_key_gui(game.get_player(event.player_index), entity)
end)

tardis.on_event(defines.events.on_gui_closed, function(event)
    local entity = event.entity
    if not entity or not entity.valid then return end
    if entity.name ~= "tardis-key-synchronizer" then return end

    destroy_key_gui(game.get_player(event.player_index))
end)

-- BIND BUTTON HANDLER --

gui_events[defines.events.on_gui_click]["^tardis%-key%-bind$"] = function(event)
    local player = game.get_player(event.player_index)
    if not player then return end

    local opened = player.opened
    if not opened or not opened.valid or opened.name ~= "tardis-key-synchronizer" then return end

    -- Find surrounding TARDIS
    local tardis_data = find_surrounding_tardis(opened.surface, opened.position)
    if not tardis_data then
        player.create_local_flying_text {text = {"tardis-key-gui.wrong-surface"}, create_at_cursor = true}
        player.play_sound {path = "utility/cannot_build"}
        return
    end

    -- Check container has any tardis-key variant
    local inventory = opened.get_inventory(defines.inventory.chest)
    local key_slot = nil
    for i = 1, #inventory do
        local slot = inventory[i]
        if slot.valid_for_read and slot.name == 'tardis-key' then
            key_slot = slot
            break
        end
    end

    if not key_slot then
        player.create_local_flying_text {text = {"tardis-key-gui.no-key"}, create_at_cursor = true}
        player.play_sound {path = "utility/cannot_build"}
        return
    end

    -- Invalidate old GUID if any
    local old_tags = key_slot.tags
    if old_tags and old_tags.tardis_id and old_tags.key_guid then
        local old_keys = storage.tardis_valid_keys[old_tags.tardis_id]
        if old_keys then
            old_keys[old_tags.key_guid] = nil
        end
    end

    -- Generate and register new GUID
    local guid = generate_guid()
    local tardis_id = tardis_data.id

    storage.tardis_valid_keys[tardis_id] = storage.tardis_valid_keys[tardis_id] or {}
    storage.tardis_valid_keys[tardis_id][guid] = true

    -- Stamp tags on the key
    key_slot.tags = {tardis_id = tardis_id, key_guid = guid}

    player.create_local_flying_text {text = {"tardis-key-gui.bound"}, create_at_cursor = true}
    player.play_sound { path = "utility/confirm" }
end
