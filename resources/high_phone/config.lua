-- DO NOT TOUCH
Config = {}
Config.Languages = {}

-- Main config starts here!
Config.Language = "en"
Config.SharedObject = ""
Config.PhoneModel = "prop_npc_phone_02"

Config.ItemRequired = true -- Does the player need a phone item in their inventory to be able to use it
Config.PhoneItem = "Cell Phone" -- Phone item spawn name, can be a table: {"phone1", "phone2"}
Config.AllowUsageInWater = false -- Set to true if you want to allow opening the phone in water. [The camera might be buggy]

-- Only uncomment this CLIENT-SIDE function if you want to add your own checks if the player is able to open the phone.
--[[Config.CanOpen = function()
    return true
end]]

Config.OpenKey = 288 -- Default key: P, you can find keys here: https://docs.fivem.net/docs/game-references/controls/
Config.DisableControlAction = true -- Disable the other actions that OpenKey does? For example P opens pause menu, prevent that from happening or not?
-- OR you can use key mapping (recommended, better for performance)
Config.EnableKeyMapping = true -- set to true if you want to allow players to change their phone opening button.
Config.DefaultKeyMap = "F1" -- https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.AllowInPauseMenu = false -- Allow using the phone in pause menu or not?

Config.AirdropDistance = 5.0 -- Closest player max distance to share contacts/etc.

Config.MaxRecipients = 10 -- How many recipients can be added to a new mail?
Config.MailLimit = 100 -- How many conversations to load for mail app
Config.MailFormat = "@usarrp.com" -- Email address format [suffix]
Config.MailStackingTime = 24 -- In hours, how much time has to be between each mail with the same subject to not save it in the same conversation? [This is some sort of an anti-spam]

Config.SyncedFlashlightDistance = 30 -- How near will flashlights get synced?
Config.SyncedFlashlightUpdateFrequency = 50 -- in ms, how often will other player's flashlight locations will be synced.
Config.SyncedFlashlight = true -- set to false if you don't want to sync flashlights for all players nearby!

