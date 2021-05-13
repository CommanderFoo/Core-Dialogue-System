local YOOTIL = require(script:GetCustomProperty("YOOTIL"))
local Dialogue_System = require(script:GetCustomProperty("Dialogue_System"))

local root = script:GetCustomProperty("root"):WaitForObject()
local show_warnings = root:GetCustomProperty("show_warnings")
local ui_container = script:GetCustomProperty("ui_container"):WaitForObject()
local dialogue_template = root:GetCustomProperty("dialogue_template")
local bark_template = root:GetCustomProperty("bark_template")

local database = script:GetCustomProperty("database"):WaitForObject()

local cursor_visible = UI.IsCursorVisible()
local intereact_ui = UI.CanCursorInteractWithUI()
local reticle_visble = UI.IsReticleVisible()

Dialogue_System.show_warnings = show_warnings
Dialogue_System.set_ui_container(ui_container)
Dialogue_System.set_dialogue_template(dialogue_template)
Dialogue_System.set_bark_template(bark_template)
Dialogue_System.set_database(database).build()

Dialogue_System.Events.on("conversation_started", function(conversation)
	print("NPC is talking", conversation:get_id())
end)

Dialogue_System.Events.on("dialogue_trigger_interacted", function(conversation)
	print("Trigger interacted", conversation:get_trigger())
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

Events.Connect("dialogue_system_disable_ui_interact", function()
	UI.SetCanCursorInteractWithUI(can_interact)
	UI.SetCursorVisible(show_cursor)
	UI.SetReticleVisible(reticle_visble)
end)