local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_System_Tweens = require(script:GetCustomProperty("Dialogue_System_Tweens"))
local Dialogue_Conversation = require(script:GetCustomProperty("Dialogue_Conversation_Class"))

local Dialogue_System = {

	database = nil,
	conversations = {},
	Events = Dialogue_System_Events,
	show_warnings = true,
	pulse_buttons = false,
	ui_container = nil,
	dialogue_template = nil,
	choice_template = nil,
	bark_template = nil,
	Tweens = Dialogue_System_Tweens,
	callbacks = {}

}

Dialogue_System.register_callback = function(key, func)
	Dialogue_System.callbacks[key] = func
end

Dialogue_System.unregister_callback = function(key)
	if(Dialogue_System.callbacks[key]) then
		Dialogue_System.callbacks[key] = nil
	end
end

Dialogue_System.Events.on("warning", function(msg)
	Dialogue_System.warn(msg)
end)

Dialogue_System.set_ui_container = function(container)
	if(Object.IsValid(container)) then
		Dialogue_System.ui_container = container
	end
end

Dialogue_System.set_pulse_buttons = function(t)
	Dialogue_System.pulse_buttons = t
end

Dialogue_System.set_dialogue_template = function(t)
	Dialogue_System.dialogue_template = t
end

Dialogue_System.set_choice_template = function(t)
	Dialogue_System.choice_template = t
end

Dialogue_System.set_bark_template = function(t)
	Dialogue_System.bark_template = t
end

Dialogue_System.set_database = function(db)
	if(Object.IsValid(db)) then
		Dialogue_System.database = db
	end

	return Dialogue_System
end

Dialogue_System.build = function()
	if(not Object.IsValid(Dialogue_System.database)) then
		Dialogue_System.warn("Database folder is not valid.")
		
		return
	end

	local db_children = Dialogue_System.database:GetChildren()

	for index, con in ipairs(db_children) do
		Dialogue_System.conversations[#Dialogue_System.conversations + 1] = Dialogue_Conversation:new(con, {
				
			ui_container = Dialogue_System.ui_container, 
			dialogue_template = Dialogue_System.dialogue_template,
			dialogue_choices_template = Dialogue_System.dialogue_choices_template,
			choice_template = Dialogue_System.choice_template,
			bark_template = Dialogue_System.bark_template,
			pulse_buttons = Dialogue_System.pulse_buttons,
			callbacks = Dialogue_System.callbacks

		})
	end

	if(#db_children == 0) then
		Dialogue_System.warn("There are no conversations setup in the Database folder.")
	end
end

Dialogue_System.warn = function(msg)
	if(Dialogue_System.show_warnings) then
		warn("Dialogue System: " .. msg)
	end
end

return Dialogue_System