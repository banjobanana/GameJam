extends LevelStats

func EnterLevel():
	Spawnpoint = Vector2(455,-63)
	#REWARDLIST AND PROBABILITIES MUST BE OF SAME SIZE!!!
	RewardList = ["HealthUP","DamageUP"]#possible rewards
	Probabilties = [2,0.5]#rarity of corresponding index reward in rewardlist

func GetSpawnPoint():
	return Spawnpoint

func GetRewardList():
	return RewardList

func GetRewardProbalities():
	return Probabilties
