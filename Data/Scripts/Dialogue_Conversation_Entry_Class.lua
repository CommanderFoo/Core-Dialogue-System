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
	self.height_override = Dialogue_System_Common.get_prop(self.root, "height_override", false)
	self.width_override = Dialogue_System_Common.get_prop(self.root, "width_override", false)
	self.random = Dialogue_System_Common.get_prop(self.root, "random", false)
	self.disable_letter_animation = Dialogue_System_Common.get_prop(self.root, "disable_letter_animation", false)

	self.animation_stance = Dialogue_System_Common.get_prop(self.root, "animation_stance", false)
	self.animation_stance_playback_rate = Dialogue_System_Common.get_prop(self.root, "animation_stance_playback_rate", false)
	self.animation_stance_loop = Dialogue_System_Common.get_prop(self.root, "animation_stance_loop", false)

	self.animation = Dialogue_System_Common.get_prop(self.root, "animation", false)
	self.animation_playback_rate = Dialogue_System_Common.get_prop(self.root, "animation_playback_rate", false)
	self.animation_loop = Dialogue_System_Common.get_prop(self.root, "animation_loop", false)

	self.thinking_time = Dialogue_System_Common.get_prop(self.root, "thinking_time", false)

	self.choices = {}
	self.entries = {}

	self.played = false
	self.clicked = false
	self.writing = false
	self.active = false

	self.type = "Entry"

	if(self.id <= 0) then
		Dialogue_System_Events.trigger("warning", "\"" .. self.root.name .. "\" needs a unique ID.")

		return
	end

	self:build()
end

function Conversation_Entry:play_animation_stance()
	if(string.len(self.animation_stance) > 0) then
		self.actor.animationStance = self.animation_stance
		self.actor.animationStanceShouldLoop = self.animation_stance_loop
		self.actor.animationStancePlaybackRate = self.animation_stance_playback_rate
	end
end

function Conversation_Entry:play_animation()
	if(string.len(self.animation) > 0) then
		self.actor:PlayAnimation(self.animation, {
			
			playbackRate = self.animation_playback_rate,
			shouldLoop = self.animation_loop

		})
	end
end

function Conversation_Entry:get_type()
	return self.type
end

function Conversation_Entry:build()
	for index, entry in ipairs(self.root:GetChildren()) do
		local r = entry:GetCustomProperty("random")

		if(r ~= nil) then
			self.entries[#self.entries + 1] = Conversation_Entry:new(entry, {
						
				indicator = self.indicator, 
				repeat_dialogue = self.repeat_dialogue,
				conversation_id = self.conversation_id,
				actor = self.actor
			
			})
		else
			self.choices[#self.choices + 1] = Dialogue_Player_Choice:new(entry, {
				
				Conversation_Entry = Conversation_Entry, 
				indicator = self.indicator, 
				repeat_dialogue = self.repeat_dialogue,
				conversation_id = self.conversation_id,
				actor = self.actor
			
			})
		end
	end
end

function Conversation_Entry:set_cache_dialogue_size(width, height)
	self.dialogue_width = width
	self.dialogue_height = height
end

-- Play entry.
-- Handles setup of possible choices or entries.

function Conversation_Entry:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
	self.active = true

	dialogue_trigger.destroyEvent:Connect(function()
		self:clean_up()
	end)

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
		if(entry.thinking_time ~= nil and entry.thinking_time > 0) then
			dialogue.visibility = Visibility.FORCE_OFF
			Task.Wait(entry.thinking_time)
			dialogue.visibility = Visibility.FORCE_ON
		end
		
		entry:play_animation_stance()
		entry:play_animation()
		entry:call_event()
		entry:set_played(true)
		entry:set_cache_dialogue_size(self.dialogue_width, self.dialogue_height)
	
		Dialogue_System_Common.update_size(dialogue, entry.width_override, entry.height_override, self.dialogue_width, self.dialogue_height)

		if(string.len(npc_name) > 0) then
			speaker.text = npc_name

			Dialogue_System_Common.set_speaker_width(speaker)
			
			speaker.parent.visibility = Visibility.FORCE_ON
		end

		local method = nil
		local fired = false
		local close_visibility = close.visibility
		local next_visibility = next.visibility
		local event_id = nil

		if(not entry:has_choices() and not entry:has_entries()) then
			close_visibility = Visibility.FORCE_ON
			next_visibility = Visibility.FORCE_OFF
		else			
			next_visibility = Visibility.FORCE_ON
			method = entry.play

			next.clickedEvent:Connect(function()
				Dialogue_System_Events.off(Dialogue_System_Common.left_click_event_id)

				if(not fired) then
					Dialogue_System_Common.play_click_sound()

					fired = true
					method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
				end
			end)
		end


		if(Dialogue_System_Common.click_progress) then
			Dialogue_System_Common.left_click_event_id = Dialogue_System_Events.on("left_button_clicked_" .. tostring(self.conversation_id), function(evt_id)
				if(entry.writing) then
					entry.clicked = true
				else
					Dialogue_System_Events.off(evt_id)
					Dialogue_System_Common.play_click_sound()

					self.active = false

					if(close_visibility ~= Visibility.FORCE_OFF) then
						dialogue:Destroy()
						self:enable_player_controls()

						if(self.repeat_dialogue) then
							dialogue_trigger.isInteractable = true

							if(Object.IsValid(self.indicator)) then
								self.indicator.visibility = Visibility.INHERIT
							end
						end
					elseif(method ~= nil) then
						if(not fired) then
							fired = true

							method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
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
	local has_override = false

	for i, c in ipairs(self.choices) do
		c:set_cache_dialogue_size(self.dialogue_width, self.dialogue_height)
		
		if(not has_override) then
			has_override = true
			Dialogue_System_Common.update_size(dialogue, c.width_override, c.height_override, self.dialogue_width, self.dialogue_height)
		end

		if(c:is_visible()) then
			local choice = World.SpawnAsset(Dialogue_System_Common.choice_template, { parent = choices_panel })

			choice.text = "  " .. c:get_text()
			choice.y = offset
			
			offset = offset + 35

			choice.clickedEvent:Connect(function()
				c:play_animation_stance()
				c:play_animation()
				c:call_event()

				Dialogue_System_Common.play_click_sound()

				if(c:has_entries() or c:has_choices()) then
					Dialogue_System_Common.play_click_sound()

					c:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
				else
					dialogue:Destroy()
					self:enable_player_controls()

					if(self.repeat_dialogue) then
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
	self.active = false
	self.clicked = false
end

function Conversation_Entry:get_prop(prop, wait)
	if(wait) then
		return self.root:GetCustomProperty(prop):WaitForObject()
	end

	return self.root:GetCustomProperty(prop)
end

function Conversation_Entry:new(entry, opts)
	self.__index = self

	local o = setmetatable({

		root = entry,
		played = false,
		indicator = opts.indicator,
		repeat_dialogue = opts.repeat_dialogue,
		conversation_id = opts.conversation_id,
		actor = opts.actor

	}, self)

	o:init()

	return o
end

return Conversation_Entry