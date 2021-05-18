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
		end
	end
end

function Player_Choice:play(dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
	next.visibility = Visibility.FORCE_OFF
	close.visibility = Visibility.FORCE_OFF

	self:execute_function()

	self:clear_choices(choices_panel)

	local entry = Dialogue_System_Common.get_entry(self)
	local method = nil

	if(entry == nil) then
		next.visibility = Visibility.FORCE_OFF
		close.visibility = Visibility.FORCE_ON
	else
		self:call_event()

		entry:set_played(true)
		Dialogue_System_Common.write_text(entry, text_obj)

		if(string.len(npc_name) > 0) then
			speaker.text = npc_name

			local size = speaker:ComputeApproximateSize()

			while(size == nil) do
				Task.Wait()
				size = speaker:ComputeApproximateSize()
			end

			speaker.parent.width = size.x + 20

			if(Dialogue_System_Common.min_speaker_width > 0 and Dialogue_System_Common.min_speaker_width > speaker.parent.width) then
				speaker.parent.width = Dialogue_System_Common.min_speaker_width
			end
			
			speaker.parent.visibility = Visibility.FORCE_ON
		end

		if(not entry:has_entries()) then
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
		Dialogue_System_Events.off(evt_id)

		if(Object.IsValid(dialogue)) then
			Dialogue_System_Common.play_click_sound()
			
			if(close.visibility ~= Visibility.FORCE_OFF) then
				dialogue:Destroy()
				self:enable_player_controls()
				dialogue_trigger.isInteractable = true
			elseif(next.visibility ~= Visibility.FORCE_OFF and method ~= nil) then
				method(entry, dialogue_trigger, dialogue, text_obj, close, next, speaker, npc_name, choices_panel)
			end
		end
	end)
end

function Player_Choice:do_replacements(text)
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
	return "➡ " .. self:do_replacements(self.text)
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