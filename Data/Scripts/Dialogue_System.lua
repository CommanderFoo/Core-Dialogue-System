-- In here we just handle setting up some global stuff for the system.
-- I'm not a fan of using _G, so I opt for a different system by using
-- a "Common" object that gets required.

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_System_Common = require(script:GetCustomProperty("Dialogue_System_Common"))
local Dialogue_Conversation = require(script:GetCustomProperty("Dialogue_Conversation_Class"))

local Dialogue_System = {

	database = nil,
	conversations = {},
	Events = Dialogue_System_Events,
	show_warnings = true

}

Dialogue_System.register_callback = function(key, func)
	Dialogue_System_Common.callbacks[key] = func
end

Dialogue_System.unregister_callback = function(key)
	if(Dialogue_System.callbacks[key]) then
		Dialogue_System_Common.callbacks[key] = nil
	end
end

Dialogue_System.Events.on("warning", function(evt_id, msg)
	Dialogue_System.warn(msg)
end)

Dialogue_System.set_ui_container = function(container)
	if(Object.IsValid(container)) then
		Dialogue_System_Common.ui_container = container
	end
end

Dialogue_System.set_animate_letters = function(v)
	Dialogue_System_Common.animate_letters = v
end

Dialogue_System.set_animate_words = function(v)
	Dialogue_System_Common.animate_words = v
end

Dialogue_System.set_pulse_buttons = function(v)
	Dialogue_System_Common.pulse_buttons = v
end

Dialogue_System.set_dialogue_template = function(v)
	Dialogue_System_Common.dialogue_template = v
end

Dialogue_System.set_choice_template = function(v)
	Dialogue_System_Common.choice_template = v
end

Dialogue_System.set_click_sound = function(v, p)
	Dialogue_System_Common.can_play_click_sound = p
	Dialogue_System_Common.click_sound = v
end

Dialogue_System.set_type_sound = function(v, p)
	Dialogue_System_Common.can_play_type_sound = p
	Dialogue_System_Common.type_sound = v
end

Dialogue_System.set_min_speaker_width = function(v)
	Dialogue_System_Common.min_speaker_width = math.max(0, v)
end

Dialogue_System.set_indicator_template = function(v)
	Dialogue_System_Common.indicator_template = v
end

Dialogue_System.set_indicator_offset = function(v)
	Dialogue_System_Common.indicator_offset = v
end

Dialogue_System.set_click_progress = function(v)
	Dialogue_System_Common.click_progress = v
end

Dialogue_System.set_letter_speed = function(v)
	if(v <= 0) then
		v = 0.01
	end

	Dialogue_System_Common.letter_speed = v
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
		Dialogue_System.conversations[#Dialogue_System.conversations + 1] = Dialogue_Conversation:new(con)
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