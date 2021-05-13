local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))

local Bark_Entry = {}

function Bark_Entry:init()
	self.text = self:get_prop("text")
	self.exit_bark = self:get_prop("exit_bark")
	self.played = false
end

function Bark_Entry:has_played()
	return self.played
end

function Bark_Entry:play()
	local a = World.SpawnAsset(self.bark_template)

	a:FindChildByName("World Text").text = self.text

	self.actor:AttachCoreObject(a, "head")
	self.played = true
end

function Bark_Entry:is_exit_bark()
	return self.exit_bark
end

function Bark_Entry:reset()
	self.played = false
end

function Bark_Entry:get_prop(prop, wait)
	if(wait) then
		return self.root:GetCustomProperty(prop):WaitForObject()
	end

	return self.root:GetCustomProperty(prop)
end

function Bark_Entry:new(entry, opts)
	self.__index = self

	local o = setmetatable({

		root = entry,
		actor = opts.actor,
		bark_template = opts.bark_template

	}, self)

	o:init()

	return o
end

return Bark_Entry