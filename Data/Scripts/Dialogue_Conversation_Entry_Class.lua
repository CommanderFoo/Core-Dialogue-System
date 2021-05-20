local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Common = require(script:GetCustomProperty("Dialogue_System_Common"))
local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_Player_Choice = require(script:GetCustomProperty("Dialogue_Player_Choice_Class"))

local local_player = Game.GetLocalPlayer()
local Conversation_Entry = {}

function Conversation_Entry:init()
	self.id = Dialogue_System_Common.get_prop(self.root, "id", false)
	self.text = Dialogue_System_Common.get_prop(self.root, "text", false)
	self.condition = Dialogue_System_Common.get_prop(self.root, "condition", false)
	self.event = Dialogue_System_Common.get_prop(self.root, "call_event", false)

	self.choices = {}
	self.entries = {}

	self.played = false
	self.clicked = false
	self.writing = false
	self.active = false

	if(self.id <= 0) then
		Dialogue_System_Events.trigger("warning", "\"" .. self.root.name .. "\" needs a unique ID.")

		return
	end

	self.click_evt_id = Dialogue_System_Events.on("left_button_clicked", function(evt_id)
		if(self.writing) then
			self.clicked = true
		end
	end)

	self:build()
end

function Conversation_Entry:build()
	for index, entry in ipairs(self.root:GetChildren()) do
		if(string.find(entry.id, "Dialogue_Conversation_Entry")) then
			self.entries[#self.entries + 1] = Conversation_Entry:new(entry, self.indicator, self.can_repeat)
		elseif(string.find(entry.id, "Dialogue_Player_Choice")) then
			self.choices[#self.choices + 1] = Dialogue_Player_Choice:new(entry, Conversation_Entry, self.indicator, self.can_repeat)
		end
	end
end

-- Play entry.
-- Handles setup of possible choices or entries.

function Conversation_Entry:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
	self.active = true

	next.visibility = Visibility.FORCE_OFF
	close.visibility = Visibility.FORCE_OFF
	
	self:clear_choices(choices_panel)

	local entry = Dialogue_System_Common.get_entry(self)

	if(entry == nil) then
		if(self:has_choices()) then
			self:show_choices(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
		else
			next.visibility = Visibility.FORCE_OFF
			close.visibility = Visibility.FORCE_ON
		end
	else
		if(string.len(npc_name) > 0) then
			speaker.text = npc_name

			Dialogue_System_Common.set_speaker_width(speaker)
			
			speaker.parent.visibility = Visibility.FORCE_ON
		end

		Dialogue_System_Common.write_text(entry, text_obj)
	end

	local method = nil
	
	self:call_event()
	
	if(entry ~= nil) then
		if(not entry:has_choices() and not entry:has_entries()) then
			next.visibility = Visibility.FORCE_OFF
			close.visibility = Visibility.FORCE_ON
		else
			entry:set_played(true)

			next.visibility = Visibility.FORCE_ON
			
			method = entry.play

			local fired = false

			next.clickedEvent:Connect(function()
				if(not fired) then
					Dialogue_System_Common.play_click_sound()

					fired = true
					method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
				end
			end)
		end
	end

	Dialogue_System_Events.on("left_button_clicked", function(evt_id)
		if(not self.active) then
			return
		end

		--Dialogue_System_Events.off(evt_id)

		if(Object.IsValid(dialogue)) then	
			self.active = false

			if(close.visibility ~= Visibility.FORCE_OFF) then
				if(entry ~= nil) then
					entry:call_event()
				end

				dialogue:Destroy()
				self:enable_player_controls()

				if(self.can_repeat) then
					dialogue_trigger.isInteractable = true

					if(Object.IsValid(self.indicator)) then
						self.indicator.visibility = Visibility.INHERIT
					end
				end
			elseif(next.visibility ~= Visibility.FORCE_OFF and method ~= nil) then
				Dialogue_System_Common.play_click_sound()
				
				method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
			end
		end
	end)
end

function Conversation_Entry:show_choices(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
	self:clear_choices(choices_panel)

	if(speaker.parent.visibility ~= Visibility.FORCE_OFF) then
		speaker.text = "You"

		Dialogue_System_Common.set_speaker_width(speaker)
	end

	next.visibility = Visibility.FORCE_OFF
	close.visibility = Visibility.FORCE_OFF

	text_obj.text = ""

	local offset = 0

	for i, c in ipairs(self.choices) do
		if(c:is_visible()) then
			local choice = World.SpawnAsset(Dialogue_System_Common.choice_template, { parent = choices_panel })

			choice.text = "  " .. c:get_text()
			choice.y = offset
			
			offset = offset + 35

			choice.clickedEvent:Connect(function()
				c:call_event()

				if(c:has_entries() or c:has_choices()) then
					Dialogue_System_Common.play_click_sound()

					c:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
				else
					dialogue:Destroy()
					self:enable_player_controls()

					if(self.can_repeat) then
						dialogue_trigger.isInteractable = true

						if(Object.IsValid(self.indicator)) then
							self.indicator.visibility = Visibility.INHERIT
						end
					end
				end
			end)
		end
	end
end

function Conversation_Entry:set_played(v)
	self.played = v
end

function Conversation_Entry:has_played()
	return self.played
end

function Conversation_Entry:clear_choices(choices_panel)
	for _, c in pairs(choices_panel:GetChildren()) do
		c:Destroy()
	end
end

function Conversation_Entry:call_event()
	if(self.event ~= nil and string.len(self.event) > 0) then
		Dialogue_System_Common.call_event(self)
	end
end

function Conversation_Entry:enable_player_controls()
	Events.Broadcast("dialogue_system_disable_ui_interact")
	YOOTIL.Events.broadcast_to_server("dialogue_system_enable_player")

	Dialogue_System_Events.trigger("player_controls_enabled", self)
end

function Conversation_Entry:get_condition()
	return self.condition
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
	local got_visible = false

	if(#self.choices > 0) then
		for _, c in ipairs(self.choices) do
			c:set_visibility()
		
			if(c:is_visible()) then
				got_visible = true
			end
		end
	end

	return got_visible
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

function Conversation_Entry:new(entry, indicator, can_repeat)
	self.__index = self

	local o = setmetatable({

		root = entry,
		played = false,
		indicator = indicator,
		can_repeat = can_repeat

	}, self)

	o:init()

	return o
end

return Conversation_Entry