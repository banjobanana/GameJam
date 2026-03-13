extends LevelStats


func _ready() -> void:
	pass#print("level3")

func EnterLevel():
	Platformed=true
	Spawnpoint = Vector2(1066,513)
	EndPoint = Vector2(1088,257)
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
 
