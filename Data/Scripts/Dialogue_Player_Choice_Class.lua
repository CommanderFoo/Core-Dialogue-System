local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))

local Player_Choice = {}

function Player_Choice:init()
	self.id = self:get_prop("id")
	
	self.choices = {}
	self.entries = {}

	if(self.id <= 0) then
		Dialogue_System_Events.trigger("\"" .. self.root.name .. "\" needs a unique ID.")

		return
	end

	self:build_tree()
	
	--print(self.id, #self.entries, self:get_prop("text"))
end

function Player_Choice:build_tree()
	for index, entry in ipairs(self.root:GetChildren()) do
		if(string.find(entry.id, "Dialogue_Conversation_Entry")) then
			self.entries[#self.entries + 1] = self.Conversation_Entry:new(entry, self.warn)
		elseif(string.find(entry.id, "Dialogue_Player_Choice")) then
			self.choices[#self.choices + 1] = Dialogue_Player_Choice:new(entry, self.warn)
		end
	end
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
	if(#self.choices > 0) then
		return true
	end

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