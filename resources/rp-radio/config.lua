radioConfig = {
    Controls = {
        Activator = { -- Open/Close Radio
            Name = "INPUT_REPLAY_START_STOP_RECORDING_SECONDARY", -- Control name
            Key = 289, -- F2
        },
        Secondary = {
            Name = "INPUT_SPRINT",
            Key = 21, -- Left Shift
            Enabled = true, -- Require secondary to be pressed to open radio with Activator
        },
        Toggle = { -- Toggle radio on/off
            Name = "INPUT_CONTEXT", -- Control name
            Key = 51, -- E
        },
        IncreaseVolume = { -- Increase Volume
            Name = "INPUT_CELLPHONE_UP", -- Control name
            Key = 172, -- Right Arrow
            Pressed = false,
        },
        DecreaseVolume = { -- Decrease Volume
            Name = "INPUT_CELLPHONE_DOWN", -- Control name
            Key = 173, -- Right Arrow
            Pressed = false,
        },
        Increase = { -- Increase Frequency
            Name = "INPUT_CELLPHONE_RIGHT", -- Control name
            Key = 175, -- Right Arrow
            Pressed = false,
        },
        Decrease = { -- Decrease Frequency
            Name = "INPUT_CELLPHONE_LEFT", -- Control name
            Key = 174, -- Left Arrow
            Pressed = false,
        },
        Input = { -- Choose Frequency
            Name = "INPUT_FRONTEND_ACCEPT", -- Control name
            Key = 201, -- Enter
            Pressed = false,
        },
        Broadcast = {
            Name = "INPUT_VEH_PUSHBIKE_SPRINT", -- Control name
            Key = 137, -- Caps Lock
        },
        ToggleClicks = { -- Toggle radio click sounds -- todo: will need to change keys?
            Name = "INPUT_SELECT_WEAPON", -- Control name
            Key = 37, -- Tab
        }
    },
    Frequency = {
        Private = { -- List of private frequencies
            [1] = true, -- Make 1 a private frequency
            [2] = true,
            [3] = true,
            [4] = true,
            [5] = true,
            [6] = true,
            [7] = true,
            [8] = true,
            [9] = true,
            [10] = true,
            [11] = true,
            [12] = true,
            [13] = true,
        }, -- List of private frequencies
        Current = 1, -- Don't touch
        CurrentIndex = 1, -- Don't touch
        Min = 1, -- Minimum frequency
        Max = 1000, -- Max number of frequencies
        List = {}, -- Frequency list, Don't touch
        Access = {}, -- List of frequencies a player has access to
    },
    AllowRadioWhenClosed = true, -- Allows the radio to be used when not open for civs (uses shoulder mic animation)
    DEFAULT_VOLUME = 1.0
}
