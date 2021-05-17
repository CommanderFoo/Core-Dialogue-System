local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_Player_Choice = require(script:GetCustomProperty("Dialogue_Player_Choice_Class"))

local local_player = Game.GetLocalPlayer()
local Conversation_Entry = {}

function Conversation_Entry:init()
	self.id = self:get_prop("id")
	self.text = self:get_prop("text")
	self.condition = self:get_prop("condition")
	self.event = self:get_prop("call_event")

	self.choices = {}
	self.entries = {}

	self.played = false
	self.test = "hi"

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

function Conversation_Entry:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
	self:clear_choices(choices_panel)

	local entry = self:get_entry()

	if(entry == nil) then
		if(self:has_choices()) then
			self:show_choices(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
		else
			next.visibility = Visibility.FORCE_OFF
			close.visibility = Visibility.FORCE_ON
		end
	else
		if(string.len(npc_name) > 0) then
			speaker.text = npc_name

			local size = speaker:ComputeApproximateSize()

			while(size == nil) do
				Task.Wait()
				size = speaker:ComputeApproximateSize()
			end

			speaker.parent.width = size.x + 20
			
			speaker.parent.visibility = Visibility.FORCE_ON
		end

		entry:write_text(text_obj)
	end

	local method = nil

	if(entry ~= nil) then
		self:call_event()

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
					fired = true
					method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
				end
			end)
		end
	end

	Dialogue_System_Events.on("left_button_clicked", function(evt_id)
		Dialogue_System_Events.off(evt_id)

		if(Object.IsValid(dialogue)) then
			if(close.visibility ~= Visibility.FORCE_OFF) then
				dialogue:Destroy()
				self:enable_player_controls()
				dialogue_trigger.isInteractable = true
			elseif(next.visibility ~= Visibility.FORCE_OFF and method ~= nil) then
				method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
			end
		end
	end)
end

function Conversation_Entry:show_choices(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
	self:clear_choices(choices_panel)

	if(speaker.parent.visibility ~= Visibility.FORCE_OFF) then
		speaker.text = "You"

		local size = speaker:ComputeApproximateSize()

		while(size == nil) do
			Task.Wait()
			size = speaker:ComputeApproximateSize()
		end

		speaker.parent.width = size.x + 20
	end

	next.visibility = Visibility.FORCE_OFF
	close.visibility = Visibility.FORCE_OFF

	text_obj.text = ""

	local offset = 0

	for i, c in ipairs(self.choices) do
		local choice = World.SpawnAsset(choice_template, { parent = choices_panel })

		choice.text = "  " .. c:get_text()
		choice.y = offset
		
		offset = offset + 35

		choice.clickedEvent:Connect(function()
			if(c:has_entries()) then
				c:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel, choice_template)
			else
				dialogue:Destroy()
				self:enable_player_controls()
				dialogue_trigger.isInteractable = true
			end
		end)
	end
end

function Conversation_Entry:write_text(text_obj)
	local text = self:get_text()

	text = self:do_replacements(text)

	text_obj.text = text

	--[[
	Task.Spawn(function()
		for i = 1, string.len(text) do
			text_obj.text = string.sub(text, 1, i)

			Task.Wait(0.02)
		end
	end)
	--]]
end

function Conversation_Entry:do_replacements(text)
	local general_replacements = {

		{ replace = "{name}", with = local_player.name },
		{ replace = "{id}", with = local_player.id },
		{ replace = "{hitpoints}", with = local_player.hitPoints },
		{ replace = "{maxhitpoints}", with = local_player.maxHitPoints },
		{ replace = "{kills}", with = local_player.kills },
		{ replace = "{deaths}", with = local_player.deaths },
		{ replace = "{maxjumpcount}", with = local_player.maxJumpCount }

	}

	for _, r in pairs(general_replacements) do
		text = string.gsub(text, r.replace, r.with)
	end

	-- Resource replacements

	text = string.gsub(text, "{resource=(.-)}", function(k)
		local amount = 0
		local inc_key = false
		local inc_plural = true

		if(string.find(k, ",")) then
			local key, inc_name_bool, inc_plural_bool = CoreString.Split(k, ",")
			
			amount = local_player:GetResource(key)
			k = key
	
			if(CoreString.Trim(inc_name_bool) == "true") then
				inc_key = true
			end

			if(inc_plural_bool ~= nil and CoreString.Trim(inc_plural_bool) == "false") then
				inc_plural = false
			end
		else
			amount = local_player:GetResource(k)
		end
	
		local str = YOOTIL.Utils.number_format(amount)

		if(inc_key) then
			k = YOOTIL.Utils.first_to_upper(k)
			str = str .. " " .. k

			if(amount ~= 1 and inc_plural) then
				str = str .. "s"
			end
		end
	
		return str
	end)

	return text
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
		Events.Broadcast(self.event, self)
	end
end

function Conversation_Entry:enable_player_controls()
	Events.Broadcast("dialogue_system_disable_ui_interact")
	YOOTIL.Events.broadcast_to_server("dialogue_system_enable_player")

	Dialogue_System_Events.trigger("player_controls_enabled", self)
end

function Conversation_Entry:get_entry()
	local entry = nil
	local first_empty_condition_entry = nil

	for i, e in ipairs(self.entries) do
		local condition = e:get_condition()

		if(condition ~= nil and string.len(condition) > 0) then
			if(self:is_condition_true(condition, e)) then
				entry = e

				break
			end
		elseif(first_empty_condition_entry == nil) then
			first_empty_condition_entry = e
		end
	end

	if(entry == nil and first_empty_condition_entry ~= nil) then
		entry = first_empty_condition_entry
	end

	return entry
end

function Conversation_Entry:is_condition_true(condition, entry)
	local condition_1, condition_2 = CoreString.Split(condition, ",")
	local condition_1_true = self:condition_checker(condition_1, entry)
	local condition_2_true = false

	if(condition_2 == nil or string.len(condition_2) == 0) then
		condition_2_true = true
	else
		condition_2_true = self:condition_checker(condition_2, entry)
	end

	if(condition_1_true and condition_2_true) then
		return true
	end

	return false
end

function Conversation_Entry:condition_checker(condition, entry)
	local part_1, cond = CoreString.Split(condition, ";")
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
	elseif(type == "function" and self.callbacks[prop_val] ~= nil) then
		bool_val = self.callbacks[prop_val](self)
	elseif(type == "played") then
		entry.test = "world"
		if(prop_val == "false" and not entry:has_played()) then
			bool_val = true
		end
	end

	return bool_val
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

		root = entry,
		played = false

	}, self)

	o:init()

	return o
end

return Conversation_Entry