--Used rayfield link is https://docs.sirius.menu/rayfield
if game.PlaceId == 142823291 then

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Cevor MM2 V2",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Cevor MM2 V2",
   LoadingSubtitle = "by ScripterBob",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Cevor MM2 Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Cevor MM2 V2",
      Subtitle = "Key System",
      Note = "Key Link is https://cevormm2key.carrd.co/", -- Use this to tell the user how to get a key
      FileName = "true", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/06jeUSnL", "https://pastebin.com/raw/UEuXVrir"} -- List of keys that will be accepted by the system
   }
})

local MainTab = Window:CreateTab("🏠 Main", nil) -- Create a main tab
local Section = MainTab:CreateSection("Main") -- Create a section under the main tab

Rayfield:Notify({
   Title = "Loading Cevor MM2",
   Content = "Loaded Succefully",
   Duration = 6.5,
   Image = nil,
})

-- Create the button in the main tab
local Button = MainTab:CreateButton({
   Name = "Fly Gui",
   Callback = function()
      -- OP Fly Script

      -- Keybinds : X To Fly Or press the button

      -- Instances:
      local ScreenGui = Instance.new("ScreenGui")
      local Frame = Instance.new("Frame")
      local TextLabel = Instance.new("TextLabel")
      local TextLabel_2 = Instance.new("TextLabel")
      local TextButton = Instance.new("TextButton")

      --Properties:
      ScreenGui.Parent = game.CoreGui
      Frame.Parent = ScreenGui
      Frame.BackgroundColor3 = Color3.fromRGB(24, 255, 51)
      Frame.BorderColor3 = Color3.fromRGB(255, 0, 4)
      Frame.BorderSizePixel = 15
      Frame.Position = UDim2.new(0.0575905927, 0, 0.653887033, 0)
      Frame.Size = UDim2.new(0, 295, 0, 152)
      Frame.Active = true
      Frame.Draggable = true

      TextLabel.Parent = Frame
      TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel.BackgroundTransparency = 1.000
      TextLabel.BorderColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel.BorderSizePixel = 0
      TextLabel.Size = UDim2.new(0, 295, 0, 63)
      TextLabel.Font = Enum.Font.SciFi
      TextLabel.Text = "OP FLY SCRIPT"
      TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel.TextScaled = true
      TextLabel.TextSize = 14.000
      TextLabel.TextStrokeTransparency = 0.000
      TextLabel.TextWrapped = true

      TextLabel_2.Parent = Frame
      TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_2.BackgroundTransparency = 1.000
      TextLabel_2.BorderColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_2.BorderSizePixel = 0
      TextLabel_2.Position = UDim2.new(0, 0, 0.342105269, 0)
      TextLabel_2.Size = UDim2.new(0, 295, 0, 18)
      TextLabel_2.Font = Enum.Font.SciFi
      TextLabel_2.Text = "(May Not Work On All Games)"
      TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextLabel_2.TextScaled = true
      TextLabel_2.TextSize = 14.000
      TextLabel_2.TextStrokeTransparency = 0.000
      TextLabel_2.TextWrapped = true

      TextButton.Parent = Frame
      TextButton.BackgroundColor3 = Color3.fromRGB(8, 0, 255)
      TextButton.Position = UDim2.new(0.159322038, 0, 0.552631557, 0)
      TextButton.Size = UDim2.new(0, 200, 0, 50)
      TextButton.Font = Enum.Font.SciFi
      TextButton.Text = "Click Me To Fly"
      TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextButton.TextScaled = true
      TextButton.TextSize = 14.000
      TextButton.TextStrokeTransparency = 0.000
      TextButton.TextWrapped = true

      -- Fly script
      TextButton.MouseButton1Down:connect(function()
         local plr = game.Players.LocalPlayer
         local mouse = plr:GetMouse()

         local player = plr

         if workspace:FindFirstChild("Core") then
            workspace.Core:Destroy()
         end

         local Core = Instance.new("Part")
         Core.Name = "Core"
         Core.Size = Vector3.new(0.05, 0.05, 0.05)

         spawn(function()
            Core.Parent = workspace
            local Weld = Instance.new("Weld", Core)
            Weld.Part0 = Core
            Weld.Part1 = player.Character.LowerTorso
            Weld.C0 = CFrame.new(0, 0, 0)
         end)

         workspace:WaitForChild("Core")

         local torso = workspace.Core
         local flying = true
         local speed = 10
         local keys = {a = false, d = false, w = false, s = false}
         local e1, e2

         local function start()
            local pos = Instance.new("BodyPosition", torso)
            local gyro = Instance.new("BodyGyro", torso)
            pos.Name = "EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.cframe = torso.CFrame

            repeat
               wait()
               player.Character.Humanoid.PlatformStand = true
               local new = gyro.cframe - gyro.cframe.p + pos.position
               if not keys.w and not keys.s and not keys.a and not keys.d then
                  speed = 5
               end
               if keys.w then
                  new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                  speed = speed + 0
               end
               if keys.s then
                  new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                  speed = speed + 0
               end
               if keys.d then
                  new = new * CFrame.new(speed, 0, 0)
                  speed = speed + 0
               end
               if keys.a then
                  new = new * CFrame.new(-speed, 0, 0)
                  speed = speed + 0
               end
               if speed > 10 then
                  speed = 5
               end
               pos.position = new.p
               if keys.w then
                  gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(speed * 0), 0, 0)
               elseif keys.s then
                  gyro.cframe = workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(math.rad(speed * 0), 0, 0)
               else
                  gyro.cframe = workspace.CurrentCamera.CoordinateFrame
               end
            until flying == false
            if gyro then gyro:Destroy() end
            if pos then pos:Destroy() end
            flying = false
            player.Character.Humanoid.PlatformStand = false
            speed = 10
         end

         e1 = mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then
               flying = false
               e1:disconnect()
               e2:disconnect()
               return
            end
            if key == "w" then
               keys.w = true
            elseif key == "s" then
               keys.s = true
            elseif key == "a" then
               keys.a = true
            elseif key == "d" then
               keys.d = true
            elseif key == "x" then
               if flying == true then
                  flying = false
               else
                  flying = true
                  start()
               end
            end
         end)

         e2 = mouse.KeyUp:connect(function(key)
            if key == "w" then
               keys.w = false
            elseif key == "s" then
               keys.s = false
            elseif key == "a" then
               keys.a = false
            elseif key == "d" then
               keys.d = false
            end
         end)

         start()
      end)
   end,
})

