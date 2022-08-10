local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Common = require(script:GetCustomProperty("Dialogue_System_Common"))
local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_Conversation_Entry = require(script:GetCustomProperty("Dialogue_Conversation_Entry_Class"))

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

	self.disable_player_look = Dialogue_System_Common.get_prop(self.root, "disable_player_look", false)
	self.disable_player_movement = Dialogue_System_Common.get_prop(self.root, "disable_player_movement", false)
	self.disable_player_mount = Dialogue_System_Common.get_prop(self.root, "disable_player_mount", false)
	self.disable_player_crouch = Dialogue_System_Common.get_prop(self.root, "disable_player_crouch", false)
	self.disable_player_jump = Dialogue_System_Common.get_prop(self.root, "disable_player_jump", false)
	self.enable_ui_interact = Dialogue_System_Common.get_prop(self.root, "enable_ui_interact", false)
	self.enable_ui_cursor = Dialogue_System_Common.get_prop(self.root, "enable_ui_cursor", false)
	self.disable_player_abilities = Dialogue_System_Common.get_prop(self.root, "disable_abilities", false)

	self.animation_stance = Dialogue_System_Common.get_prop(self.root, "animation_stance", false)
	self.animation_stance_playback_rate = Dialogue_System_Common.get_prop(self.root, "animation_stance_playback_rate", false)
	self.animation_stance_loop = Dialogue_System_Common.get_prop(self.root, "animation_stance_loop", false)

	self.animation = Dialogue_System_Common.get_prop(self.root, "animation", false)
	self.animation_playback_rate = Dialogue_System_Common.get_prop(self.root, "animation_playback_rate", false)
	self.animation_loop = Dialogue_System_Common.get_prop(self.root, "animation_loop", false)

	self.dialogue_interact_event = nil
	self.dialogue_trigger = nil

	self.entries = {}

	self.current_entry = nil
	self.button_pulse_task = nil
	self.active = false
	self.has_triggered = false

	self.type = "Conversation"

	self.show_indicator = Dialogue_System_Common.get_prop(self.root, "show_indicator", false)
	self.indicator_template = Dialogue_System_Common.get_prop(self.root, "indicator_template", false)
	self.indicator_offset = Dialogue_System_Common.get_prop(self.root, "indicator_offset", false)

	self.random = Dialogue_System_Common.get_prop(self.root, "random", false)

	self.actor = self.dialogue_trigger_root.parent

	if(self.id <= 0) then
		Dialogue_System_Events.trigger("warning", "\"" .. self.root.name .. "\" needs a unique ID.")

		return
	end

	if(self.show_indicator) then
		self:setup_indicator()
	end

	self:fetch()
	self:setup_dialogue_trigger()

	Dialogue_System_Events.on("dialogue_" .. self.name, function()
		self:trigger_dialogue()
	end)
end

function Conversation:get_type()
	return self.type
end

function Conversation:play_animation_stance()
	if(string.len(self.animation_stance) > 0) then
		self.actor.animationStance = self.animation_stance
		self.actor.animationStanceShouldLoop = self.animation_stance_loop
		self.actor.animationStancePlaybackRate = self.animation_stance_playback_rate
	end
end

function Conversation:play_animation()
	if(string.len(self.animation) > 0) then
		self.actor:PlayAnimation(self.animation, {
			
			playbackRate = self.animation_playback_rate,
			shouldLoop = self.animation_loop

		})
	end
end

