local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_Player_Choice = require(script:GetCustomProperty("Dialogue_Player_Choice_Class"))

local local_player = Game.GetLocalPlayer()
local Conversation_Entry = {}

function Conversation_Entry:init()
	self.id = self:get_prop("id")
	self.text = self:get_prop("text")
	
	self.choices = {}
	self.entries = {}

	if(self.id <= 0) then
		Dialogue_System_Events.trigger("warning", "\"" .. self.root.name .. "\" needs a unique ID.")

		return
	end

	self:build()
end

function Conversation_Entry:build()
	for index, entry in ipairs(self.root:GetChildren()) do
		if(string.find(entry.id, "Dialogue_Conversation_Entry")) then
			self.entries[#self.entries + 1] = Conversation_Entry:new(entry)
		elseif(string.find(entry.id, "Dialogue_Player_Choice")) then
			self.choices[#self.choices + 1] = Dialogue_Player_Choice:new(entry, Conversation_Entry)
		end
	end
end

function Conversation_Entry:play(dialogue, text, close, next, speaker, npc_name)
	local entry = self:get_entry()

	text.text = entry:get_text()

	if(not entry:has_choices() and not entry:has_entries()) then
		next.visibility = Visibility.FORCE_OFF
		close.visibility = Visibility.FORCE_ON
	else
		next.visibility = Visibility.FORCE_ON
		next.clickedEvent:Connect(function()
			entry:play(dialogue, text, close, next, speaker_name)
		end)
	end
end

function Conversation_Entry:show_choices(dialogue, text, close, next, speaker, npc_name)
	if(speaker.parent.visibility ~= Visibility.FORCE_OFF) then
		speaker.text = "You"
	end

	next.visibility = Visibility.FORCE_OFF
	close.visibility = Visibility.FORCE_OFF

	for i, c in ipairs(self.choices) do
		
	end
end

function Conversation_Entry:get_entry()
	return self.entries[1]
end

function Conversation_Entry:get_id()
	return self.id
end

function Conversation_Entry:get_text()
	return self.text
end

function Conversation_Entry:has_entries()
	if(#self.entries > 0) then
		return true
	end

	return false
end

function Conversation_Entry:has_choices()
	if(#self.choices > 0) then
		return true
	end

	return false
end

function Conversation_Entry:clean_up()
	if(self.trigger_event ~= nil and self.trigger_event.isConnected) then
		self.trigger_event:Disconnect()
	end
end

function Conversation_Entry:get_prop(prop, wait)
	if(wait) then
		return self.root:GetCustomProperty(prop):WaitForObject()
	end

	return self.root:GetCustomProperty(prop)
end

function Conversation_Entry:new(entry)
	self.__index = self

	local o = setmetatable({

		root = entry

	}, self)

	o:init()

	return o
end

return Conversation_Entry