local KillAllButton = MainTab:CreateButton({
   Name = "Kill All",
   Callback = function()
      -- Kill All script
      local teleportedPlayers = {} -- Store players that have already been teleported to

      local function killAll()
         while true do
            wait(2)  -- Wait for 2 seconds before teleporting

            -- Get a list of all players
            local players = {}
            for _, player in pairs(game.Players:GetPlayers()) do
                -- Make sure the player is not the local player and hasn't been teleported yet
                if player ~= game.Players.LocalPlayer and not table.find(teleportedPlayers, player) then
                    table.insert(players, player)
                end
            end

            -- If there are players to teleport to, select a random one
            if #players > 0 then
                -- Get a random player
                local randomPlayer = players[math.random(1, #players)]
                local character = randomPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    -- Teleport to the random player
                    game.Players.LocalPlayer.Character:MoveTo(character.HumanoidRootPart.Position)

                    -- Mark this player as teleported
                    table.insert(teleportedPlayers, randomPlayer)
                end
            else
                -- Stop the loop when all players have been teleported to
                break
            end
         end
      end

      -- Start the kill all functionality
      killAll()
   end,
})

local Button = MainTab:CreateButton({
   Name = "ESP",
   Callback = function()
   local function createESP(player)
    -- Create ESP part
    local espPart = Instance.new("BillboardGui")
    espPart.Adornee = player.Character:WaitForChild("Head")
    espPart.Parent = player.Character
    espPart.Size = UDim2.new(0, 200, 0, 50)
    espPart.StudsOffset = Vector3.new(0, 2, 0) -- Adjust the offset above the player's head

    local label = Instance.new("TextLabel")
    label.Parent = espPart
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0
    label.TextScaled = true

    -- Check the player's team and set the ESP color
    if player.Team then
        if player.Team.Name == "Red" then
            label.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Red team
        elseif player.Team.Name == "Blue" then
            label.TextColor3 = Color3.fromRGB(0, 0, 255)  -- Blue team
        else
            label.TextColor3 = Color3.fromRGB(255, 255, 0)  -- Default color (Yellow for non-team players)
        end
    else
        label.TextColor3 = Color3.fromRGB(255, 255, 0)  -- Default color for players without a team
    end

    -- Display player name
    label.Text = player.Name

    -- Update ESP if the player moves
    player.Character:WaitForChild("HumanoidRootPart").Changed:Connect(function()
        espPart.Adornee = player.Character:WaitForChild("Head") -- Reattach if necessary
    end)
end

-- Add ESP to all players
for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character and player.Character:FindFirstChild("Head") then
        createESP(player)
    end
end

-- Add ESP to players who join
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if character:FindFirstChild("Head") then
            createESP(player)
        end
    end)
end)

   end,
})

local Tab = Window:CreateTab("Random Stuff", Nil) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Yarhm",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "XhubMM2",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
   end,
})
