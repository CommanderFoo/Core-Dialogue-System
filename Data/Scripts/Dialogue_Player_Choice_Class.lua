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

function Player_Choice:play(dialogue_trigger, dialogue, text, close, next, speaker, npc_name, choices_panel, choice_template)
	self:clear_choices(choices_panel)

	local entry = self:get_entry()

	text.text = entry:get_text()

	if(not entry:has_entries()) then
		next.visibility = Visibility.FORCE_OFF
		close.visibility = Visibility.FORCE_ON
	else
		next.visibility = Visibility.FORCE_ON
		next.clickedEvent:Connect(function()
			entry:play(dialogue_trigger, dialogue, text, close, next, speaker, npc_name, choices_panel, choice_template)
		end)
	end
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
	return self.text
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