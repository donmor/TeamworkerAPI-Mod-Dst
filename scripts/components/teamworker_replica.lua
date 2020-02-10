local unserialize = function(str)
	local table = {}
	local e
	local p = 1
	for k, v in ipairs({string.byte(str,1,-1)}) do
		if v == 9 then
			e = string.sub(str, p, k - 1)
			p = k + 1
		elseif v == 10 then
			table[e] = string.sub(str, p, k - 1)
			p = k + 1
		end
	end
	return table
end

local TeamWorker = Class(function(self, inst)
	self.inst = inst
	self._teamidentifiers = net_string(inst.GUID, "teamworker._teamidentifiers")
end)

function TeamWorker:GetIdentifier(key)
	if key then
		return unserialize(self._teamidentifiers:value())[key]
	end
end

function TeamWorker:Identify(target, key)
	if not target or not target.replica.teamworker then
		return false
	end
	if key then
		return target.replica.teamworker:GetIdentifier(key) == self:GetIdentifier(key)
	end
	for k, v in pairs(unserialize(self._teamidentifiers:value())) do
		if target.replica.teamworker:GetIdentifier(k) == v then
			return true
		end
	end
	return false
end

return TeamWorker
