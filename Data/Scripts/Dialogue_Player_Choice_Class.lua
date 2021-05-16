local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))

local Player_Choice = {}

function Player_Choice:init()
	self.id = self:get_prop("id")
	self.text = self:get_prop("text")

	self.entries = {}

	if(self.id <= 0) then
		Dialogue_System_Events.trigger("\"" .. self.root.name .. "\" needs a unique ID.")

		return
	end

	self:build_tree()
end

function Player_Choice:build_tree()
	for index, entry in ipairs(self.root:GetChildren()) do
		if(string.find(entry.id, "Dialogue_Conversation_Entry")) then
			self.entries[#self.entries + 1] = self.Conversation_Entry:new(entry, self.warn)
		end
	end
end

function Player_Choice:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
	self:clear_choices(choices_panel)

	local entry = self:get_entry()
	local method = nil

	if(entry == nil) then
		next.visibility = Visibility.FORCE_OFF
		close.visibility = Visibility.FORCE_ON
	else
		--text_obj.text = entry:get_text()
		entry:write_text(text_obj)

		if(string.len(npc_name) > 0) then
			speaker.text = npc_name
			speaker.parent.visibility = Visibility.FORCE_ON
		end

		if(not entry:has_entries()) then
			next.visibility = Visibility.FORCE_OFF
			close.visibility = Visibility.FORCE_ON
		else
			next.visibility = Visibility.FORCE_ON

			local fired = false

			method = entry.play

			next.clickedEvent:Connect(function()
				if(not fired) then
					fired = true
					method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
				end
			end)
		end
	end

	Dialogue_System_Events.on("left_button_clicked", function(evt_id)
		Dialogue_System_Events.off(evt_id)

		if(Object.IsValid(dialogue)) then
			if(close.visibility ~= Visibility.FORCE_OFF) then
				dialogue:Destroy()
				self:enable_player_controls()
				dialogue_trigger.isInteractable = true
			elseif(next.visibility ~= Visibility.FORCE_OFF and method ~= nil) then
				method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
			end
		end
	end)
end

function Player_Choice:enable_player_controls()
	Events.Broadcast("dialogue_system_disable_ui_interact")
	YOOTIL.Events.broadcast_to_server("dialogue_system_enable_player")

	Dialogue_System_Events.trigger("player_controls_enabled", self)
end

function Player_Choice:clear_choices(choices_panel)
	for _, c in pairs(choices_panel:GetChildren()) do
		c:Destroy()
	end
end

function Player_Choice:get_entry()
	return self.entries[1]
end

function Player_Choice:get_text()
	return "➡ " .. self.text
end

function Player_Choice:get_id()
	return self.id
end

function Player_Choice:has_entries()
	if(#self.entries > 0) then
		return true
	end

	return false
end

function Player_Choice:has_choices()
	return false
end

function Player_Choice:get_prop(prop, wait)
	if(wait) then
		return self.root:GetCustomProperty(prop):WaitForObject()
	end

	return self.root:GetCustomProperty(prop)
end

function Player_Choice:new(entry, Conversation_Entry)
	self.__index = self

	local o = setmetatable({

		Conversation_Entry = Conversation_Entry,
		root = entry

	}, self)

	o:init()

	return o
end

return Player_Choice