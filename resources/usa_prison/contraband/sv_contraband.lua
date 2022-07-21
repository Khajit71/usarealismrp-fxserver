local CONTRABAND_SPAWN_LOCATIONS = {
    {x = 1745.5032958984, y = 2475.34375, z = 45.740684509277}, -- Recreational
    {x = 1742.6292724609, y = 2482.1037597656, z = 45.74068069458}, -- gym
    {x = 1765.6309814453, y = 2501.8024902344, z = 45.740730285645}, -- cell 1
    {x = 1762.4069824219, y = 2499.8969726563, z = 45.740730285645}, -- cell 2
    {x = 1759.5927734375, y = 2498.1472167969, z = 45.740772247314}, -- cell 3
    {x = 1752.7866210938, y = 2494.3823242188, z = 45.740772247314}, -- cell 4
    {x = 1762.2183837891, y = 2499.8291015625, z = 49.693046569824}, -- cell 8
    {x = 1759.0733642578, y = 2498.0134277344, z = 49.693046569824}, -- cell 9
    {x = 1755.9298095703, y = 2496.1977539063, z = 49.693099975586}, -- cell 10
    {x = 1752.7834472656, y = 2494.3818359375, z = 49.693050384521}, -- cell 11
    {x = 1763.6691894531, y = 2473.564453125, z = 45.740779876709}, -- cell 15
    {x = 1766.814453125, y = 2475.3803710938, z = 45.74072265625}, -- cell 16
    {x = 1779.3951416016, y = 2482.642578125, z = 45.740718841553}, -- cell 20
    {x = 1760.5242919922, y = 2471.7487792969, z = 49.693046569824}, -- cell 21
    {x = 1763.6657714844, y = 2473.564453125, z = 49.693046569824}, -- cell 22
    {x = 1766.8143310547, y = 2475.3803710938, z = 49.693050384521}, -- cell 23
    {x = 1779.3912353516, y = 2482.6430664063, z = 49.693103790283}, -- cell 27
    {x = 1777.7565917969, y = 2546.3142089844, z = 45.6731300354}, -- cafeteria
    {x = 1772.4805908203, y = 2568.90234375, z = 45.729835510254}, -- medbay 1
    {x = 1761.5767822266, y = 2599.4794921875, z = 45.729858398438}, -- medbay 2
    {x = 1758.3262939453, y = 2539.177734375, z = 43.585456848145}, -- Yard 1
    {x = 1711.7225341797, y = 2546.9284667969, z = 43.58540725708}, -- Yard 2
    {x = 1739.0952148438, y = 2539.5688476563, z = 43.585399627686}, -- Yard 3
    {x = 1773.3715820313, y = 2558.3989257813, z = 45.586494445801}, -- Yard 4
    {x = 1689.3334960938, y = 2552.2509765625, z = 45.56485748291}, -- Yard 5
}

for i = 1, #CONTRABAND_SPAWN_LOCATIONS do
    CONTRABAND_SPAWN_LOCATIONS[i].z = CONTRABAND_SPAWN_LOCATIONS[i].z - 0.85
end

local CONTRABAND_ITEMS = {
    { name = 'Advanced Pick', type = 'misc', price = 150, legality = 'illegal', quantity = 1, weight = 7, objectModel = "prop_tool_screwdvr03", doNotAutoRemove = true},
    { name = "Broken Bottle", type = "weapon", hash = -102323637, price = 75, legality = "illegal", quantity = 1, weight = 15, objectModel = "ng_proc_beerbottle_01a" },
    { name = "Shiv", type = "weapon", hash = GetHashKey("WEAPON_SHIV"), price = 50, legality = "illegal", quanity = 1, weight = 5, objectModel = "w_me_shiv"},
    { name = "Cell Phone", price = 650, type = "misc", quantity = 1, legality = "legal", weight = 5, objectModel = "prop_npc_phone_02" }
}

local ITEM_SPAWN_INTERVAL = 1

local ITEM_SPAWN_CHANCE = 0.17

local DEBUG_MODE = false

-- randomly have a chance of spawning one of the contraband items at one of the contraband locations every ITEM_SPAWN_INTERVAL hours
Citizen.CreateThread(function()
    while true do
        local lastCheckTime = os.time()
        while os.difftime(os.time(), lastCheckTime) < ITEM_SPAWN_INTERVAL * 60 * 60 do
            Wait(1)
        end
        if math.random() <= ITEM_SPAWN_CHANCE then
            -- add dropped item
            local contrabandItemToDrop = CONTRABAND_ITEMS[math.random(#CONTRABAND_ITEMS)]
            local contrabandSpawnLocation = CONTRABAND_SPAWN_LOCATIONS[math.random(#CONTRABAND_SPAWN_LOCATIONS)]
            contrabandItemToDrop.uuid = exports.globals:generateID()
            contrabandItemToDrop.coords = contrabandSpawnLocation
            TriggerEvent("interaction:addDroppedItem", contrabandItemToDrop)
            if DEBUG_MODE then
                print("dropping item:\n" .. exports.globals:dump(contrabandItemToDrop))
            end
        end
        Wait(1)
    end
end)
