-- When player joins, setup some dummy resources.

Game.playerJoinedEvent:Connect(function(player)
	player:SetResource("coin", math.random(0, 100))
	player:SetResource("level", math.random(1, 20))
	player:SetResource("cookie", 0)
end)