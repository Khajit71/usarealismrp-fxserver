local DISCORD_NAME = "USARRP • Discord Logs"
local DISCORD_IMAGE = "https://i.imgur.com/3ynbItb.jpeg" -- default is FiveM logo

AddEventHandler('erp_adminmenu:discord', function(name, message, color, webhook) sendToDiscord(name, message, color, webhook) end)

function sendToDiscord(name, message, color, webhook)
    local embed = {
        {
            ["color"] = color or "16082267",
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = embed, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
end

exports('sendToDiscord', sendToDiscord) -- exports['erp_adminmenu']:sendToDiscord(name, message, color, webhook)