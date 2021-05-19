local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Common = require(script:GetCustomProperty("Dialogue_System_Common"))
local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_System_Tweens = require(script:GetCustomProperty("Dialogue_System_Tweens"))
local Dialogue_Conversation_Entry = require(script:GetCustomProperty("Dialogue_Conversation_Entry_Class"))
local Dialogue_Bark_Entry = require(script:GetCustomProperty("Dialogue_Bark_Entry_Class"))

local local_player = Game.GetLocalPlayer()

local Conversation = {}

-- Called from the contructor.
-- Handle setting up properties, and builds the entries table.

function Conversation:init()
	self.id = Dialogue_System_Common.get_prop(self.root, "id", false)
	self.event = Dialogue_System_Common.get_prop(self.root, "call_event", false)

	self.dialogue_trigger_root = Dialogue_System_Common.get_prop(self.root, "dialogue_trigger", true)
	self.repeat_dialogue = Dialogue_System_Common.get_prop(self.root, "repeat_dialogue", false)
	self.name = Dialogue_System_Common.get_prop(self.root, "name", false)

	if(self:is_assigned("bark_trigger")) then
		self.bark_trigger_root = Dialogue_System_Common.get_prop(self.root, "bark_trigger", true)
		self.bark_actor = self.bark_trigger_root.parent
		self.bark_cooldown = Dialogue_System_Common.get_prop(self.root, "bark_cooldown", false)
		self.random_bark = Dialogue_System_Common.get_prop(self.root, "random_bark", false)
		self.repeat_barks = Dialogue_System_Common.get_prop(self.root, "repeat_barks", false)

		self.bark_begin_overlap_event = nil
		self.bark_end_overlap_event = nil
		self.bark_trigger = nil
	
		self.bark_z_offset = Dialogue_System_Common.get_prop(self.root, "bark_z_offset", false)
		self.current_bark = nil
	end

	self.disable_player_look = Dialogue_System_Common.get_prop(self.root, "disable_player_look", false)
	self.disable_player_movement = Dialogue_System_Common.get_prop(self.root, "disable_player_movement", false)
	self.disable_player_mount = Dialogue_System_Common.get_prop(self.root, "disable_player_mount", false)
	self.disable_player_crouch = Dialogue_System_Common.get_prop(self.root, "disable_player_crouch", false)
	self.disable_player_jump = Dialogue_System_Common.get_prop(self.root, "disable_player_jump", false)
	self.enable_ui_interact = Dialogue_System_Common.get_prop(self.root, "enable_ui_interact", false)
	self.enable_ui_cursor = Dialogue_System_Common.get_prop(self.root, "enable_ui_cursor", false)

	self.dialogue_interact_event = nil
	self.dialogue_trigger = nil

	self.entries = {}
	self.barks = {}

	self.current_entry = nil

	self.button_pulse_task = nil

	self.active = false

	if(self.id <= 0) then
		Dialogue_System_Events.trigger("warning", "\"" .. self.root.name .. "\" needs a unique ID.")

		return
	end

	self:fetch()

	self:setup_dialogue_trigger()

	if(#self.barks > 0) then
		self:setup_bark_trigger()
	end
end

function Conversation:is_assigned(prop)
	if(self.root:GetCustomProperty(prop).isAssigned) then
		return true
	end

	return false
end

-- Fetch entries and choices and store them for later use when this
-- dialogue is triggered.

function Conversation:fetch()
	local children = self.root:GetChildren()

	if(#children > 0) then
		for index, entry in ipairs(children) do
			if(string.find(entry.id, "Dialogue_Conversation_Entry")) then
				self.entries[#self.entries + 1] = Dialogue_Conversation_Entry:new(entry)
			elseif(string.find(entry.id, "Dialogue_Bark_Entry")) then
				self.barks[#self.barks + 1] = Dialogue_Bark_Entry:new(entry, {
					
					actor = self.bark_actor,
					bark_z_offset = self.bark_z_offset
				
				})
			end
		end
	else
		Dialogue_System_Events.trigger("warning", "No entries for conversation \"" .. self.root.name .. "\", ID: " .. tostring(self:get_id()) .. ".")
	end
end

-- Handles the setup of the trigger that the player will use to interact with 
-- the NPC.

function Conversation:setup_dialogue_trigger()
	if(Object.IsValid(self.dialogue_trigger_root)) then
		self.dialogue_trigger = self.dialogue_trigger_root:GetChildren()[1]

		if(Object.IsValid(self.dialogue_trigger)) then
			self.dialogue_trigger.destroyEvent:Connect(function()
				self:clean_up()
			end)

			self.dialogue_trigger_interactable = self.dialogue_trigger_root:GetCustomProperty("interactable")
			self.dialogue_trigger_label = self.dialogue_trigger_root:GetCustomProperty("interaction_label")
			self.dialogue_trigger_event = self.dialogue_trigger_root:GetCustomProperty("trigger_event")

			self.dialogue_trigger.isInteractable = self.dialogue_trigger_interactable
			self.dialogue_trigger.interactionLabel = self.dialogue_trigger_label
			
			self.dialogue_interact_event = self.dialogue_trigger.interactedEvent:Connect(function(t, p)
				if(p:IsA("Player")) then
					if(self.repeat_dialogue or (not self.repeat_dialogue and not self.dialogue_complete)) then
						Dialogue_System_Events.trigger("dialogue_trigger_interacted", self)

						self:set_dialogue_trigger_interactable(false)
						self:disable_player_controls()
						self:trigger_dialogue()
					else
						self:set_dialogue_trigger_interactable(false)
					end
				end
			end)
		end
	end
end

-- Handles setting up the bark trigger for the NPC.  The NPC needs a different
-- trigger for handling barks, as it's based on a proximity system for the sake
-- of performance.

function Conversation:setup_bark_trigger()
	if(Object.IsValid(self.bark_trigger_root)) then
		self.bark_trigger = self.bark_trigger_root:GetChildren()[1]

		if(Object.IsValid(self.bark_trigger)) then
			self.bark_trigger.destroyEvent:Connect(function()
				self:clean_up()
			end)

			self.bark_trigger_event = self.dialogue_trigger_root:GetCustomProperty("trigger_event")

			self.bark_begin_overlap_event = self.bark_trigger.beginOverlapEvent:Connect(function(t, obj)
				if(obj:IsA("Player")) then
					self:play_enter_bark()
				end
			end)

			self.bark_end_overlap_event = self.bark_trigger.endOverlapEvent:Connect(function(t, obj)
				if(obj:IsA("Player")) then
					self:play_exit_bark()
				end
			end)
		end
	end
end

-- When a player enters a bark it will play any enter bark entries.

function Conversation:play_enter_bark()
	if(self.current_bark ~= nil and Dialogue_System_Tweens.active_bark ~= nil) then
		return
	end

	local not_played = {}

	for i, b in ipairs(self.barks) do
		if(not b:has_played() and not b:is_exit_bark()) then
			not_played[#not_played + 1] = b
		end
	end

	if(#not_played > 0) then
		local index = 1

		if(self.random_bark) then
			index = math.random(#not_played)
		end
	
		self.current_bark = not_played[index]
		Dialogue_System_Tweens.active_bark = self.current_bark:play()
	else
		if(self.repeat_barks) then
			self:reset_enter_barks()
			self:play_enter_bark()
		end
	end
end

-- Exiting will play exit bark entries.

function Conversation:play_exit_bark()
	if(self.current_bark ~= nil and Dialogue_System_Tweens.active_bark ~= nil) then
		return
	end

	local not_played = {}

	for i, b in ipairs(self.barks) do
		if(not b:has_played() and b:is_exit_bark()) then
			not_played[#not_played + 1] = b
		end
	end

	if(#not_played > 0) then
		local index = 1

		if(self.random_bark) then
			index = math.random(#not_played)
		end

		self.current_bark = not_played[index]
		Dialogue_System_Tweens.active_bark = self.current_bark:play()
	else
		if(self.repeat_barks) then
			self:reset_exit_barks()
			self:play_exit_bark()
		end
	end
end

function Conversation:reset_enter_barks()
	for i, b in ipairs(self.barks) do
		if(not b:is_exit_bark()) then
			b:reset()
		end
	end
end

function Conversation:reset_exit_barks()
	for i, b in ipairs(self.barks) do
		if(b:is_exit_bark()) then
			b:reset()
		end
	end
end

function Conversation:disable_player_controls()
	Dialogue_System_Events.trigger("player_controls_disabled", self)

	YOOTIL.Events.broadcast_to_server("dialogue_system_disable_player", self.disable_player_look, self.disable_player_movement, self.disable_player_mount, self.disable_player_crouch, self.disable_player_jump)
	Events.Broadcast("dialogue_system_enable_ui_interact", self.enable_ui_interact, self.enable_ui_cursor)
end

function Conversation:enable_player_controls()
	Events.Broadcast("dialogue_system_disable_ui_interact")
	YOOTIL.Events.broadcast_to_server("dialogue_system_enable_player")

	Dialogue_System_Events.trigger("player_controls_enabled", self)
end

function Conversation:get_id()
	return self.id
end

function Conversation:get_name()
	return self.name
end

function Conversation:get_dialogue_trigger_root()
	return self.dialogue_trigger_root
end

function Conversation:get_dialogue_trigger()
	return self.dialogue_trigger
end

function Conversation:get_bark_trigger_root()
	return self.bark_trigger_root
end

function Conversation:get_bark_trigger()
	return self.bark_trigger
end

function Conversation:set_dialogue_trigger_interactable(can_interact)
	self.dialogue_trigger.isInteractable = can_interact
end

function Conversation:set_dialogue_trigger_label(text)
	self.dialogue_trigger.interactionLabel = text
end

function Conversation:disable_bark_trigger()
	self.bark_trigger.collision = Collision.FORCE_OFF
end

function Conversation:enable_bark_trigger()
	self.bark_trigger.collision = Collision.FORCE_ON
end

-- When the player is in proximity of the NPC, it will trigger the dialogue.
-- Right now only 1 bark will play when you enter.

function Conversation:trigger_dialogue()
	Dialogue_System_Events.trigger("conversation_started", self)

	local entry = Dialogue_System_Common.get_entry(self)

	if(entry == nil) then
		self:enable_player_controls()
		self:set_dialogue_trigger_interactable(true)

		return
	end

	entry:set_played(true)
	
	self:call_event()
	self.active = true

	local dialogue = World.SpawnAsset(Dialogue_System_Common.dialogue_template, { parent = Dialogue_System_Common.ui_container })
	local speaker = dialogue:GetCustomProperty("name"):GetObject()
	local text_obj = dialogue:GetCustomProperty("text"):GetObject()
	local close = dialogue:GetCustomProperty("close"):GetObject()
	local next = dialogue:GetCustomProperty("next"):GetObject()
	local choices_panel = dialogue:GetCustomProperty("choices_panel"):GetObject()
	local close_color = close:GetButtonColor()
	local next_color = next:GetButtonColor()
	local close_color_alpha = close_color.a
	local next_color_alpha = next_color.a
	
	if(string.len(self.name) > 0) then
		speaker.text = self.name

		Dialogue_System_Common.set_speaker_width(speaker)

		speaker.parent.visibility = Visibility.FORCE_ON
	end

	Dialogue_System_Common.write_text(entry, text_obj)

	close.clickedEvent:Connect(function()
		Dialogue_System_Common.play_click_sound()

		dialogue:Destroy()
		self:enable_player_controls()
		self:set_dialogue_trigger_interactable(true)
	end)

	if(Dialogue_System_Common.pulse_buttons) then
		self.button_pulse_task = Task.Spawn(function()
			if(not Object.IsValid(close)) then
				return
			end

			if(close_color.a == close_color_alpha) then
				close_color.a = 0
			else
				close_color.a = close_color_alpha
			end

			close:SetButtonColor(close_color)

			if(next_color.a == next_color_alpha) then
				next_color.a = 0
			else
				next_color.a = next_color_alpha
			end

			next:SetButtonColor(next_color)
		end)

		self.button_pulse_task.repeatCount = -1
		self.button_pulse_task.repeatInterval = 0.5

		dialogue.destroyEvent:Connect(function()
			if(self.button_pulse_task ~= nil) then
				self.button_pulse_task:Cancel()
				self.button_pulse_task = nil
			end
		end)
	end
	
	local method = nil

	if(not entry:has_choices() and not entry:has_entries()) then
		close.visibility = Visibility.FORCE_ON
	else
		next.visibility = Visibility.FORCE_ON

		local fired = false

		if(entry:has_choices()) then
			method = entry.show_choices

			next.clickedEvent:Connect(function()
				if(not fired) then
					Dialogue_System_Common.play_click_sound()

					fired = true
					method(entry, self.dialogue_trigger, dialogue, text_obj, close, next, speaker, self.name, choices_panel)
				end
			end)
		else
			method = entry.play

			next.clickedEvent:Connect(function()
				if(not fired) then
					Dialogue_System_Common.play_click_sound()

					fired = true
					method(entry, self.dialogue_trigger, dialogue, text_obj, close, next, speaker, self.name, choices_panel)
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
			Dialogue_System_Common.play_click_sound()
			
			self.active = false

			if(close.visibility ~= Visibility.FORCE_OFF) then
				if(entry ~= nil) then
					entry:call_event()
				end

				dialogue:Destroy()
				self:enable_player_controls()
				self:set_dialogue_trigger_interactable(true)
			elseif(next.visibility ~= Visibility.FORCE_OFF and method ~= nil) then
				method(entry, self.dialogue_trigger, dialogue, text_obj, close, next, speaker, self.name, choices_panel)
			end
		end
	end)
end

function Conversation:call_event()
	if(self.event ~= nil and string.len(self.event) > 0) then
		Events.Broadcast(self.event, self)
	end
end

function Conversation:clean_up()
	if(self.dialogue_trigger_event ~= nil and self.dialogue_trigger_event.isConnected) then
		self.dialogue_trigger_event:Disconnect()
	end
end

function Conversation:get_prop(prop, wait)
	if(wait) then
		return self.root:GetCustomProperty(prop):WaitForObject()
	end

	return self.root:GetCustomProperty(prop)
end

function Conversation:new(conversation)
	self.__index = self

	local o = setmetatable({

		root = conversation

	}, self)

	o:init()

	return o
end

return Conversation