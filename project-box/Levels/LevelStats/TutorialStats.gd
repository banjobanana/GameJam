extends LevelStats



func EnterLevel():
	Tutorial=true
	Spawnpoint = Vector2(136,592)
	RewardList = ["RewardA","RewardB"]
	Probabilties = [1,1]

func GetRewardList():
	return RewardList

func GetRewardProbalities():
	return Probabilties

func GetSpawnPoint():
	return Spawnpoint
