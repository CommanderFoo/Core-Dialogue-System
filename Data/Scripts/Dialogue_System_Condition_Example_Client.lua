-- To use the callbacks and events system, we need to require it the Dialogue System.

local Dialogue_System = require(script:GetCustomProperty("Dialogue_System"))

-- This gets updated after we talk to tobs for the fist time.

local has_not_talked_to_tobs = true

-- Register the callback for the condition to use.
-- We can also handle updating the flag here, or you can use
-- the optional "call_event" property.

-- We return true if the player has not talked to tobs.  Otherwise
-- we return false meaning they have talked to tobs.  

Dialogue_System.register_callback("has_not_talked_to_tobs", function()
	local tmp = has_not_talked_to_tobs

	if(has_not_talked_to_tobs) then
		has_not_talked_to_tobs = false
	end

	return tmp
end)
