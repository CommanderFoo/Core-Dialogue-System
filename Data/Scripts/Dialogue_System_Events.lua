local Dialog_Events = {

	events = {},
	id = 1

}

function Dialog_Events.on(evt, fn)
	table.insert(Dialog_Events.events, #Dialog_Events.events + 1, {
		
		event = evt,
		func = fn,
		id = Dialog_Events.id
	
	})

	Dialog_Events.id = Dialog_Events.id + 1

	return Dialog_Events.id - 1	
end

function Dialog_Events.off(event_id)
	for i, e in ipairs(Dialog_Events.events) do
		if(event_id == e.id) then
			Dialog_Events.events[i] = nil
		end
	end
end

function Dialog_Events.trigger(...)
	local args = {...}

	for i, e in ipairs(Dialog_Events.events) do
		if(e.event == args[1]) then
			e.func(args[2], args[3], args[4], args[5])
		end
	end
end

return Dialog_Events