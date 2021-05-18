local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

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
	local entry = nil
	local first_empty_condition_entry = nil

	for i, e in ipairs(obj.entries) do
		local condition = e:get_condition()

		if(condition ~= nil and string.len(condition) > 0) then
			if(Dialogue_System_Common.is_condition_true(obj, condition, e)) then
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

-- This handles checking to see if the condition for this entry is true.
-- Entries can have 1 or 2 conditions, and both must return true.

function Dialogue_System_Common.is_condition_true(obj, condition, entry)
	local condition_1, condition_2 = CoreString.Split(condition, ",")
	local condition_1_true = Dialogue_System_Common.condition_checker(obj, condition_1, entry)
	local condition_2_true = false

	if(condition_2 == nil or string.len(condition_2) == 0) then
		condition_2_true = true
	else
		condition_2_true = Dialogue_System_Common.condition_checker(obj, condition_2, entry)
	end

	if(condition_1_true and condition_2_true) then
		return true
	end

	return false
end

function Dialogue_System_Common.condition_checker(obj, condition, entry)
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
	elseif(type == "function" and obj.callbacks[prop_val] ~= nil) then
		bool_val = obj.callbacks[prop_val](self)
	elseif(type == "played") then
		if(prop_val == "false" and not entry:has_played()) then
			bool_val = true
		end
	end

	return bool_val
end

function Dialogue_System_Common.write_text(obj, text_obj)
	obj.writing = true

	local text = obj:get_text()

	text = Dialogue_System_Common.do_replacements(text)

	for i = 1, string.len(text) do
		text_obj.text = string.sub(text, 1, i)

		if(obj.clicked) then
			text_obj.text = text

			break
		end

		Task.Wait(0.02)
	end

	obj.writing = false
	obj.clicked = false
end

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

			if(amount ~= 1 and inc_plural) then
				str = str .. "s"
			end
		end
	
		return str
	end)

	return text
end

return Dialogue_System_Common