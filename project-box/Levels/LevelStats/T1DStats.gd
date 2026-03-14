extends LevelStats

var totalEnemies = 4
var killedEnemies=0

func EnterLevel():
	Combat = true
	Spawnpoint = Vector2(601,335)
	EndPoint = Vector2(601,352)
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
