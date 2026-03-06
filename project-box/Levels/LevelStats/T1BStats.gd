extends LevelStats

func EnterLevel():
	Spawnpoint = Vector2(578,484)
	#REWARDLIST AND PROBABILITIES MUST BE OF SAME SIZE!!!
	RewardList = ["NewWeapon","Artifact"]#possible rewards
	Probabilties = [1,1]#rarity of corresponding index reward in rewardlist

func GetSpawnPoint():
	return Spawnpoint

func GetRewardList():
	return RewardList

func GetRewardProbalities():
	return Probabilties
