local Dialogue_System = require(script:GetCustomProperty("Dialogue_System"))

local corehaven_dialogue_theme = script:GetCustomProperty("corehaven_dialogue_theme")
local corehaven_choices_theme = script:GetCustomProperty("corehaven_choices_theme")
local animal_crossing_dialogue_theme = script:GetCustomProperty("animal_crossing_dialogue_theme")
local animal_crossing_choices_theme = script:GetCustomProperty("animal_crossing_choices_theme")
local persona_dialogue_theme = script:GetCustomProperty("persona_dialogue_theme")
local persona_choices_theme = script:GetCustomProperty("persona_choices_theme")
local basic_dialogue_theme = script:GetCustomProperty("basic_dialogue_theme")
local basic_choices_theme = script:GetCustomProperty("basic_choices_theme")
local simple_dialogue_theme = script:GetCustomProperty("simple_dialogue_theme")
local simple_choice_theme = script:GetCustomProperty("simple_choice_theme")

local seen_meat_list = false
local nya_has_not_greeted = true
local nya_joke_1_not_played = true
local nya_joke_2_not_played = true

local local_player = Game.GetLocalPlayer()

Dialogue_System.Events.on("dialogue_trigger_interacted", function(event_id, conversation)
	if(conversation:get_name() == "Tobs" or conversation:get_name() == "blueclairey") then
		Dialogue_System.set_dialogue_template(animal_crossing_dialogue_theme)
		Dialogue_System.set_choice_template(animal_crossing_choices_theme)
	elseif(conversation:get_name() == "Buck") then
		Dialogue_System.set_dialogue_template(persona_dialogue_theme)
		Dialogue_System.set_choice_template(persona_choices_theme)
	elseif(conversation:get_name() == "Scav") then
		Dialogue_System.set_dialogue_template(corehaven_dialogue_theme)
		Dialogue_System.set_choice_template(corehaven_choices_theme)
	else
		Dialogue_System.set_dialogue_template(simple_dialogue_theme)
		Dialogue_System.set_choice_template(simple_choice_theme)
	end
end)

Dialogue_System.register_callback("seen_meat_list", function()
	return seen_meat_list
end)

Dialogue_System.register_callback("has_market_pass", function()
	if(local_player:GetResource("market_pass") == 1) then
		return true
	end

	return false
end)

Dialogue_System.register_callback("nya_has_not_greeted", function()
	return nya_has_not_greeted
end)

Dialogue_System.register_callback("nya_joke_1_not_played", function()
	return nya_joke_1_not_played
end)

Dialogue_System.register_callback("nya_joke_2_not_played", function()
	return nya_joke_2_not_played
end)

Events.Connect("nya_has_greeted", function()
	nya_has_not_greeted = false
end)

Events.Connect("nya_joke_1_played", function()
	nya_joke_1_not_played = false
end)

Events.Connect("nya_joke_2_played", function()
	nya_joke_2_not_played = false
end)

Events.Connect("seen_meat_list", function()
	seen_meat_list = true
end)

Events.Connect("purchase_beets", function()
	Events.BroadcastToServer("purchase_beets")
end)

Events.Connect("purchase_carrots", function()
	Events.BroadcastToServer("purchase_carrots")
end)

Events.Connect("purchase_fish", function()
	Events.BroadcastToServer("purchase_fish")
end)

Events.Connect("purchase_market_pass", function()
	Events.BroadcastToServer("purchase_market_pass")
end)