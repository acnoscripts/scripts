local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/acnoscripts/scripts/main/ui'))()

local Window = Rayfield:CreateWindow({
	Name = "Acnoware - Elemental Battlegrounds",
	LoadingTitle = "Acnoware",
	LoadingSubtitle = "Loading Elemental Battlegrounds..",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Acnoware"
	},
        Discord = {
        	Enabled = false,
        	Invite = "dvxYgk3u3F", -- The Discord invite code, do not include discord.gg/
        	RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "Sirius Hub",
		Subtitle = "Key System",
		Note = "Join the discord (discord.gg/sirius)",
		FileName = "SiriusKey",
		SaveKey = true,
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = "Hello"
	}
})

-- above all loading stuff and window below actual script --


-- tabs

local PlayersTab = Window:CreateTab("Players")

local ClientTab = Window:CreateTab("Client")

local TeleportsTab = Window:CreateTab("Teleports") 

local AutofarmsTab = Window:CreateTab("Autofarms")

local CreditsTab = Window:CreateTab("Credits")

-- Players below

local targetplr = ""

local Section = PlayersTab:CreateSection("Teleports")

local Toggle = PlayersTab:CreateToggle({
	Name = "Loopgoto Target",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		loopgotoenabled = false
    if Value then
        loopgotoenabled = true
    else
        loopgotoenabled = false
    end
    while loopgotoenabled == true do
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[targetplr].Character.HumanoidRootPart.CFrame
            	wait(0.1)
        	if loopgotoenabled == false then
            	break
        	end
    	end
	end,
})

local Button2 = PlayersTab:CreateButton({
	Name = "Teleport to Target",
	Callback = function()
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[targetplr].Character.HumanoidRootPart.CFrame
	end,
})

local Section = PlayersTab:CreateSection("Miscellaneous")

local Input = PlayersTab:CreateInput({
	Name = "Target player",
	PlaceholderText = "Username",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		targetplr = Text
		print("Target:", targetplr)
	end,
})


-- Players above



-- Client below

local Section = ClientTab:CreateSection("Client")

local hpthresh = 350

local Toggle = ClientTab:CreateToggle({
	Name = "Antikill",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		antikillenabled = false
    if Value then
        antikillenabled = true
    else
        antikillenabled = false
    end
    while antikillenabled == true do
    	if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health < hpthresh then
    		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1535.9978, 38.5621071, 1003.93378)
        end
        	wait(0.1)
        	if antikillenabled == false then
            	break
        	end
    	end
	end,
})

local Slider = ClientTab:CreateSlider({
	Name = "Antikill Health Threshold",
	Range = {1, 1500},
	Increment = 5,
	Suffix = "",
	CurrentValue = 350,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		hpthresh = Value
	end,
})

local Section = ClientTab:CreateSection("Speedhack")

local Toggle = ClientTab:CreateToggle({
	Name = "Speedhack",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
	    if Value then
        local Player = game:service'Players'.LocalPlayer;
        local Mouse = Player:GetMouse();
    
        game:service'RunService'.RenderStepped:connect(function()
            if (game:service'UserInputService'):IsKeyDown(Enum.KeyCode.W) then
                Player.Character.HumanoidRootPart.CFrame =
                Player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3);
            end;
        end);
    else
        local Player = game:service'Players'.LocalPlayer;
        local Mouse = Player:GetMouse();
    
        game:service'RunService'.RenderStepped:connect(function()
            if (game:service'UserInputService'):IsKeyDown(Enum.KeyCode.W) then
                Player.Character.HumanoidRootPart.CFrame =
                Player.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3);
            end;
        end);
    end
	end,
})

local Section = ClientTab:CreateSection("Jumppower")

local canchangejumppower = false

local Toggle = ClientTab:CreateToggle({
	Name = "Enable Jumppower",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if Value then
        	canchangejumppower = true
    	else
        	canchangejumppower = false
        	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    	end
	end,
})

local Slider = ClientTab:CreateSlider({
	Name = "Jumppower",
	Range = {50, 200},
	Increment = 5,
	Suffix = "",
	CurrentValue = 50,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		if canchangejumppower == true then
			game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
		end
	end,
})

-- Main above 

-- Teleports below

local Section = TeleportsTab:CreateSection("Teleports")

local Button2 = TeleportsTab:CreateButton({
	Name = "Safezone",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1535.9978, 38.5621071, 1003.93378)
	end,
})

local Button3 = TeleportsTab:CreateButton({
	Name = "Map Center",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-681.434204, 5.08547068, 894.086365)
	end,
})

local Button4 = TeleportsTab:CreateButton({
	Name = "Mini Arena",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-957.93634, 155.837097, 2022.96448)
	end,
})

local Button5 = TeleportsTab:CreateButton({
	Name = "Invisible Sky Part",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-960.859375, 1385.36426, 1127.6073)
	end,
})

-- Teleports above

-- Autofarms below

local Section = AutofarmsTab:CreateSection("Autofarms")

local Toggle = AutofarmsTab:CreateToggle({
	Name = "Autofarm Diamonds",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		gemsenabled = false
    if Value then
        gemsenabled = true
        print("Gem farm started!")
    else
        gemsenabled = false
        print("Gem farm stopped!")
    end
    while gemsenabled == true do
        local Object = game:GetService("Workspace")[".Ignore"][".ServerEffects"]:WaitForChild("Diamond")
            	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Object.CFrame
            	wait(0.1)
        	if gemsenabled == false then
            	break
        	end
    	end
	end,
})

local Toggle = AutofarmsTab:CreateToggle({
	Name = "Autofarm Shards",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		shardenabled = false
    if Value then
        shardenabled = true
        print("Shard farm started!")
    else
        shardenabled = false
        print("Shard farm stopped!")
    end
    while shardenabled == true do
        local Object = game:GetService("Workspace")[".Ignore"][".ServerEffects"]:WaitForChild("Shard")
            	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Object.CFrame
            	wait(0.1)
        	if shardenabled == false then
            	break
        	end
    	end
	end,
})

local Section = AutofarmsTab:CreateSection("Miscellaneous")

local Toggle = AutofarmsTab:CreateToggle({
	Name = "Safe mode",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		safeenabled = false
    if Value then
        safeenabled = true
    else
        safeenabled = false
    end
    print(safeenabled)
    while safeenabled == true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-67.5338287, 219.486725, 2621.48853)
        wait(0.2)
        	if safeenabled == false then
            break
        end
    end
end,
})


-- Autofarms above

-- Credits tab below 

local Section = CreditsTab:CreateSection("Credits")

local Label = CreditsTab:CreateLabel("Acno - Script Hub")

local Label = CreditsTab:CreateLabel("shlex, iRay - UI Library")

local Section = CreditsTab:CreateSection("Discord")

local Button2 = CreditsTab:CreateButton({
	Name = "Copy Discord Invite",
	Callback = function()
		setclipboard("https://discord.gg/dvxYgk3u3F")
	end,
})


-- Credits tab above
