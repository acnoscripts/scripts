local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WetCheezit/Bracket-V2/main/src.lua"))()

local Window, MainGUI = Library:CreateWindow("Acnoware - Elemental Battlegrounds")

-- Tabs 

local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("Settings")

-- Groupboxes

local Groupbox1 = Tab1:CreateGroupbox("Farms", "Left")
local Groupbox2 = Tab1:CreateGroupbox("Client", "Right")
local Groupbox3 = Tab1:CreateGroupbox("Areas", "Right")
local Groupbox4 = Tab2:CreateGroupbox("Settings", "Left")


-- v farms v --

local ExampleToggle = Groupbox1:CreateToggle("Autofarm Shards", function(state)
        shardenabled = false
    if state then
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
end)

local ExampleToggle = Groupbox1:CreateToggle("Autofarm Gems", function(state)
        gemsenabled = false
    if state then
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
end)

local ExampleToggle = Groupbox1:CreateToggle("Safe Mode", function(state)
        safeenabled = false
    if state then
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
end)

-- ^ farms ^ --



-- v client v --

local ExampleButton = Groupbox2:CreateButton("Click TP", function()
    local plr = game:GetService("Players").LocalPlayer
    local mouse = plr:GetMouse()
    
    mouse.Button1Down:connect(function()
    if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
    if not mouse.Target then return end
    plr.Character:MoveTo(Mouse.Hit.p)
    end)
    game.StarterGui:SetCore("SendNotification", {
    Title = "Acnoware"; 
    Text = "CTRL + Left Click to teleport to mouse!"; 
    Duration = 5; 
    })
end)

local ExampleToggle = Groupbox2:CreateToggle("Speedhack", function(state)
    if state then
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
end)

local ExampleToggle = Groupbox2:CreateToggle("Jumppower", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50 
    end
end)

-- ^ client ^ --


-- v areas v --

local ExampleButton = Groupbox3:CreateButton("Safezone", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1535.9978, 38.5621071, 1003.93378)
end)

local ExampleButton = Groupbox3:CreateButton("Map Center", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-681.434204, 5.08547068, 894.086365)
end)

local ExampleButton = Groupbox3:CreateButton("Mini Arena", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-957.93634, 155.837097, 2022.96448)
end)

local ExampleButton = Groupbox3:CreateButton("Invisible Sky Part", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-960.859375, 1385.36426, 1127.6073)
end)

-- ^ areas ^ --


-- v settings v --

local ExampleButton = Groupbox4:CreateButton("Destroy GUI", function()
    MainGUI:Destroy()
end)

-- ^ settings ^ --

game.StarterGui:SetCore("SendNotification", {
Title = "Acnoware"; 
Text = "Use RightCTRL to hide/show the UI!";
Duration = 5; 
})
