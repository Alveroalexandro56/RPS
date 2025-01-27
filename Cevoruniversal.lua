-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local MinimizeButton = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local ScrollingFrame = Instance.new("ScrollingFrame")
local isMinimized = false -- Tracks minimize state

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Main Frame
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.Position = UDim2.new(0.5, -200, 0.65, -300)
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

-- Toggles and Button Creator
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

-- Features: Fly
local flying = false
local bodyVelocity
createButton("Fly", function(state)
    flying = state
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local root = character:FindFirstChild("HumanoidRootPart")
    if state and root then
        bodyVelocity = Instance.new("BodyVelocity", root)
        bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVelocity.Velocity = Vector3.zero
        -- Fly Movement Buttons
        createButton("Fly Up", function(upState)
            bodyVelocity.Velocity = upState and Vector3.new(0, 50, 0) or Vector3.zero
        end)
        createButton("Fly Down", function(downState)
            bodyVelocity.Velocity = downState and Vector3.new(0, -50, 0) or Vector3.zero
        end)
    elseif bodyVelocity then
        bodyVelocity:Destroy()
    end
end)

-- Features: Noclip
local noclip = false
createButton("Noclip", function(state)
    noclip = state
    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
    while noclip do
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        wait()
    end
end)

-- Example: Add Other Features Below
createButton("Speed Hack", function(state)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = state and 100 or 16
    end
end)

createButton("Super Jump", function(state)
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.JumpPower = state and 200 or 50
    end
end)
