-- Highlight all players with dark blue outline and red fill color

-- Function to apply highlight to a character
local function applyHighlight(character)
    -- Check if the highlight already exists to avoid duplicates
    if character:FindFirstChild("Highlight") then
        return
    end

    -- Create a new Highlight instance
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight" -- Optional, for easier management
    highlight.Adornee = character
    highlight.FillColor = Color3.fromRGB(255, 255, 255) -- Red fill color
    highlight.OutlineColor = Color3.fromRGB(254, 254, 254) -- Dark blue outline color
    highlight.FillTransparency = 0.5 -- Semi-transparent fill (adjust as needed)
    highlight.OutlineTransparency = 0 -- Fully visible outline
    highlight.Parent = character
end

-- Function to highlight all players
local function highlightAllPlayers()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character then
            applyHighlight(player.Character)
        end

        -- Listen for the character being added
        player.CharacterAdded:Connect(function(character)
            applyHighlight(character)
        end)
    end
end

-- Run the highlight function for all players
highlightAllPlayers()

-- Listen for new players joining
game.Players.PlayerAdded:Connect(function(newPlayer)
    -- Apply highlight when the character is added
    newPlayer.CharacterAdded:Connect(function(character)
        applyHighlight(character)
    end)
end)
