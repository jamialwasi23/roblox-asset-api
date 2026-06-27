local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- The item we're checking for: https://www.roblox.com/catalog/30331986/Midnight-Shades
local ASSET_ID = 30331986
local ASSET_NAME = "Midnight Shades"

local function onPlayerAdded(player)
	local success, ownsAsset = pcall(function()
		return MarketplaceService:PlayerOwnsAssetAsync(player, ASSET_ID)
	end)

	if not success then
		warn("Error checking if " .. player.Name .. " owns " .. ASSET_NAME .. ": " .. tostring(ownsAsset))
		return
	end

	if ownsAsset then
		print(player.Name .. " owns " .. ASSET_NAME)
	else
		print(player.Name .. " doesn't own " .. ASSET_NAME)
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)