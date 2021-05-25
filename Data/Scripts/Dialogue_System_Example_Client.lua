--[[

Ideally you would want to also think about storing the dialogue state variables.

So for example in here we handle if you can ask Tobs a question or not.  If you can
ask Tobs a question, then we update the "can_ask_tobs_question" flag so that you
can no longer ask a question.  This is stuff that should be handled by you and
not the system.

The only problem is that storage space is valuable in some games. So it's a trade
off.  If you do store flags in storage, use 0 and 1.

In this example I only handle resource storage, and Market Pass.

]]

-- To use the callbacks and events system, we need to require it.

local Dialogue_System = require(script:GetCustomProperty("Dialogue_System"))

-- All the dialogue themes and choice themes so for the demo.

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

local tobs_npc = script:GetCustomProperty("tobs_npc"):WaitForObject()
local nya_npc = script:GetCustomProperty("nya_npc"):WaitForObject()
local blue_npc = script:GetCustomProperty("blue_npc"):WaitForObject()
local scav_npc = script:GetCustomProperty("scav_npc"):WaitForObject()
local buck_npc = script:GetCustomProperty("buck_npc"):WaitForObject()

-- Randomly animations to add some life to the scene

local task = Task.Spawn(function()
	--local tobs = math.random(1, 10)
	local nya = math.random(1, 12)
	local buck = math.random(1, 10)
	local scav = math.random(1, 10)
	local blue = math.random(1, 12)

--	if(tobs >= 5) then
	--	tobs_npc:PlayAnimation("unarmed_wave")
--	end

	if(nya >= 6) then
		if(nya > 8) then
			nya_npc:PlayAnimation("unarmed_blow_kiss")
		else 
			nya_npc:PlayAnimation("unarmed_boo")
		end
	end

	if(buck >= 5) then
		if(buck > 8) then
			buck_npc:PlayAnimation("unarmed_blow_kiss")
		else 
			buck_npc:PlayAnimation("unarmed_drink")
		end
	end

	if(scav >= 5) then
		scav_npc:PlayAnimation("unarmed_ready_to_rumble")
	end

	if(blue >= 6) then
		if(blue > 8) then
			blue_npc:PlayAnimation("unarmed_love")
		else 
			blue_npc:PlayAnimation("unarmed_eat")
		end
	end
end)

task.repeatInterval = 4
task.repeatCount = -1

-- Bools for when certain dialogue has been accessed.
-- These are used to give a bit of variety to the NPCs.

local seen_meat_list = false
local nya_has_not_greeted = true
local nya_joke_1_not_played = true
local nya_joke_2_not_played = true
local can_ask_tobs_question = false

local local_player = Game.GetLocalPlayer()

-- Hook into the dialogue trigger for each NPC and change the theme based on the name of
-- the NPC.  An example of how you could allow players to choose a theme.

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
	elseif(conversation:get_name() == "Joker") then
		Dialogue_System.set_dialogue_template(basic_dialogue_theme)
		Dialogue_System.set_choice_template(basic_choices_theme)
	else
		Dialogue_System.set_dialogue_template(simple_dialogue_theme)
		Dialogue_System.set_choice_template(simple_choice_theme)
	end
end)

-- Callbacks
-- Callbacks are like events, but in this case they must return something.
-- These get called when you set the "function" or "condition" properties.
-- See the full example template, and look at the converations in the database
-- to see how they are set.

Dialogue_System.register_callback("seen_meat_list", function()
	return seen_meat_list
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

Dialogue_System.register_callback("can_ask_tobs_question", function(obj)
	return can_ask_tobs_question
end)

-- These are normal events.  The "call_event" property is what gets hooked up
-- to these below.

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

Events.Connect("ask_tobs_question", function(obj, flag)
	can_ask_tobs_question = flag
end)

-- Additional "call_event"s to handle dialogue choices
-- where the player can purchase something in this example.

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

-- Let the server know we are ready to receive.

Task.Wait()
Events.BroadcastToServer("ready")