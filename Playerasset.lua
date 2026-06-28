local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- The item we're checking for: https://www.roblox.com/catalog/PLACEHOLDER_ASSET_ID/PLACEHOLDER_ASSET_NAME
local ASSET_ID = PLACEHOLDER_ASSET_ID -- Replace with the actual asset ID you want to check for
local ASSET_NAME = "PLACE HOLDER NAME" -- Replace with the actual name of the asset if desired

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