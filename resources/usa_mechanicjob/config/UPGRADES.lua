UPGRADES = {
    ["topspeed4"] = {
        id = "topspeed4",
        displayName = "Top Speed Tune",
        increaseAmount = 20.0,
        doSync = true,
        requiresItem = "Top Speed Tune"
    },
    ["nitrokit"] = {
        id = "nitrokit",
        displayName = "NOS Install Kit",
        requiresItem = "NOS Install Kit"
    },
    ["nitrobottle1"] = {
        id = "nitrobottle1",
        displayName = "NOS Bottle (Stage 1)",
        requiresItem = "NOS Bottle (Stage 1)",
        requiresUpgrades = {
            "nitrokit"
        },
        maxCapacity = 4000,
        postInstall = function(vehPlate)
            local done = false
            MechanicHelper.db.getDocumentById("vehicle-nitro-fuel", vehPlate, function(doc)
                if doc then
                    MechanicHelper.db.updateDocument("vehicle-nitro-fuel", vehPlate, {nitroFuelLevel = UPGRADES["nitrobottle1"].maxCapacity}, function(ok) done = true end)
                else
                    MechanicHelper.db.createDocumentWithId("vehicle-nitro-fuel", {nitroFuelLevel = UPGRADES["nitrobottle1"].maxCapacity, maxCapacity = UPGRADES["nitrobottle1"].maxCapacity}, vehPlate, function(ok) done = true end)
                end
            end)
            while not done do
                Wait(1)
            end
        end
    },
    ["nitrobottle2"] = {
        id = "nitrobottle2",
        displayName = "NOS Bottle (Stage 2)",
        requiresItem = "NOS Bottle (Stage 2)",
        requiresUpgrades = {
            "nitrokit"
        },
        maxCapacity = 8000,
        postInstall = function(vehPlate)
            local done = false
            MechanicHelper.db.getDocumentById("vehicle-nitro-fuel", vehPlate, function(doc)
                if doc then
                    MechanicHelper.db.updateDocument("vehicle-nitro-fuel", vehPlate, {nitroFuelLevel = UPGRADES["nitrobottle2"].maxCapacity}, function(ok) done = true end)
                else
                    MechanicHelper.db.createDocumentWithId("vehicle-nitro-fuel", {nitroFuelLevel = UPGRADES["nitrobottle2"].maxCapacity, maxCapacity = UPGRADES["nitrobottle2"].maxCapacity}, vehPlate, function(ok) done = true end)
                end
            end)
            while not done do
                Wait(1)
            end
        end
    },
    ["nitrobottle3"] = {
        id = "nitrobottle3",
        displayName = "NOS Bottle (Stage 3)",
        requiresItem = "NOS Bottle (Stage 3)",
        requiresUpgrades = {
            "nitrokit"
        },
        maxCapacity = 16000,
        postInstall = function(vehPlate)
            local done = false
            MechanicHelper.db.getDocumentById("vehicle-nitro-fuel", vehPlate, function(doc)
                if doc then
                    MechanicHelper.db.updateDocument("vehicle-nitro-fuel", vehPlate, {nitroFuelLevel = UPGRADES["nitrobottle3"].maxCapacity}, function(ok) done = true end)
                else
                    MechanicHelper.db.createDocumentWithId("vehicle-nitro-fuel", {nitroFuelLevel = UPGRADES["nitrobottle3"].maxCapacity, maxCapacity = UPGRADES["nitrobottle3"].maxCapacity}, vehPlate, function(ok) done = true end)
                end
            end)
            while not done do
                Wait(1)
            end
        end
    },
    ["nitrogauge"] = {
        id = "nitrogauge",
        displayName = "NOS Gauge",
        requiresItem = "NOS Gauge",
        requiresUpgrades = {
            "nitrokit"
        }
    },
    ["custom-radio"] = {
        id = "custom-radio",
        displayName = "Custom Radio",
        requiresItem = "Custom Radio",
        postInstall = function(vehPlate)
            exports.rcore_radiocar:GiveRadioToCar(vehPlate, function() print("added radio to car") end)
        end
    },
    ["manual-conversion-kit"] = {
        id = "manual-conversion-kit",
        displayName = "Manual Conversion Kit",
        requiresItem = "Manual Conversion Kit",
        postInstall = function(vehPlate)
            print("car converted to manual!")
        end
    }
}