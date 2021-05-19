local YOOTIL = require(script:GetCustomProperty("YOOTIL"))
local Dialogue_System = require(script:GetCustomProperty("Dialogue_System"))

-- All the properties that are on the "Dialogue System" folder.

local root = script:GetCustomProperty("root"):WaitForObject()
local show_warnings = root:GetCustomProperty("show_warnings")
local pulse_next_close_buttons = root:GetCustomProperty("pulse_next_close_buttons")
local animate_letters = root:GetCustomProperty("animate_letters")
local animate_words = root:GetCustomProperty("animate_words")
local ui_container = script:GetCustomProperty("ui_container"):WaitForObject()
local dialogue_template = root:GetCustomProperty("dialogue_template")
local choice_template = root:GetCustomProperty("choice_template")
local bark_template = root:GetCustomProperty("bark_template")
local letter_speed = root:GetCustomProperty("letter_speed")
local word_speed = root:GetCustomProperty("word_speed")
local click_sound = root:GetCustomProperty("click_sound"):WaitForObject()
local type_sound = root:GetCustomProperty("type_sound"):WaitForObject()
local play_click_sound = root:GetCustomProperty("play_click_sound")
local play_type_sound = root:GetCustomProperty("play_type_sound")
local min_speaker_width = root:GetCustomProperty("min_speaker_width")

local database = root:GetCustomProperty("database"):WaitForObject()

-- Store the previous state of the cursor and reticle so that we
-- make sure to return it back to what it was when a dialogue is exited.

local cursor_visible = UI.IsCursorVisible()
local intereact_ui = UI.CanCursorInteractWithUI()
local reticle_visble = UI.IsReticleVisible()

local local_player = Game.GetLocalPlayer()

Dialogue_System.tweens = {}
Dialogue_System.show_warnings = show_warnings

-- Setup the options for the system.

Dialogue_System.set_pulse_buttons(pulse_next_close_buttons)
Dialogue_System.set_animate_letters(animate_letters)
Dialogue_System.set_animate_words(animate_words)
Dialogue_System.set_ui_container(ui_container)
Dialogue_System.set_dialogue_template(dialogue_template)
Dialogue_System.set_choice_template(choice_template)
Dialogue_System.set_bark_template(bark_template)
Dialogue_System.set_letter_speed(letter_speed)
Dialogue_System.set_click_sound(click_sound, play_click_sound)
Dialogue_System.set_type_sound(type_sound, play_type_sound)
Dialogue_System.set_min_speaker_width(min_speaker_width)

-- This is where the magic happens, and is basically the entry point into
-- where the conversations are built up.

Dialogue_System.set_database(database).build()

-- We want to allow the player to click to speed up the dialogue letter animation
-- Dialogues can hook up to the event, so we can just trigger it here.

local_player.bindingPressedEvent:Connect(function(_, binding)
	if(binding == YOOTIL.Input.left_button) then
		Dialogue_System.Events.trigger("left_button_clicked")
	end
end)

-- When a dialogue is triggered, we enable the UI systems so the player can intereact with
-- the mouse.

Events.Connect("dialogue_system_enable_ui_interact", function(can_interact, show_cursor, hide_reticle)
	if(can_interact) then
		UI.SetCanCursorInteractWithUI(true)
	end

	if(show_cursor) then
		UI.SetCursorVisible(true)
	end

	if(hide_reticle) then
		UI.SetReticleVisible(false)
	end
end)

-- Tick the tweens.  Right now we only tween Barks.

function Tick(dt)
	if(Dialogue_System.Tweens.active_bark ~= nil) then
		Dialogue_System.Tweens.active_bark:tween(dt)
	end
end

-- Handle resetting the UI state to what it was before the dialogue
-- was opened.

Events.Connect("dialogue_system_disable_ui_interact", function()
	UI.SetCanCursorInteractWithUI(intereact_ui)
	UI.SetCursorVisible(cursor_visible)
	UI.SetReticleVisible(reticle_visble)
end)