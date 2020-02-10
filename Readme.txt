团队合作API(Teamworker API) 1.0

※MOD制作初心者
※大量API修改, 兼容性注意

可以在多人服务器中划分阵营, 支持多种标识(identifier)并用
同一阵营玩家之间无法互相攻击

使用手册

组件TeamWorker默认已被添加到所有玩家

服务器端用法: 
	<PLAYER>.components.teamworker:SetIdentifier(<identifier>, <name>)	----设定玩家在指定标识下的阵营. 要删除标识, 请将<name>设为nil
	<PLAYER>.components.teamworker:GetIdentifier(<identifier>)			----获取玩家在指定标识下的阵营
	<PLAYER>.components.teamworker:Identify(<TARGET>, <identifier>)		----判断玩家与自身在指定标识下是否为盟友, 若省略<identifier>, 则对所有标识进行比较

客户端用法|Usage in client: 
	<PLAYER>.replica.teamworker:GetIdentifier(<identifier>)				----获取玩家在指定标识下的阵营
	<PLAYER>.replica.teamworker:Identify(<TARGET>, <identifier>)		----判断玩家与自身在指定标识下是否为盟友, 若省略<identifier>, 则对所有标识进行比较
