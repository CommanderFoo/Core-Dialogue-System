Game.playerJoinedEvent:Connect(function(player)
	
	-- Give random amount of resources on join so we can use
	-- this in the dialogue for the examples.

	player:SetResource("money", math.random(0, 500))
	player:SetResource("carrot", math.random(0, 50))
end)