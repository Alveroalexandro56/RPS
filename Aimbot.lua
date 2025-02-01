local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera
local Workspace = game:GetService("Workspace")

-- Function to check if the enemy is visible (no walls blocking)
local function hasClearLineOfSight(target)
    local origin = Camera.CFrame.Position
    local direction = (target.Position - origin).Unit * (target.Position - origin).Magnitude
    local raycastParams = RaycastParams.new()

    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character} -- Ignore own character
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local result = Workspace:Raycast(origin, direction, raycastParams)
    
    return result == nil -- True if no obstacles
end

-- Function to get the closest valid enemy (not in your team, visible)
local function getClosestEnemy()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        -- Ensure player is valid, has a character, and is NOT in the same team
        if player ~= LocalPlayer and player.Team ~= nil and player.Team ~= LocalPlayer.Team then
            local character = player.Character
            if character and character:FindFirstChild("Head") then
                local head = character.Head
                local distance = (head.Position - LocalPlayer.Character.Head.Position).Magnitude
                
                -- Only consider the player if they are visible and closer than previous ones
                if distance < shortestDistance and hasClearLineOfSight(head) then
                    shortestDistance = distance
                    closestPlayer = head
                end
            end
        end
    end
    
    return closestPlayer
end

-- Locks onto the enemy's head only if visible & NOT in the same team
RunService.RenderStepped:Connect(function()
    local targetHead = getClosestEnemy()
    
    if targetHead then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
    end
end)
