name = "Teamworker API"
version = "1.0.0.1"
description = [[
团队合作API(Teamworker API) 1.0

※MOD制作初心者|Beginner in MOD crafting
※大量API修改, 兼容性注意|Modified APIs
可以在多人服务器中划分阵营, 支持多种标识(identifier)并用|Divide players into different teams in servers. Supports multiple identifiers the same time.
同一阵营玩家之间无法互相攻击|You can't attack players in the same team.








使用手册|Documentation
组件TeamWorker默认已被添加到所有玩家|The component TeamWorker has been added to all players by default.
服务器端用法|Usage in server: 
	<PLAYER>.components.teamworker:SetIdentifier(<identifier>, <name>)	----设定玩家在指定标识下的阵营. 要删除标识, 请将<name>设为nil|Define the team name of the player under the specified identifier. Set <name> to nil to remove the identifier.
	<PLAYER>.components.teamworker:GetIdentifier(<identifier>)			----获取玩家在指定标识下的阵营|Get the team name of the player under the specified identifier.
	<PLAYER>.components.teamworker:Identify(<TARGET>, <identifier>)		----判断玩家与自身在指定标识下是否为盟友, 若省略<identifier>, 则对所有标识进行比较|Determine if the player and himself are allies under the specified identifier, or under all identifiers if <identifier> is nil.
客户端用法|Usage in client: 
	<PLAYER>.replica.teamworker:GetIdentifier(<identifier>)				----获取玩家在指定标识下的阵营|Get the team name of the player under specific identifier.
	<PLAYER>.replica.teamworker:Identify(<TARGET>, <identifier>)		----判断玩家与自身在指定标识下是否为盟友, 若省略<identifier>, 则对所有标识进行比较|Determine if the player and himself are allies under the specified identifier, or under all identifiers if <identifier> is nil.
]]
author = "donmor"
forumthread = ""
api_version = 10
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true 
icon_atlas = "modicon.xml"
icon = "modicon.tex"
server_filter_tags = {
	"utility",
}
