-- Hitbox Detector Script

-- Game constants
local ballSize = 3.5

-- Function to get a player's hitbox size
local function getHitboxSize(player)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            local hitbox = humanoid.Hitbox
            if hitbox then
                return hitbox.Size.X
            end
        end
    end
    return nil
end

-- Function to check if a player is using a hitbox expander
local function isHitboxExpander(player)
    local hitboxSize = getHitboxSize(player)
    if hitboxSize and hitboxSize > ballSize then
        return true
    end
    return false
end

-- Function to display hitbox size
local function displayHitboxSize(player)
    local hitboxSize = getHitboxSize(player)
    if hitboxSize then
        print(player.Name .. "'s hitbox size: " .. hitboxSize)
    end
end

-- Loop through all players and check for hitbox expanders
while true do
    for _, player in pairs(game.Players:GetPlayers()) do
        if isHitboxExpander(player) then
            displayHitboxSize(player)
        end
    end
    wait(1) -- Check every second
end
