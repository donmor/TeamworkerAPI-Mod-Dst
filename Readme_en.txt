Teamworker API 1.0

*Beginner in MOD crafting
*Modified APIs

Divide players into different teams in servers. Supports multiple identifiers the same time.
You can't attack players in the same team.

Documentation

The component TeamWorker has been added to all players by default.

Usage in server: 
	<PLAYER>.components.teamworker:SetIdentifier(<identifier>, <name>)	----Define the team name of the player under the specified identifier. Set <name> to nil to remove the identifier.
	<PLAYER>.components.teamworker:GetIdentifier(<identifier>)			----Get the team name of the player under the specified identifier.
	<PLAYER>.components.teamworker:Identify(<TARGET>, <identifier>)		----Determine if the player and himself are allies under the specified identifier, or under all identifiers if <identifier> is nil.

Usage in client: 
	<PLAYER>.replica.teamworker:GetIdentifier(<identifier>)				----Get the team name of the player under specific identifier.
	<PLAYER>.replica.teamworker:Identify(<TARGET>, <identifier>)		----Determine if the player and himself are allies under the specified identifier, or under all identifiers if <identifier> is nil.
