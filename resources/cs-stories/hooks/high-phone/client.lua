return function(resource)
    local zoneNames = exports[resource]:GetEnZoneNames()

    CS_STORIES.GetStoryLocationName = function(coords)
        -- You can replace a story's location parser here, this will not be stored in a story's metadata and you can change it on-demand.
        local zoneName = GetNameOfZone(coords.x, coords.y, coords.z)
        return zoneNames[zoneName] or zoneName
    end

    local originalSetNuiFocusKeepInput = _G.SetNuiFocusKeepInput
    local originalIsEntityPlayingAnim = _G.IsEntityPlayingAnim
    local talking = nil
    local phoneOpen = false
    local lastNuiFocusKeepInputState = false

    _G.IsEntityPlayingAnim = function(entity, dict, name, flag)
        if (CS_STORIES.ACTIVE and dict == 'cellphone@' and name == 'cellphone_text_in') then
            return true
        else
            return originalIsEntityPlayingAnim(entity, dict, name, flag)
        end
    end

    _G.SetNuiFocusKeepInput = function(state)
        lastNuiFocusKeepInputState = state

        if (not CS_STORIES.ACTIVE) then
            originalSetNuiFocusKeepInput(state)
        end
    end

    AddEventHandler('cs-stories:onVideoOn', function()
        -- Triggered when the player has opened Stories' camera.

        originalSetNuiFocusKeepInput(true) -- Allow control to pass through NUI.

        CreateThread(function()
            local renderId = GetMobilePhoneRenderId()

            while (CS_STORIES.ACTIVE) do
                -- Hide HUD and allow mouse controls. 
                EnableControlAction(0, 1, true)
                EnableControlAction(0, 2, true)
                HideHudAndRadarThisFrame()
                SetDrawOrigin(0.0, 0.0, 0.0, 0)
                DisableControlAction(0, 199, true)
                DisableControlAction(0, 200, true)
                SetTextRenderId(renderId)
                Wait(0)
            end

            SetTextRenderId(1)
        end)
    end)

    AddEventHandler('cs-stories:onVideoOff', function()
        -- Triggered when the player has closed Stories' camera.
        originalSetNuiFocusKeepInput(lastNuiFocusKeepInputState)
    end)

    AddEventHandler('cs-stories:onStoryAdded', function(data)
        -- A story was added by a player, could be us or could be someone else.
        -- You can use this event to perform a notification for example if you want players to see a story was uploaded.
    end)

    AddEventHandler('cs-stories:onStoryDeleted', function(data)
        -- A story was deleted (using the internal delete method).
        -- You can use this event to perform a notification for example if you want players to see a story was deleted.
    end)

    AddEventHandler('cs-stories:onStoryUpload', function(data)
        -- A story was uploaded by this player.
        TriggerEvent('cs-stories:high-phone:notify', 'Your story has been uploaded!', 3500)
    end)

    AddEventHandler('cs-stories:onStoryUploadFailed', function(data)
        -- A story upload by this player failed.
        TriggerEvent('cs-stories:high-phone:notify', 'Your story upload failed, please try again!', 3500)
    end)

    AddEventHandler('cs-stories:onStoryDeleteOutcome', function(tempId, outcome)
        -- A story was deleted by this player (using the application interface).

        if (outcome == 'success') then
            TriggerEvent('cs-stories:high-phone:notify', 'You deleted story #' .. tempId .. '!', 3500)
        elseif (outcome == 'no_permissions') then
            TriggerEvent('cs-stories:high-phone:notify', 'You don\'t have permissions to delete story #' .. tempId .. '!', 3500)
        elseif (outcome == 'no_story') then
            TriggerEvent('cs-stories:high-phone:notify', 'Story #' .. tempId .. ' could not be found!', 3500)
        end
    end)

    RegisterNetEvent('cs-stories:high-phone:notify', function(message, timeoutMs)
        SendNUIMessage({
            type = 'cs-stories:high-phone:notify',
            message = message,
            timeoutMs = timeoutMs
        })
    end)

    CreateThread(function()
        CS_STORIES.SetKeyLabels(false) -- Setting this to true will label all the buttons with their respective keys.
        CS_STORIES.SetHandleRightClickAsBack(false) -- If your phone goes "back" when right clicking then set this to true, otherwise it should be false.

        while (true) do
            Wait(250)

            local talkingNow = NetworkIsPlayerTalking(PlayerId()) -- If you are using an external VoIP you will need to update the function here to one that returns when the player is talking.

            if (talking ~= talkingNow) then
                talking = talkingNow

                SendNUIMessage({
                    type = 'cs-stories:talking',
                    state = talking
                })
            end

            if ((PhoneData and phoneOpen ~= PhoneData.isOpen) or (Phoneopen and phoneOpen ~= Phoneopen)) then
                phoneOpen = (PhoneData and PhoneData.isOpen) or Phoneopen or false

                if (not phoneOpen) then
                    CS_STORIES.Close() -- Calling this when your phone closes, to make sure cs-stories also closes with it. If you do not want this behavior just comment this line.
                end
            end
        end
    end)

    -- "cs-stories:notify" is a client event that you can use to show native GTA notifications. It is used by default for cs-stories notifications.

    -- Hook Exports

    --[[
        You can use CS_STORIES.ACTIVE within the phone cs-stories is hooked on to determinate whether the video camera is active.
        It is a useful check especially in animation loops to prevent animation glitches.
    ]]
end
