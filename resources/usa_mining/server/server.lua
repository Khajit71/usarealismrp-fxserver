math.randomseed(os.time())

local common = {
    {name = "Aluminum", type = "misc", price = 175, legality = "legal", quantity = 1, weight = 5.0},
    {name = "Copper", type = "misc", price = 125, legality = "legal", quantity = 1, weight = 10.0},
    {name = "Iron", type = "misc", price = 200, legality = "legal", quantity = 1, weight = 15.0},
    {name = "Rock", type = "weapon", price = 50, hash = GetHashKey("WEAPON_ROCK"), weight = 5.0, quantity = 1 },
}

local rare = {
    {name = "Diamond", type = "misc", price = 950, legality = "legal", quantity = 1, weight = 25.0},
    {name = "Gold", type = "misc", price = 750, legality = "legal", quantity = 1, weight = 35.0},
}

RegisterServerEvent('mining:doesUserHaveCorrectItems')
AddEventHandler('mining:doesUserHaveCorrectItems', function()
    local char = exports["usa-characters"]:GetCharacter(source)
    if char.hasItem('Pick Axe') then
        TriggerClientEvent("mining:startMining", source)
    else
        TriggerClientEvent("usa:notify", source, "You do not have the sufficient tools to mine!")
    end
end)

RegisterServerEvent('mining:giveUserMiningGoods')
AddEventHandler('mining:giveUserMiningGoods', function(securityToken)
    if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), source, securityToken) then
		return false
	end
    local char = exports["usa-characters"]:GetCharacter(source)
    local gotSomething = math.random() <= 0.75
    if gotSomething then
        local gotARareItem = math.random() <= 0.25
        if gotARareItem then
            giveCharItem(char, source, "rare")
        else 
            giveCharItem(char, source, "common")
        end
    else
        TriggerClientEvent("usa:notify", source, "You didn't find anything!")
    end
end)

RegisterServerEvent('mining:sellMinedItems')
AddEventHandler('mining:sellMinedItems', function()
    local char = exports["usa-characters"]:GetCharacter(source)
    for i = 1, #common do
        if char.hasItem(common[i].name) then
            char.giveMoney(common[i].price)
            char.removeItem(common[i].name)
            TriggerClientEvent("usa:notify", source, "You Sold " .. common[i].name .. " for $" .. common[i].price)
        end
    end
    for j = 1, #rare do
        if char.hasItem(rare[j]) then
            char.giveMoney(rare[j].price)
            char.removeItem(rare[j])
            TriggerClientEvent("usa:notify", source, "You Sold " .. rare[j].name .. " for $" .. rare[j].price)
        end
    end
    if char.hasItem("Panther") then
        TriggerClientEvent("usa:notify", source, "Wow!! A panther jewel!!", "Buyer: Wow!! A panther jewel!!")
        local pantherReward = math.random(50000, 100000)
        TriggerClientEvent("usa:notify", source, "Reward: $" .. exports.globals:comma_value(pantherReward))
        char.giveMoney(pantherReward)
        char.removeItem("Panther", 1)
    end
end)

function giveCharItem(char, src, type)
    local item = nil
    if type == "rare" then
        item = rare[math.random(#rare)]
    elseif type == "common" then
        item = common[math.random(#common)]
    end
    if item then
        if char.canHoldItem(item) then
            char.giveItem(item)
            TriggerClientEvent("usa:notify", src, "You found (" .. item.quantity .. "x) " .. item.name)
        else
            TriggerClientEvent("usa:notify", src, "Inventory full")
        end
    end
end
