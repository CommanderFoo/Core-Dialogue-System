local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Common = require(script:GetCustomProperty("Dialogue_System_Common"))
local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))

local local_player = Game.GetLocalPlayer()

local Player_Choice = {}

function Player_Choice:init()
	self.id = Dialogue_System_Common.get_prop(self.root, "id", false)
	self.text = Dialogue_System_Common.get_prop(self.root, "text", false)
	self.condition = Dialogue_System_Common.get_prop(self.root, "condition", false)
	self.event = Dialogue_System_Common.get_prop(self.root, "call_event", false)
	self.height_override = Dialogue_System_Common.get_prop(self.root, "height_override", false)
	self.width_override = Dialogue_System_Common.get_prop(self.root, "width_override", false)
	
	self.animation_stance = Dialogue_System_Common.get_prop(self.root, "animation_stance", false)
	self.animation_stance_playback_rate = Dialogue_System_Common.get_prop(self.root, "animation_stance_playback_rate", false)
	self.animation_stance_loop = Dialogue_System_Common.get_prop(self.root, "animation_stance_loop", false)

	self.animation = Dialogue_System_Common.get_prop(self.root, "animation", false)
	self.animation_playback_rate = Dialogue_System_Common.get_prop(self.root, "animation_playback_rate", false)
	self.animation_loop = Dialogue_System_Common.get_prop(self.root, "animation_loop", false)

	self.entries = {}
	self.choices = {}

	self.active = false
	self.visible = true
	self.played = false

	self.type = "Choice"

	if(self.id <= 0) then
		Dialogue_System_Events.trigger("\"" .. self.root.name .. "\" needs a unique ID.")

		return
	end

	self:build_tree()
end

function Player_Choice:play_animation_stance()
	if(string.len(self.animation_stance) > 0) then
		self.actor.animationStance = self.animation_stance
		self.actor.animationStanceShouldLoop = self.animation_stance_loop
		self.actor.animationStancePlaybackRate = self.animation_stance_playback_rate
	end
end

function Player_Choice:play_animation()
	if(string.len(self.animation) > 0) then
		self.actor:PlayAnimation(self.animation, {
			
			playbackRate = self.animation_playback_rate,
			shouldLoop = self.animation_loop

		})
	end
end

function Player_Choice:get_type()
	return self.type
end

function Player_Choice:build_tree()
	for index, entry in ipairs(self.root:GetChildren()) do
		local r = entry:GetCustomProperty("random")

		if(r ~= nil) then
			self.entries[#self.entries + 1] = self.Conversation_Entry:new(entry, {
				
				indicator = self.indicator, 
				repeat_dialogue = self.repeat_dialogue,
				conversation_id = self.conversation_id,
				actor = self.actor
			
			})
		else
			self.choices[#self.choices + 1] = Player_Choice:new(entry, {
				
				Conversation_Entry = self.Conversation_Entry, 
				indicator = self.indicator, 
				repeat_dialogue = self.repeat_dialogue,
				conversation_id = self.conversation_id,
				actor = self.actor
			
			})
		end
	end
end

function Player_Choice:set_cache_dialogue_size(width, height)
	self.dialogue_width = width
	self.dialogue_height = height
end

function Player_Choice:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
	self.active = true

	dialogue_trigger.destroyEvent:Connect(function()
		self:clean_up()
	end)

	self.played = true

	next.visibility = Visibility.FORCE_OFF
	close.visibility = Visibility.FORCE_OFF
	
	self:clear_choices(choices_panel)

	local entry = Dialogue_System_Common.get_entry(self)

	local method = nil
	local has_choices = false
	local fired = false

	if(entry == nil) then
		if(self:has_choices()) then
			has_choices = true
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
		entry:set_cache_dialogue_size(self.dialogue_width, self.dialogue_height)
	
		Dialogue_System_Common.update_size(dialogue, entry.width_override, entry.height_override, self.dialogue_width, self.dialogue_height)

		entry:set_played(true)

		if(string.len(npc_name) > 0) then
			speaker.text = npc_name

			Dialogue_System_Common.set_speaker_width(speaker)
			
			speaker.parent.visibility = Visibility.FORCE_ON
		end

		local method = nil
		local fired = false
		local close_visibility = close.visibility
		local next_visibility = next.visibility

		if(not entry:has_choices() and not entry:has_entries()) then
			next_visibility = Visibility.FORCE_OFF
			close_visibility = Visibility.FORCE_ON
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

function Player_Choice:clean_up()
	self.active = false
end

function Player_Choice:set_visibility()
	if(string.len(self.condition) > 1) then
		local part_1, cond = CoreString.Split(self.condition, ";")
		local type, prop_val = CoreString.Split(part_1, "=")
		local bool_val = false

		if(type == "resource") then
			local comp = string.sub(cond, 1, 2)
			local val = tonumber(string.sub(cond, 3))
			local amount = local_player:GetResource(prop_val)

			if((comp == ">=" and amount >= val) or (comp == "<=" and amount <= val) or (comp == "==" and amount == val)) then
				bool_val = true
			end		
		elseif(type == "name" and local_player.name == prop_val) then
			bool_val = true
		elseif(type == "id" and local_player.id == prop_val) then
			bool_val = true
		elseif(type == "function" and Dialogue_System_Common.callbacks[prop_val] ~= nil) then
			bool_val = Dialogue_System_Common.callbacks[prop_val](self)
		elseif(type == "played") then
			if(prop_val == "false" and not self:has_played()) then
				bool_val = true
			end
		end

		self.visible = bool_val
	end
end

function Player_Choice:has_played()
	return self.played
end

function Player_Choice:is_visible()
	return self.visible
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

function Player_Choice:call_event()
	if(self.event ~= nil and string.len(self.event) > 0) then
		Dialogue_System_Common.call_event(self)
	end
end

function Player_Choice:get_condition()
	return self.condition
end

function Player_Choice:get_text()
	return "➡ " .. Dialogue_System_Common.do_replacements(self.text)
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

function Player_Choice:get_prop(prop, wait)
	if(wait) then
		return self.root:GetCustomProperty(prop):WaitForObject()
	end

	return self.root:GetCustomProperty(prop)
end

function Player_Choice:new(entry, opts)
	self.__index = self

	local o = setmetatable({

		Conversation_Entry = opts.Conversation_Entry,
		root = entry,
		indicator = opts.indicator,
		repeat_dialogue = opts.repeat_dialogue,
		conversation_id = opts.conversation_id,
		actor = opts.actor

	}, self)

	o:init()

	return o
end

return Player_Choice