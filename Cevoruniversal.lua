-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local ScrollingFrame = Instance.new("ScrollingFrame")
local isMinimized = false -- Tracks minimize state

-- Parent GUI to Player
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.Position = UDim2.new(0.5, -200, 0.65, -300) -- Lowered GUI position
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Active = true
MainFrame.Draggable = true

-- Title Label
TitleLabel.Parent = MainFrame
TitleLabel.Text = "Cevor Universal"
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextScaled = true

-- Minimize Button
MinimizeButton.Parent = TitleLabel
MinimizeButton.Text = "-"
MinimizeButton.Size = UDim2.new(0, 50, 0, 50)
MinimizeButton.Position = UDim2.new(1, -55, 0, 0)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextScaled = true

-- Minimize/Maximize Functionality
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 400, 0, 50)
        MinimizeButton.Text = "+"
    else
        MainFrame.Size = UDim2.new(0, 400, 0, 600)
        MinimizeButton.Text = "-"
    end
end)

-- Scrolling Frame
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, 0, 1, -50)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 50)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0) -- Adjusted canvas size
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- UI Layout for Buttons
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Toggle Buttons Storage
local toggledFeatures = {}

-- Function to Create Buttons
function createButton(name, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = ScrollingFrame
    Button.Text = name
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    Button.Font = Enum.Font.SourceSansBold
    Button.TextScaled = true

    toggledFeatures[name] = false
    Button.MouseButton1Click:Connect(function()
        toggledFeatures[name] = not toggledFeatures[name]
        callback(toggledFeatures[name])
        Button.BackgroundColor3 = toggledFeatures[name] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(100, 100, 100)
    end)
end

-- Feature Functions
createButton("ESP", function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Alveroalexandro56/RPS/refs/heads/main/Hihlightplayers.lua"))()
    else
        print("ESP disabled")
    end
end)

createButton("Speed Hack", function(state)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = state and 100 or 16
    end
end)

createButton("Super Jump", function(state)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpPower = state and 200 or 50
    end
end)

createButton("Invisibility", function(state)
    for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = state and 1 or 0
        end
    end
end)

createButton("Fly", function(state)
    local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if state and root then
        root.Anchored = true
        root.CFrame = root.CFrame + Vector3.new(0, 50, 0)
    else
        root.Anchored = false
    end
end)

createButton("Low Gravity", function(state)
    workspace.Gravity = state and 50 or 196.2
end)

createButton("Teleport Forward", function(state)
    if state then
        local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = root.CFrame + root.CFrame.LookVector * 50
        end
    end
end)

createButton("Spin", function(state)
    while state and toggledFeatures["Spin"] do
        local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(15), 0)
        end
        wait(0.1)
    end
end)

createButton("Heal", function(state)
    local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid and state then
        humanoid.Health = humanoid.MaxHealth
    end
end)

createButton("Bright Mode", function(state)
    game.Lighting.Brightness = state and 5 or 1
end)

createButton("Teleport Up", function(state)
    if state then
        local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = root.CFrame + Vector3.new(0, 100, 0)
        end
    end
end)
