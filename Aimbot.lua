-- Aimbot Script (Client-Side)
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = game.Workspace.CurrentCamera
local closestPlayer = nil
local closestDistance = math.huge

-- Function to get the head of a player
local function getPlayerHead(targetPlayer)
    return targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head")
end

-- Function to find the nearest player
local function findNearestPlayer()
    closestPlayer = nil
    closestDistance = math.huge

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local head = getPlayerHead(otherPlayer)
            if head then
                local distance = (head.Position - player.Character.HumanoidRootPart.Position).magnitude
                if distance < closestDistance then
                    closestPlayer = otherPlayer
                    closestDistance = distance
                end
            end
        end
    end
end

-- Update the aimbot every frame
game:GetService("RunService").RenderStepped:Connect(function()
    findNearestPlayer()
    
    if closestPlayer then
        local head = getPlayerHead(closestPlayer)
        if head then
            -- Point the camera towards the player's head
            camera.CFrame = CFrame.new(camera.CFrame.Position, head.Position)
        end
    end
end)
