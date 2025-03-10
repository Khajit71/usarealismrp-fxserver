function spawnBoostVehicle(vehicleToSpawn, isTuned, licensePlate, advancedSystem, npcs, npcCoords, doorsLocked, advancedLock, class, cid, x, y, z, h)
    local modelHash = GetHashKey(vehicleToSpawn) -- Use compile-time hashes to get the hash of this model
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        -- print("VEHICLE LOADING, PLEASE WAIT") -- debug
		Wait(1)
	end

    local vehicle = CreateVehicle(modelHash, x, y, z, h, true, true)
    while not DoesEntityExist(vehicle) do
        -- print("VEHICLE DOESN'T EXIST - CHECKING AGAIN") -- debug
        Wait(1)
    end

    SetEntityHeading(vehicle, h)
    SetVehicleEngineOn(vehicle, false, false)
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleNumberPlateText(vehicle, licensePlate)
    activeVehicle = vehicle

    TriggerServerEvent("rahe-boosting:server:setEntityData", VehToNet(vehicle), cid, class, advancedLock, advancedSystem, npcs, npcCoords)

    if isTuned == 1 then
        applyVehicleTuning(vehicle)
    end

    if doorsLocked then
        SetVehicleDoorsLocked(vehicle, 2)
    end
    -- print("Boost Car Spawned") -- debug
end

function deleteBoostingVehicle(vehicleId)
    if DoesEntityExist(vehicleId) then
        DeleteEntity(vehicleId)
        -- print("VEHICLE DETECTED - NOW DELETE") -- debug
    end
    -- print("VEHICLE DELETED") -- debug
end