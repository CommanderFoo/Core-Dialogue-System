-- Ideally you would load resources from player storage.
-- In this example I just set the amount of coins.

Events.ConnectForPlayer("ready", function(player)
	player:SetResource("coin", 1000)
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