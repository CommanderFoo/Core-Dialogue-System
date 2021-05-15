local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_System_Tweens = require(script:GetCustomProperty("Dialogue_System_Tweens"))
local Dialogue_Conversation_Entry = require(script:GetCustomProperty("Dialogue_Conversation_Entry_Class"))
local Dialogue_Bark_Entry = require(script:GetCustomProperty("Dialogue_Bark_Entry_Class"))

local Conversation = {}

function Conversation:init()
	self.id = self:get_prop("id")

	self.dialogue_trigger_root = self:get_prop("dialogue_trigger", true)
	self.repeat_dialogue = self:get_prop("repeat_dialogue")

	self.bark_trigger_root = self:get_prop("bark_trigger", true)
	self.bark_actor = self.bark_trigger_root.parent
	self.bark_cooldown = self:get_prop("bark_cooldown")
	self.random_bark = self:get_prop("random_bark")
	self.repeat_barks = self:get_prop("repeat_barks")

	self.disable_player_look = self:get_prop("disable_player_look")
	self.disable_player_movement = self:get_prop("disable_player_movement")
	self.disable_player_mount = self:get_prop("disable_player_mount")
	self.disable_player_crouch = self:get_prop("disable_player_crouch")
	self.disable_player_jump = self:get_prop("disable_player_jump")
	self.enable_ui_interact = self:get_prop("enable_ui_interact")
	self.enable_ui_cursor = self:get_prop("enable_ui_cursor")

	self.bark_z_offset = self:get_prop("bark_z_offset")
	self.current_bark = nil

	self.dialogue_interact_event = nil
	self.dialogue_trigger = nil

	self.bark_begin_overlap_event = nil
	self.bark_end_overlap_event = nil
	self.bark_trigger = nil

	self.entries = {}
	self.barks = {}

	self.current_entry = nil
	self.dialogue_completed = false

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

function Conversation:fetch()
	local children = self.root:GetChildren()

	if(#children > 0) then
		for index, entry in ipairs(children) do
			if(string.find(entry.id, "Dialogue_Conversation_Entry")) then
				self.entries[#self.entries + 1] = Dialogue_Conversation_Entry:new(entry)
			elseif(string.find(entry.id, "Dialogue_Bark_Entry")) then
				self.barks[#self.barks + 1] = Dialogue_Bark_Entry:new(entry, {
					
					actor = self.bark_actor,
					bark_template = self.bark_template,
					bark_z_offset = self.bark_z_offset
				
				})
			end
		end
	else
		Dialogue_System_Events.trigger("warning", "No entries for conversation \"" .. self.root.name .. "\", ID: " .. tostring(self:get_id()) .. ".")
	end
end

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

function Conversation:trigger_dialogue()
	Dialogue_System_Events.trigger("conversation_started", self)

	local entry = self:get_entry()
	local dialogue = World.SpawnAsset(self.dialogue_template, { parent = self.ui_container })
	local name = dialogue:GetCustomProperty("name"):GetObject()
	local text = dialogue:GetCustomProperty("text"):GetObject()
	local close = dialogue:GetCustomProperty("close"):GetObject()
	local next = dialogue:GetCustomProperty("next"):GetObject()

	text.text = entry:get_text()

	close.clickedEvent:Connect(function()
		dialogue:Destroy()
		self:enable_player_controls()
		self:set_dialogue_trigger_interactable(true)
	end)

	if(not entry:has_choices() and not entry:has_entries()) then
		close.visibility = Visibility.FORCE_ON
	else
		next.visibility = Visibility.FORCE_ON
		next.clickedEvent:Connect(function()
			entry:play(dialogue, text, close, next)
		end)
	end
end

function Conversation:get_entry()
	return self.entries[1]
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

function Conversation:new(conversation, opts)
	self.__index = self

	local o = setmetatable({

		root = conversation,
		ui_container = opts.ui_container,
		dialogue_template = opts.dialogue_template,
		bark_template = opts.bark_template

	}, self)

	o:init()

	return o
end

return Conversation