function Conversation:setup_indicator()
	if(self.actor.type ~= "AnimatedMesh") then
		return
	end

	self.indicator = World.SpawnAsset(self.indicator_template)
	self.actor:AttachCoreObject(self.indicator, "head")

	self.indicator:SetPosition(self.indicator_offset)
	self.indicator:LookAtContinuous(local_player, true)
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
			local r = entry:GetCustomProperty("random")

			if(r ~= nil) then
				self.entries[#self.entries + 1] = Dialogue_Conversation_Entry:new(entry, {
					
					indicator = self.indicator, 
					repeat_dialogue = self.repeat_dialogue,
					conversation_id = self.id,
					actor = self.actor
				
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
			self.dialogue_trigger.interactionLabel = self.dialogue_trigger_label or ""
			
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

function Conversation:disable_player_controls()
	Dialogue_System_Events.trigger("player_controls_disabled", self)

	YOOTIL.Events.broadcast_to_server("dialogue_system_disable_player", self.disable_player_look, self.disable_player_movement, self.disable_player_mount, self.disable_player_crouch, self.disable_player_jump, self.disable_player_abilities)
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

function Conversation:set_dialogue_trigger_interactable(can_interact)
	self.dialogue_trigger.isInteractable = can_interact
end

function Conversation:set_dialogue_trigger_label(text)
	self.dialogue_trigger.interactionLabel = text
end

function Conversation:set_click_handler()
	self.click_handler = Input.actionPressedEvent:Connect(function(_, action)
		if(action == "Shoot") then
			Dialogue_System_Events.trigger("left_button_clicked_" .. tostring(self.id), self.id)
		end
	end)
end

function Conversation:set_destroyed_event(dialogue)
	dialogue.destroyEvent:Connect(function()
		if(self.click_handler ~= nil and self.click_handler.isConnected) then
			self.click_handler:Disconnect()
			self.click_handler = nil
		end

		if(self.button_pulse_task ~= nil) then
			self.button_pulse_task:Cancel()
			self.button_pulse_task = nil
		end
	end)
end

function Conversation:set_speaker_name(speaker)
	if(string.len(self.name) > 0) then
		speaker.text = self.name

		Dialogue_System_Common.set_speaker_width(speaker)

		speaker.parent.visibility = Visibility.FORCE_ON
	end
end

function Conversation:set_close_handler(dialogue, close)
	close.clickedEvent:Connect(function()
		Dialogue_System_Events.off(Dialogue_System_Common.left_click_event_id)
		Dialogue_System_Common.play_click_sound()

		dialogue:Destroy()
		self:enable_player_controls()

		if(self.repeat_dialogue) then
			self:set_dialogue_trigger_interactable(true)

			if(Object.IsValid(self.indicator)) then
				self.indicator.visibility = Visibility.INHERIT
			end
		end
	end)
end

function Conversation:set_pulse(close, next)
	if(Dialogue_System_Common.pulse_buttons) then
		local close_color = close:GetButtonColor()
		local next_color = next:GetButtonColor()
		local close_color_alpha = close_color.a
		local next_color_alpha = next_color.a

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
	end
end

-- When the player is in proximity of the NPC, it will trigger the dialogue.

function Conversation:trigger_dialogue()
	if(not self.repeat_dialogue and self.has_triggered) then
		return
	end

	self.has_triggered = true

	if(Object.IsValid(self.indicator)) then
		self.indicator.visibility = Visibility.FORCE_OFF
	end

	Dialogue_System_Events.trigger("conversation_started", self)

	local entry = Dialogue_System_Common.get_entry(self)

	if(entry.thinking_time ~= nil and entry.thinking_time > 0) then
		Task.Wait(entry.thinking_time)
	end

	if(entry == nil) then
		self:enable_player_controls()
		self:set_dialogue_trigger_interactable(true)

		return
	end

	self:play_animation_stance()
	self:play_animation()

	entry:set_played(true)
	
	self:call_event()
	entry:call_event()

	self.active = true
	self:set_click_handler()

	local dialogue = World.SpawnAsset(Dialogue_System_Common.dialogue_template, { parent = Dialogue_System_Common.ui_container })
	local speaker = dialogue:GetCustomProperty("name"):GetObject()
	local text_obj = dialogue:GetCustomProperty("text"):GetObject()
	local close = dialogue:GetCustomProperty("close"):GetObject()
	local next = dialogue:GetCustomProperty("next"):GetObject()
	local choices_panel = dialogue:GetCustomProperty("choices_panel"):GetObject()

	entry:set_cache_dialogue_size(dialogue.width, dialogue.height)
	
	Dialogue_System_Common.update_size(dialogue, entry.width_override, entry.height_override, dialogue.width, dialogue.height)

	self:set_destroyed_event(dialogue)
	self:set_speaker_name(speaker)
	self:set_close_handler(dialogue, close)
	self:set_pulse(close, next)

	local method = nil
	local fired = false
	local close_visibility = close.visibility
	local next_visibility = next.visibility
	
	if(not entry:has_choices() and not entry:has_entries()) then
		close_visibility = Visibility.FORCE_ON
	else
		next_visibility = Visibility.FORCE_ON

		entry:play_animation_stance()
		entry:play_animation()

		if(entry:has_choices()) then
			method = entry.show_choices

			next.clickedEvent:Connect(function()
				Dialogue_System_Events.off(Dialogue_System_Common.left_click_event_id)

				if(not fired) then
					Dialogue_System_Common.play_click_sound()

					fired = true
					method(entry, self.dialogue_trigger, dialogue, text_obj, close, next, speaker, self.name, choices_panel)
				end
			end)
		else
			method = entry.play

			next.clickedEvent:Connect(function()
				Dialogue_System_Events.off(Dialogue_System_Common.left_click_event_id)

				if(not fired) then
					Dialogue_System_Common.play_click_sound()

					fired = true
					method(entry, self.dialogue_trigger, dialogue, text_obj, close, next, speaker, self.name, choices_panel)
				end
			end)
		end
	end

	if(Dialogue_System_Common.click_progress) then
		Dialogue_System_Common.left_click_event_id = Dialogue_System_Events.on("left_button_clicked_" .. tostring(self.id), function(evt_id)		
			if(entry.writing) then
				entry.clicked = true
			else
				Dialogue_System_Events.off(evt_id)

				Dialogue_System_Common.play_click_sound()

				if(method ~= nil) then
					fired = true
					method(entry, self.dialogue_trigger, dialogue, text_obj, close, next, speaker, self.name, choices_panel)
				else
					dialogue:Destroy()
					self:enable_player_controls()

					if(self.repeat_dialogue) then
						self:set_dialogue_trigger_interactable(true)

						if(Object.IsValid(self.indicator)) then
							self.indicator.visibility = Visibility.INHERIT
						end
					end
				end
			end
		end)
	end

	Dialogue_System_Common.write_text(entry, text_obj)

	if(Object.IsValid(dialogue)) then
		close.visibility = close_visibility
		next.visibility = next_visibility
	end
end

function Conversation:call_event()
	if(self.event ~= nil and string.len(self.event) > 0) then
		Dialogue_System_Common.call_event(self)
	end
end

function Conversation:clean_up()
	if(self.dialogue_trigger_event ~= nil and self.dialogue_trigger_event.isConnected) then
		self.dialogue_trigger_event:Disconnect()
	end

	if(Object.IsValid(self.indicator)) then
		self.indicator:Destroy()
	end

	if(Object.IsValid(self.dialogue_trigger)) then
		self:set_dialogue_trigger_interactable(false)
	end

	Dialogue_System_Events.off(Dialogue_System_Common.left_click_event_id)

	self.has_triggered = false
	self.active = false
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