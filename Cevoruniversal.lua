local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local ScrollingFrame = Instance.new("ScrollingFrame")
local isMinimized = false

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -300)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Active = true
MainFrame.Draggable = true

-- Title Label
TitleLabel.Parent = MainFrame
TitleLabel.Text = "Cevor universal"
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

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    MainFrame.Size = isMinimized and UDim2.new(0, 400, 0, 50) or UDim2.new(0, 400, 0, 600)
    MinimizeButton.Text = isMinimized and "+" or "-"
end)

-- Scrolling Frame
ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, 0, 1, -50)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 50)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- UI Layout
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Fly Feature
local flying = false
local flySpeed = 50
local bodyVelocity

function toggleFly(state)
    local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    flying = state
    if flying then
        bodyVelocity = Instance.new("BodyVelocity", root)
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.zero
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.W then
                bodyVelocity.Velocity = root.CFrame.LookVector * flySpeed
            elseif input.KeyCode == Enum.KeyCode.S then
                bodyVelocity.Velocity = -root.CFrame.LookVector * flySpeed
            elseif input.KeyCode == Enum.KeyCode.Space then
                bodyVelocity.Velocity = Vector3.new(0, flySpeed, 0)
            elseif input.KeyCode == Enum.KeyCode.LeftShift then
                bodyVelocity.Velocity = Vector3.new(0, -flySpeed, 0)
            end
        end)
    else
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
    end
end

-- Button Creator
local toggledFeatures = {}
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

-- Adding Features
createButton("Fly", toggleFly)
createButton("Speed Hack", function(state)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = state and 100 or 16
    end
end)
createButton("ESP", function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Alveroalexandro56/RPS/refs/heads/main/Hihlightplayers.lua"))()
    else
        -- Cannot directly disable the script; refresh/restart recommended
        print("ESP toggle requires reset to disable.")
    end
end)
createButton("Super Jump", function(state)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpPower = state and 200 or 50
    end
end)
createButton("Low Gravity", function(state)
    workspace.Gravity = state and 50 or 196.2
end)
createButton("Spin", function(state)
    while state and toggledFeatures["Spin"] do
        local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(15), 0)
        end
        wait(0.1)
    end
end)
createButton("Teleport Forward", function(state)
    if state then
        local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = root.CFrame + root.CFrame.LookVector * 50
        end
    end
end)
createButton("Heal", function(state)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid and state then
        humanoid.Health = humanoid.MaxHealth
    end
end)
createButton("Bright Mode", function(state)
    game.Lighting.Brightness = state and 5 or 1
end)
createButton("Teleport Up", function(state)
    if state then
        local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = root.CFrame + Vector3.new(0, 100, 0)
        end
    end
end)
createButton("Invisibility", function(state)
    for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = state and 1 or 0
        end
    end
end)
