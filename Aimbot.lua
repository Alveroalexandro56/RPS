local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera
local Workspace = game:GetService("Workspace")

-- Function to check if the target is visible (no wall blocking)
local function hasClearLineOfSight(target)
    local origin = Camera.CFrame.Position
    local direction = (target.Position - origin).Unit * (target.Position - origin).Magnitude
    local raycastParams = RaycastParams.new()

    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

    local result = Workspace:Raycast(origin, direction, raycastParams)
    return result == nil -- Returns true if there's no obstacle
end

-- Function to get the closest enemy (not in the same team, visible)
local function getClosestEnemy()
    local closestHead = nil
    local minDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team then -- Team check
            local character = player.Character
            if character and character:FindFirstChild("Head") then
                local head = character.Head
                local distance = (head.Position - Camera.CFrame.Position).Magnitude
                
                -- Check if enemy is visible and closer than previous
                if distance < minDistance and hasClearLineOfSight(head) then
                    minDistance = distance
                    closestHead = head
                end
            end
        end
    end

    return closestHead
end

-- Lock onto enemy's head
RunService.RenderStepped:Connect(function()
    local targetHead = getClosestEnemy()
    if targetHead then
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetHead.Position)
    end
end)
