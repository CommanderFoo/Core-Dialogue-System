local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Common = require(script:GetCustomProperty("Dialogue_System_Common"))
local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))

local local_player = Game.GetLocalPlayer()

local Player_Choice = {}

function Player_Choice:init()
	self.id = Dialogue_System_Common.get_prop(self.root, "id", false)
	self.text = Dialogue_System_Common.get_prop(self.root, "text", false)
	self.func = Dialogue_System_Common.get_prop(self.root, "function", false)
	self.event = Dialogue_System_Common.get_prop(self.root, "call_event", false)

	self.entries = {}
	self.choices = {}

	self.active = false

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
		elseif(string.find(entry.id, "Dialogue_Player_Choice")) then
			self.choices[#self.choices + 1] = Player_Choice:new(entry, Conversation_Entry)
		end
	end
end

function Player_Choice:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
	self.active = true

	next.visibility = Visibility.FORCE_OFF
	close.visibility = Visibility.FORCE_OFF

	self:execute_function()

	self:clear_choices(choices_panel)

	local entry = Dialogue_System_Common.get_entry(self)
	local method = nil

	if(entry == nil) then
		if(self:has_choices()) then
			self:show_choices(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
		else
			next.visibility = Visibility.FORCE_OFF
			close.visibility = Visibility.FORCE_ON
		end
	else
		entry:set_played(true)

		if(string.len(npc_name) > 0) then
			speaker.text = npc_name

			Dialogue_System_Common.set_speaker_width(speaker)
			
			speaker.parent.visibility = Visibility.FORCE_ON
		end

		Dialogue_System_Common.write_text(entry, text_obj)
		
		if(not entry:has_choices() and not entry:has_entries()) then
			next.visibility = Visibility.FORCE_OFF
			close.visibility = Visibility.FORCE_ON
		else
			next.visibility = Visibility.FORCE_ON

			local fired = false

			method = entry.play

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

		Dialogue_System_Events.off(evt_id)

		if(Object.IsValid(dialogue)) then
			self.active = false

			Dialogue_System_Common.play_click_sound()
			
			if(close.visibility ~= Visibility.FORCE_OFF) then
				if(entry ~= nil) then
					entry:call_event()
				end

				dialogue:Destroy()
				self:enable_player_controls()
				dialogue_trigger.isInteractable = true
			elseif(next.visibility ~= Visibility.FORCE_OFF and method ~= nil) then
				method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
			end
		end
	end)
end

function Player_Choice:show_choices(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
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
				dialogue_trigger.isInteractable = true
			end
		end)
	end
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

function Player_Choice:get_function()
	return self.func
end

function Player_Choice:execute_function()
	if(self.func ~= nil and string.len(self.func) > 0) then
		if(Dialogue_System_Common.callbacks[self.func]) then
			Dialogue_System_Common.callbacks[self.func](self)
		end
	end
end

function Player_Choice:call_event()
	if(self.event ~= nil and string.len(self.event) > 0) then
		Events.Broadcast(self.event, self)
	end
end

function Player_Choice:get_condition()
	return self.condition
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