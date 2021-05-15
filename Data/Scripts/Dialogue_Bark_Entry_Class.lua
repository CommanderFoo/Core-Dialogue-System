local YOOTIL = require(script:GetCustomProperty("YOOTIL"))

local Dialogue_System_Events = require(script:GetCustomProperty("Dialogue_System_Events"))
local Dialogue_System_Tweens = require(script:GetCustomProperty("Dialogue_System_Tweens"))

local Bark_Entry = {}

function Bark_Entry:init()
	self.text = self:get_prop("text")
	self.scale = self:get_prop("scale")
	self.bg_color = self:get_prop("background_color")
	self.text_color = self:get_prop("text_color")

	self.exit_bark = self:get_prop("exit_bark")
	self.played = false
end

function Bark_Entry:has_played()
	return self.played
end

function Bark_Entry:play()
	local bark = World.SpawnAsset(self.bark_template)
	local world_text = bark:FindChildByName("World Text")
	local background = bark:FindChildByName("Background")

	world_text.text = ""
	world_text:SetColor(self.text_color)

	self.bg_color.a = 0
	background:SetColor(self.bg_color)
	background:SetWorldScale(self.scale)

	self.actor:AttachCoreObject(bark, "head")

	bark:SetPosition(Vector3.New(0, 0, self.bark_z_offset))

	local in_tween = YOOTIL.Tween:new(.2, { a = 0 }, { a = 1 })

	in_tween:on_change(function(c)
		self.bg_color.a = c.a

		background:SetColor(self.bg_color)
	end)

	in_tween:on_complete(function()
		world_text.text = self.text

		local out_tween = YOOTIL.Tween:new(.2, { a = 1 }, { a = 0 })

		out_tween:on_start(function()
			world_text.text = ""
		end)

		out_tween:on_change(function(c)
			self.bg_color.a = c.a

			background:SetColor(self.bg_color)
		end)

		out_tween:set_delay(2)
		out_tween:on_complete(function()
			bark:Destroy()
			Dialogue_System_Tweens.active_bark = nil
		end)

		Dialogue_System_Tweens.active_bark = out_tween
	end)

	self.played = true

	return in_tween
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
		bark_template = opts.bark_template,
		bark_z_offset = opts.bark_z_offset

	}, self)

	o:init()

	return o
end

return Bark_Entry