Config.SyncedSounds = false -- Will other players near you hear your phone notifications/incoming call sounds?
Config.SyncedSoundDistance = 10 -- How near another player you have to be to hear their phone sounds?
Config.UseHigh3D = false -- Use resource high_3dsounds? If false, will automatically use xSound. For best experience use Highrider-3DSounds
Config.High3DName = "high_3dsounds" -- Your high_3dsounds folder/resource name. Change only if using Highrider-3DSounds.
Config.UseExternalxSound = false -- Use xsound as a dependency and not the built-in xsound? [Be cautious, bugs might appear, the reason why we're using an xsound inside the phone is to remove existing bugs/adapt functions to our phone]
Config.xSoundName = "xsound" -- External xsound resource/folder name. Change only if UseHigh3D is false.
Config.xSoundPositionUpdateFrequency = 150 -- How often update the coordinates of the sound? With high_3dsounds entity system the position is updated automatically without any delays.

Config.EnableBillCancelling = false -- Enable the ability to decline bills in bank app?
Config.TransferType = 1 -- Put 1 for player ID transactions, put 2 for IBAN transactions!
Config.MoneyRequestCooldown = 5000 -- In miliseconds, 1000ms = 1 second
Config.TransferCooldown = 5000 -- In miliseconds, 1000ms = 1 second

Config.DarkGroupInviteCodeLength = 8 -- The length of a random invite code for a new dark chat group.

Config.DarkMessageLimit = 50 -- How many messages to load for dark chats

Config.MessageLimit = 50 -- How many messages to load for chats

Config.TwitterResetTimer = 30 -- In seconds, how long you have to wait between sending reset codes.
Config.TweetLimit = 20 -- How many tweets to load from the database and display on the twitter app
Config.TwitterRanks = {
    ["default"] = { -- Do not rename this rank, KEEP IT NAMED DEFAULT!
        label = "", -- What will show up when hovered on the icon?
        icon = "", -- Keep empty for no icon, use fontawesome's icons.
        iconColor = "#fff", -- Icon color, can use rgb or hex code.
        admin = false -- Can delete anyone's tweets?
    },
    ["verified"] = {
        label = "Verified", -- What will show up when hovered on the icon?
        icon = "fas fa-badge-check", -- Keep empty for no icon, use fontawesome's icons.
        iconColor = "#fff", -- Icon color, can use rgb or hex code.
        admin = false -- Can delete anyone's tweets?
    },
    ["admin"] = {
        label = "Admin", -- What will show up when hovered on the icon?
        icon = "fas fa-shield-alt", -- Keep empty for no icon, use fontawesome's icons.
        iconColor = "#fff", -- Icon color, can use rgb or hex code.
        admin = true -- Can delete anyone's tweets?
    }
}

Config.AdsLimit = 20 -- How many ads to load from the database and display on the ads app

Config.ContactCallsLimit = 20 -- How many old calls with a contact to load to show on contact info.

Config.CallsLimit = 30 -- How many old calls in phone app to load.

--[[ THIS WORKS SIMPLE, WHEN YOU CALL ONE OF THE QUICK CONTACTS EVERYONE WITH THE JOB ON DUTY/ON SERVICE WILL RECEIVE THE CALL AND ONE OF THEM WILL BE ABLE TO PICK IT UP.
   SAME GOES FOR MESSAGES, EVERYONE WILL RECEIVE THE MESSAGE THAT HAVE THE JOB OF THE CONTACT THAT YOU'VE SENT THE MESSAGE TO.
   !! SYSTEM IS AUTOMATICALLY COMPATIBLE WITH ESX_DUTY ]]
Config.JobContacts = {
    ["emergency"] = { -- People with this job will receive these calls/messages.
        name = "911", -- Shown contact name
        number = "911", -- Phone number to call to
        photo = "./media/icons/police.png", -- base64 data image or an image URL or file location OR leave empty for no image.
        preAdded = true, -- Add it to the contacts app or not? If not added [set to false], you can only call it through the phone app, or message it through the messages app.
        callable = true, -- Can you call the contact?
        attachments = true -- Can you send images as attachments to this contact?
    },
    ["mechanic"] = { -- People with this job will receive these calls/messages.
        name = "Mechanic", -- Shown contact name
        number = "01", -- Phone number to call to
        photo = "./media/icons/servicecar.png", -- base64 data image or an image URL or file location OR leave empty for no image.
        preAdded = true, -- Add it to the contacts app or not? If not added [set to false], you can only call it through the phone app, or message it through the messages app.
        callable = true, -- Can you call the contact?
        attachments = true -- Can you send images as attachments to this contact?
    },
    ["taxi"] = { -- People with this job will receive these calls/messages.
        name = "Taxi", -- Shown contact name
        number = "02", -- Phone number to call to
        photo = "./media/icons/taxicar.png", -- base64 data image or an image URL or file location OR leave empty for no image.
        preAdded = true, -- Add it to the contacts app or not? If not added [set to false], you can only call it through the phone app, or message it through the messages app.
        callable = true, -- Can you call the contact?
        attachments = true -- Can you send images as attachments to this contact?
    },
    ["lawyer"] = { -- People with this job will receive these calls/messages.
        name = "Lawyer", -- Shown contact name
        number = "03", -- Phone number to call to
        photo = "./media/icons/law.png", -- base64 data image or an image URL or file location OR leave empty for no image.
        preAdded = true, -- Add it to the contacts app or not? If not added [set to false], you can only call it through the phone app, or message it through the messages app.
        callable = true, -- Can you call the contact?
        attachments = false -- Can you send images as attachments to this contact?
    },
    ["doctor"] = { -- People with this job will receive these calls/messages.
        name = "Pillbox Doctor", -- Shown contact name
        number = "04", -- Phone number to call to
        photo = "./media/icons/pillbox.jpg", -- base64 data image or an image URL or file location OR leave empty for no image.
        preAdded = true, -- Add it to the contacts app or not? If not added [set to false], you can only call it through the phone app, or message it through the messages app.
        callable = true, -- Can you call the contact?
        attachments = true -- Can you send images as attachments to this contact?
    }
}

--[[ ADVERTISMENTS APP CATEGORIES - YOU CAN ADD AS MANY CATEGORIES AS YOU WANT HERE! 
    ALSO IF YOU'RE ADDING MORE CATEGORIES, MAKE SURE THESE NUMBERS IN THE BRACKETS ARE IN AN ASCENDING ORDER]]
Config.AdsCategories = {
    -- Default category [invisible, as its the main category]
    [1] = { -- DO NOT CHANGE THIS CATEGORY JOB NAME, THIS IS THE DEFAULT/MAIN CATEGORY
        label = "Individual", -- Category label
        job = "default", -- DO NOT CHANGE THIS CATEGORY JOB NAME, THIS IS THE DEFAULT/MAIN CATEGORY
        jobGrade = 0, -- People with this or higher job grade will post all ads to this category.
        color = "", -- RGBA or hex code
        info = { -- Detailed information of the category
            title = "All Advertisments",
            description = "All job advertisments and individual advertisments"
        },
        allowPosting = true -- Allow posting ads in the default category for people without any of the jobs?
    },
    -- Shown categories, ADD ALL NEW CATEGORIES BELOW THIS COMMENT ONLY!
    [2] = {
        label = "State", -- Category label
        job = "emergency", -- People with this job name will post all ads to this category.
        jobGrade = 0, -- People with this or higher job grade will post all ads to this category.
        icon = "media/icons/policecar.png", -- Icon of the category button
        color = "#0494c3", -- RGBA or hex code
        info = { -- Detailed information of the category
            title = "Police Advertisments",
            description = "You can see all emergency service advertisments here"
        }
    },
    [3] = { 
        label = "Taxi", -- Category label
        job = "taxi", -- People with this job name will post all ads to this category.
        jobGrade = 0, -- People with this or higher job grade will post all ads to this category.
        icon = "media/icons/taxicar.png", -- Icon of the category button
        color = "#eba313", -- RGBA or hex code
        info = { -- Detailed information of the category
            title = "Taxi Advertisments",
            description = "You can see all taxi advertisments here"
        }
    },
    [4] = {
        label = "Mechanic", -- Category label
        job = "mechanic", -- People with this job name will post all ads to this category.
        jobGrade = 0, -- People with this or higher job grade will post all ads to this category.
        icon = "media/icons/servicecar.png", -- Icon of the category button
        color = "#525252", -- RGBA or hex code
        info = { -- Detailed information of the category
            title = "Service Advertisments",
            description = "You can see all mechanic advertisments here"
        }
    },
    [5] = {
        label = "Legal", -- Category label
        job = {"judge", "lawyer"}, -- People with this job name will post all ads to this category.
        jobGrade = 0, -- People with this or higher job grade will post all ads to this category.
        icon = "media/icons/law.png", -- Icon of the category button
        color = "#6b571f", -- RGBA or hex code
        info = { -- Detailed information of the category
            title = "Service Advertisments",
            description = "You can see all Legal advertisments here"
        }
    }
}