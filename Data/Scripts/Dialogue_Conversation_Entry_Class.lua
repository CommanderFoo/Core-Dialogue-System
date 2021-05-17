local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_Player_Choice = require(script:GetCustomProperty("Dialogue_Player_Choice_Class"))

local local_player = Game.GetLocalPlayer()
local Conversation_Entry = {}

function Conversation_Entry:init()
	self.id = self:get_prop("id")
	self.text = self:get_prop("text")
	self.condition = self:get_prop("condition")

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
			speaker.parent.visibility = Visibility.FORCE_ON
		end

		--text.text = entry:get_text()
		entry:write_text(text_obj)
	end

	local method = nil

	if(entry ~= nil) then
		if(not entry:has_choices() and not entry:has_entries()) then
			next.visibility = Visibility.FORCE_OFF
			close.visibility = Visibility.FORCE_ON
		else
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

function Conversation_Entry:clear_choices(choices_panel)
	for _, c in pairs(choices_panel:GetChildren()) do
		c:Destroy()
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

		elseif(first_empty_condition_entry == nil) then
			first_empty_condition_entry = e
		end
	end

	print(entry)
	if(entry == nil and first_empty_condition_entry ~= nil) then
		print("eh?")
		entry = first_empty_condition_entry
	end

	--return self.entries[1]
	return entry
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

		root = entry

	}, self)

	o:init()

	return o
end

return Conversation_Entry