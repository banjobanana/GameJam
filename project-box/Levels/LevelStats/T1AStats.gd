extends LevelStats

func EnterLevel():
	Parkour = true
	Spawnpoint = Vector2(455,-63)
	EndPoint = Vector2(404,-320)
	#REWARDLIST AND PROBABILITIES MUST BE OF SAME SIZE!!!
	RewardList = ["HealthUP","DamageUP"]#possible rewards
	Probabilties = [2,0.5]#rarity of corresponding index reward in rewardlist

func GetSpawnPoint():
	return Spawnpoint

func GetRewardList():
	return RewardList

func GetRewardProbalities():
	return Probabilties

func GetEndPoint():
	return EndPoint
