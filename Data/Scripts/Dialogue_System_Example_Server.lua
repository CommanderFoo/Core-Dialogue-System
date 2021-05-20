local reset_storage = script.parent.parent.parent:GetCustomProperty("reset_storage")

Game.playerLeftEvent:Connect(function(player)
	local data = {

		coin = player:GetResource("coin"),
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
		player:SetResource("coin", 5000)
	else
		local data = Storage.GetPlayerData(player)

		if(data.coin) then
			player:SetResource("coin", data.coin)
		else
			player:SetResource("coin", 5000)
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
	if(player:GetResource("coin") >= 300) then
		player:SetResource("market_pass", 1)
		player:RemoveResource("coin", 300)
	end
end)

Events.ConnectForPlayer("purchase_beets", function(player)
	if(player:GetResource("coin") >= 25) then
		player:AddResource("beet", 10)
		player:RemoveResource("coin", 25)
	end
end)

Events.ConnectForPlayer("purchase_carrots", function(player)
	if(player:GetResource("coin") >= 45) then
		player:AddResource("carrot", 10)
		player:RemoveResource("coin", 45)
	end
end)

Events.ConnectForPlayer("purchase_fish", function(player)
	if(player:GetResource("coin") >= 100) then
		player:AddResource("fish", 5)
		player:RemoveResource("coin", 100)
	end
end)