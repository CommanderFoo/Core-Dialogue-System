local reset_storage = script.parent.parent.parent:GetCustomProperty("reset_storage")

Game.playerLeftEvent:Connect(function(player)
	local data = {

		coins = player:GetResource("coin"),
		market_pass = player:GetResource("market_pass"),
		beet = player:GetResource("beet"),
		carrot = player:GetResource("carrot"),
		fish = player:GetResource("fish"),

	}

	if(reset_storage) then
		data = {}
	end

	Storage.SetPlayerData(player, data)
end)

-- Ideally you would load resources from player storage.
-- In this example I just set the amount of coins.

Events.ConnectForPlayer("ready", function(player)
	if(reset_storage) then
		player:SetResource("coins", 5000)
	else
		local data = Storage.GetPlayerData(player)

		if(data.coin) then
			player:SetResource("coins", data.coin)
		else
			player:SetResource("coins", 5000)
		end
		
		if(data.market_pass == 1) then
			player:SetResource("market_pass", 1)
		end

		player:SetResource("beet", data.beet or 0)
		player:SetResource("carrot", data.carrot or 0)
		player:SetResource("fish", data.fish or 0)
	end
end)

Events.ConnectForPlayer("purchase_market_pass", function(player)
	if(player:GetResource("coins") >= 300) then
		player:SetResource("market_pass", 1)
		player:RemoveResource("coins", 300)
	end
end)

Events.ConnectForPlayer("purchase_beets", function(player)
	if(player:GetResource("coins") >= 25) then
		player:AddResource("beet", 10)
		player:RemoveResource("coins", 25)
	end
end)

Events.ConnectForPlayer("purchase_carrots", function(player)
	if(player:GetResource("coins") >= 45) then
		player:AddResource("carrot", 10)
		player:RemoveResource("coins", 45)
	end
end)

Events.ConnectForPlayer("purchase_fish", function(player)
	if(player:GetResource("coins") >= 100) then
		player:AddResource("fish", 5)
		player:RemoveResource("coins", 100)
	end
end)