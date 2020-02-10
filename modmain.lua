local function nCombatR(self)
	self.IsValidTarget = function(self, target)
		if target == nil or
			target == self.inst or
			not (target.entity:IsValid() and target.entity:IsVisible()) then
			return false
		end
		local weapon = self:GetWeapon(self)
		return self:CanExtinguishTarget(target, weapon)
			or self:CanLightTarget(target, weapon)
			or (target.replica.combat ~= nil and
				target.replica.health ~= nil and
				not target.replica.health:IsDead() and
				not (target:HasTag("shadow") and self.inst.replica.sanity == nil) and
				not (target:HasTag("playerghost") and (self.inst.replica.sanity == nil or self.inst.replica.sanity:IsSane())) and
				-- gjans: Some specific logic so the birchnutter doesn't attack it's spawn with it's AOE
				-- This could possibly be made more generic so that "things" don't attack other things in their "group" or something
				(not self.inst:HasTag("birchnutroot") or not (target:HasTag("birchnutroot") or target:HasTag("birchnut") or target:HasTag("birchnutdrake"))) and 
				(GLOBAL.TheNet:GetPVPEnabled() and not (self.inst.replica.teamworker and self.inst.replica.teamworker:Identify(target)) or not (self.inst:HasTag("player") and target:HasTag("player")) or (weapon ~= nil and weapon:HasTag("propweapon"))) and
				target:GetPosition().y <= self._attackrange:value())
	end
	
	self.IsAlly = function(self, guy)
		if guy == self.inst or
			(self.inst.replica.follower ~= nil and guy == self.inst.replica.follower:GetLeader()) then
			--It's me! or it's my leader
			return true
		end
		local follower = guy.replica.follower
		local leader = follower ~= nil and follower:GetLeader() or nil
		--It's my follower
		--or I'm a player and it's a companion (or following another player in non PVP)
		--unless it's attacking me
		return self.inst == leader
        or (    self.inst:HasTag("player") and
                (   guy:HasTag("companion") or
                    (   leader ~= nil and
                        (not GLOBAL.TheNet:GetPVPEnabled() or (self.inst.replica.teamworker and self.inst.replica.teamworker:Identify(leader))) and
                        leader:HasTag("player")
                    )
                ) and
                (   guy.replica.combat == nil or
                    guy.replica.combat:GetTarget() ~= self.inst
                )
            )
	end
end
AddClassPostConstruct("components/combat_replica", nCombatR)

AddPlayerPostInit(function(inst)
	if GLOBAL.TheWorld.ismastersim then
		inst:AddComponent("teamworker")
	end
end)

AddReplicableComponent("teamworker")