local YOOTIL = require(script:GetCustomProperty("YOOTIL"))
local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))

local Dialogue_System_Common = {

	callbacks = {}

}

local local_player = Game.GetLocalPlayer()

function Dialogue_System_Common.get_prop(obj, prop, wait)
	if(wait) then
		return obj:GetCustomProperty(prop):WaitForObject()
	end
	
	return obj:GetCustomProperty(prop)
end

-- Looks for an entry to display in the dialogue.  If the entry has a condition
-- then the condition is checked to see if we can use this entry, otherwise it
-- keeps looking.

-- If there are no entries with conditions, then it will just return the first entry
-- in order they are in the hierarchy.

-- Something important to note here is that it will only return the first entry where
-- the condition is true.  For example, if you have 2 entries where both are checking 
-- to see if the users money (resource) is above 0 (resource=money,condition=>0), then
-- the first in the table will be returned and used.  This is why 2 conditions are supported.

-- If all entries have a condition that fail, then no dialogue will open.

function Dialogue_System_Common.get_entry(obj)
	if(obj.random) then
		return Dialogue_System_Common.get_random_entry(obj)
	end

	local entry = nil
	local first_empty_condition_entry = nil

	for i, e in ipairs(obj.entries) do
		local condition = e:get_condition()

		if(condition ~= nil and string.len(condition) > 0) then
			if(Dialogue_System_Common.is_condition_true(condition, e)) then
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

function Dialogue_System_Common.get_random_entry(obj)
	local valid_entries = {}

	for i, e in ipairs(obj.entries) do
		local condition = e:get_condition()

		if(condition ~= nil and string.len(condition) > 0) then
			if(Dialogue_System_Common.is_condition_true(condition, e)) then
				valid_entries[#valid_entries + 1] = e
			end
		else
			valid_entries[#valid_entries + 1] = e
		end
	end

	if(#valid_entries > 0) then
		return valid_entries[math.random(#valid_entries)]
	end

	return nil
end

-- This handles checking to see if the condition for this entry is true.
-- Entries can have 1 or 2 conditions, and both must return true.

function Dialogue_System_Common.is_condition_true(condition, entry)
	local condition_1, condition_2 = CoreString.Split(condition, ",")
	local condition_1_true = Dialogue_System_Common.condition_checker(condition_1, entry)
	local condition_2_true = false

	if(condition_2 == nil or string.len(condition_2) == 0) then
		condition_2_true = true
	else
		condition_2_true = Dialogue_System_Common.condition_checker(condition_2, entry)
	end

	if(condition_1_true and condition_2_true) then
		return true
	end

	return false
end

-- Checks the condition string to see what to check against

function Dialogue_System_Common.condition_checker(condition, entry)
	local part_1, cond = CoreString.Split(condition, ";")
	local type, prop_val = CoreString.Split(part_1, "=")
	local bool_val = false

	if(type == "resource") then
		local comp = string.sub(cond, 1, 2)
		local val = tonumber(string.sub(cond, 3))
		local amount = local_player:GetResource(prop_val)

		if((comp == ">=" and amount >= val) or (comp == "<=" and amount <= val) or (comp == "==" and amount == val)) then
			bool_val = true
		else
			local comp = string.sub(cond, 1, 1)
			local val = tonumber(string.sub(cond, 2))
			
			if((comp == ">" and amount > val) or (comp == "<" and amount < val)) then
				bool_val = true
			end
		end	
	elseif(type == "name" and local_player.name == prop_val) then
		bool_val = true
	elseif(type == "id" and local_player.id == prop_val) then
		bool_val = true
	elseif(type == "function" and Dialogue_System_Common.callbacks[prop_val] ~= nil) then
		bool_val = Dialogue_System_Common.callbacks[prop_val](self)
	elseif(type == "played") then
		if(prop_val == "false" and not entry:has_played()) then
			bool_val = true
		end
	end

	return bool_val
end

-- Writes out the text.  Animates letters if enabled, and if user clicks, then
-- we basically skip the rest of the letter animation.

function Dialogue_System_Common.write_text(obj, text_obj)
	obj.writing = true

	local text = obj:get_text()

	text = Dialogue_System_Common.do_replacements(text)
	
	if(Dialogue_System_Common.animate_letters and not obj.disable_letter_animation) then
		for i = 1, string.len(text) do
			if(obj.clicked) then
				text_obj.text = text
				Dialogue_System_Common.play_click_sound()

				break
			end

			text_obj.text = string.sub(text, 1, i)
			Dialogue_System_Common.play_type_sound()
			Task.Wait(Dialogue_System_Common.letter_speed)
		end

		obj.writing = false
		obj.clicked = false
	else
		text_obj.text = text
		obj.writing = false
		obj.clicked = false
	end
end

-- Replacements that can be used in dialogue text and choices.

function Dialogue_System_Common.do_replacements(text)
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

			if(string.sub(str, -1) ~= "s" and amount ~= 1 and inc_plural) then
				str = str .. "s"
			end
		end
	
		return str
	end)

	return text
end

-- Speaker width is dynamically adjusted.  A 1 size for all didn't sit with me.

function Dialogue_System_Common.set_speaker_width(speaker_obj)
	local size = speaker_obj:ComputeApproximateSize()

	while(size == nil) do
		Task.Wait()
		size = speaker_obj:ComputeApproximateSize()
	end

	speaker_obj.parent.width = size.x + 45

	if(Dialogue_System_Common.min_speaker_width > 0 and Dialogue_System_Common.min_speaker_width > speaker_obj.parent.width) then
		speaker_obj.parent.width = Dialogue_System_Common.min_speaker_width
	end
end

function Dialogue_System_Common.random_pitch(sound)
	sound.pitch = math.random(-400, 400)
end

function Dialogue_System_Common.play_click_sound()
	if(not Dialogue_System_Common.can_play_click_sound) then
		return
	end

	if(Dialogue_System_Common.click_sound ~= nil) then
		Dialogue_System_Common.random_pitch(Dialogue_System_Common.click_sound)
		Dialogue_System_Common.click_sound:Play()
	end
end

function Dialogue_System_Common.play_type_sound()
	if(not Dialogue_System_Common.can_play_type_sound) then
		return
	end

	if(Dialogue_System_Common.type_sound ~= nil) then
		Dialogue_System_Common.random_pitch(Dialogue_System_Common.type_sound)
		Dialogue_System_Common.type_sound:Play()
	end
end

function Dialogue_System_Common.call_event(obj)
	local params = {}
	local event, extra = CoreString.Split(obj.event, ";")

	if(extra ~= nil and string.len(extra) > 0) then
		params = { CoreString.Split(extra, ",") }

		for i, p in ipairs(params) do
			p = CoreString.Trim(p)
			
			if(p == "true") then
				params[i] = true	
			elseif(p == "false") then
				params[i] = false
			end
		end
	end

	Events.Broadcast(event, obj, table.unpack(params))
end

function Dialogue_System_Common.update_size(dialogue, width_override, height_override, old_width, old_height)
	if(height_override > 0) then
		dialogue.height = height_override
	else
		dialogue.height = old_height
	end

	if(width_override > 0) then
		dialogue.width = width_override
	else
		dialogue.width = old_width
	end
end

return Dialogue_System_Common