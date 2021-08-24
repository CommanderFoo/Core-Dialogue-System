-- Players who join are added to this table, and removed on leaving.

local players = {}

-- Store event references for cleanup later

local evts = {}

-- On player join, add them to the table with the current settings

evts[#evts + 1] = Game.playerJoinedEvent:Connect(function(player)
	if(not players[player.id]) then
		players[player.id] = {

			movement = player.movementControlMode,
			look = player.lookControlMode,
			jump = player.maxJumpCount,
			crouch = player.isCrouchEnabled,
			mount = player.canMount

		}
	end
end)

-- Remove them from the table

evts[#evts + 1] = Game.playerLeftEvent:Connect(function(player)
	if(players[player.id] ~= nil) then
		players[player.id] = nil
	end
end)

-- Disables player movement

evts[#evts + 1] = Events.ConnectForPlayer("dialogue_system_disable_player", function(player, player_look, player_movement, player_mount, player_crouch, player_jump, player_abilities)
	if(player_look) then
		player.lookControlMode = LookControlMode.NONE
	end

	if(player_movement) then
		player.movementControlMode = MovementControlMode.NONE
	end

	if(player_jump) then
		player.maxJumpCount = 0
	end

	if(player_crouch) then
		player.isCrouchEnabled = false
	end

	if(player_mount) then
		player.canMount = false
	end

	if(player_abilities) then
		for _, a in ipairs(player:GetAbilities()) do
			a.isEnabled = false
		end
	end
end)

-- Enables player movement

evts[#evts + 1] = Events.ConnectForPlayer("dialogue_system_enable_player", function(player)
	if(players[player.id] ~= nil) then
		player.movementControlMode = players[player.id].movement
		player.lookControlMode = players[player.id].look
		player.maxJumpCount = players[player.id].jump
		player.isCrouchEnabled = players[player.id].crouch
		player.canMount = players[player.id].mount

		for _, a in ipairs(player:GetAbilities()) do
			a.isEnabled = true
		end
	end
end)

-- Cleanup of events

script.destroyEvent:Connect(function()
	for k, e in ipairs(evts) do
		if(e.isConnected) then
			e:Disconnect()
		end
	end
end)