local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local coin_amount = script:GetCustomProperty("coin_amount"):WaitForObject()
local beet_amount = script:GetCustomProperty("beet_amount"):WaitForObject()
local carrot_amount = script:GetCustomProperty("carrot_amount"):WaitForObject()
local fish_amount = script:GetCustomProperty("fish_amount"):WaitForObject()

local local_player = Game.GetLocalPlayer()

-- When the resource changes on the server, we listen for it and 
-- update the UI for the player.  Simple.

local_player.resourceChangedEvent:Connect(function(p, n, a)
	if(n == "coins") then
		coin_amount.text = YOOTIL.Utils.number_format(a)
	elseif(n == "beet") then
		beet_amount.text = YOOTIL.Utils.number_format(a)
	elseif(n == "carrot") then
		carrot_amount.text = YOOTIL.Utils.number_format(a)
	elseif(n == "fish") then
		fish_amount.text = YOOTIL.Utils.number_format(a)
	end
end)