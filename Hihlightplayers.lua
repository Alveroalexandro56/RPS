local Players = game:GetService("Players")

-- Function to create a highlight for the entire player's character
local function createHighlight(player)
    local character = player.Character
    if not character then return end

    -- Create a highlight and make it visible to everyone
    local highlight = Instance.new("Highlight")
    highlight.Adornee = character -- Highlight the entire character model
    highlight.FillColor = Color3.new(1, 0, 0) -- Red color
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = character
end

-- Function to handle new characters
local function onCharacterAdded(character)
    local player = Players:GetPlayerFromCharacter(character)
    if player then
        createHighlight(player)
    end
end

-- Connect to player events
Players.PlayerAdded:Connect(function(player)
    if player.Character then
        createHighlight(player)
    end
    player.CharacterAdded:Connect(onCharacterAdded)
end)

-- Handle already-existing players when the game starts
for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        createHighlight(player)
    end
    player.CharacterAdded:Connect(onCharacterAdded)
end

-- Refresh highlights every 1 second and print "Refreshed"
while true do
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            -- Remove old highlights before creating new ones
            for _, child in pairs(player.Character:GetChildren()) do
                if child:IsA("Highlight") then
                    child:Destroy()
                end
            end
            createHighlight(player)
        end
    end
    print("Refreshed Cevor ESP")
    wait(1)
end
