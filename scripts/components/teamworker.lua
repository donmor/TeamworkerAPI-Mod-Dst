local onteamidentifiers = function(self, teamidentifiers)
	local str = ""
	for k, v in pairs(teamidentifiers) do
		str = str..k.."\t"..v.."\n"
	end
	self.inst.replica.teamworker._teamidentifiers:set(str)
end

local TeamWorker = Class(function(self, inst)
	self.inst = inst
	self.teamidentifiers = {}
end,
nil,
{
	teamidentifiers = onteamidentifiers
})

function TeamWorker:SetIdentifier(key, value)
	if key then
		local i = self.teamidentifiers
		i[key] = value
		self.teamidentifiers = i
	end
end

function TeamWorker:GetIdentifier(key)
	if key then
		return self.teamidentifiers[key]
	end
end

function TeamWorker:Identify(target, key)
	if not target or not target.components.teamworker then
		return false
	end
	if key then 
		return  self.teamidentifiers[key] == target.components.teamworker.GetIdentifier(key)
	end
	for k, v in pairs(self.teamidentifiers) do
		if v == target.components.teamworker:GetIdentifier(k) then
			return true
		end
	end
	return false
end

function TeamWorker:OnSave()
	local data = { teamidentifiers = self.teamidentifiers }
	return data
end

function TeamWorker:OnLoad(data, newents)
	if data.teamidentifiers then
		self.teamidentifiers = data.teamidentifiers
	end
end

return TeamWorker