local YOOTIL = require(script:GetCustomProperty("YOOTIL"))
local Dialogue_System = require(script:GetCustomProperty("Dialogue_System"))

local root = script:GetCustomProperty("root"):WaitForObject()
local show_warnings = root:GetCustomProperty("show_warnings")
local pulse_next_close_buttons = root:GetCustomProperty("pulse_next_close_buttons")
local ui_container = script:GetCustomProperty("ui_container"):WaitForObject()
local dialogue_template = root:GetCustomProperty("dialogue_template")
local choice_template = root:GetCustomProperty("choice_template")
local bark_template = root:GetCustomProperty("bark_template")

local database = script:GetCustomProperty("database"):WaitForObject()

local cursor_visible = UI.IsCursorVisible()
local intereact_ui = UI.CanCursorInteractWithUI()
local reticle_visble = UI.IsReticleVisible()

local local_player = Game.GetLocalPlayer()

Dialogue_System.tweens = {}
Dialogue_System.show_warnings = show_warnings
Dialogue_System.set_pulse_buttons(pulse_next_close_buttons)
Dialogue_System.set_ui_container(ui_container)
Dialogue_System.set_dialogue_template(dialogue_template)
Dialogue_System.set_choice_template(choice_template)
Dialogue_System.set_bark_template(bark_template)
Dialogue_System.set_database(database).build()

local_player.bindingPressedEvent:Connect(function(_, binding)
	if(binding == YOOTIL.Input.left_button) then
		Dialogue_System.Events.trigger("left_button_clicked")
	end
end)

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

function Tick(dt)
	if(Dialogue_System.Tweens.active_bark ~= nil) then
		Dialogue_System.Tweens.active_bark:tween(dt)
	end
end

Dialogue_System.register_callback("test", function()
	print("hi from test")
	return false
end)

Dialogue_System.register_callback("test2", function()
	print("hi from test2")
	return true
end)

Events.Connect("dialogue_system_disable_ui_interact", function()
	UI.SetCanCursorInteractWithUI(intereact_ui)
	UI.SetCursorVisible(cursor_visible)
	UI.SetReticleVisible(reticle_visble)
end)