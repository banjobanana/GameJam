extends Node

var rng = RandomNumberGenerator.new()

@onready var level_root: LevelStats = $".."
@onready var player: player_class = %Player
@onready var wait_beofre_level_change: Timer = $WaitBeofreLevelChange
@onready var progressor: Area2D = %Progressor

#@onready var level_manager: Node= %LevelManager

var roomlistfile = FileAccess.open("user://roomlist.dat",FileAccess.READ)
var playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.READ)
var seedfile = FileAccess.open("user://seed.dat",FileAccess.READ)
var playerprogress = playerprogressfile.get_64()

var IsLevelCompleted: bool = false
var enemyCount
var enemyKilled=0

func _ready() -> void:
	rng.seed = seedfile.get_64()
	level_root.EnterLevel()
	#print(playerprogress)
	if level_root.Combat:
		enemyCount = level_root.totalEnemies

func GameOver():
	if level_root.Tutorial:
		Restart()	
	else:
		get_tree().change_scene_to_file("res://Levels/hub_area.tscn")
		#print("GameOvering")

func Restart():
	#print("Restarting")
	#print(level_root.GetSpawnPoint())
	player.position = level_root.GetSpawnPoint()

func LevelComplete():
	GetReward()
	if IsLevelCompleted:
		return
	playerprogress+=1
	print(playerprogress)
	playerprogressfile.close()
	playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.WRITE)
	playerprogressfile.store_64(playerprogress)
	playerprogressfile.close()
	playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.READ)
	print("Level Complete: ",playerprogressfile.get_64())
	progressor.position = level_root.GetEndPoint()

func NextLevel():
	if level_root.Tutorial:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	elif level_root.Hub:
		#print("Player progress in Hub: ", playerprogressfile.get_64())
		get_tree().change_scene_to_file("res://MapGeneration/RoomGeneratorScene.tscn")
	else:
		var roomlist = roomlistfile.get_csv_line()
		print(roomlist[playerprogress])
		get_tree().change_scene_to_file(roomlist[playerprogress])

func GetReward():
	if !IsLevelCompleted:
		print(level_root.GetRewardList()[rng.rand_weighted(level_root.GetRewardProbalities())])

func EnemyCleared():
	if enemyKilled==enemyCount and not IsLevelCompleted:
		LevelComplete()
		IsLevelCompleted=true

func _on_level_complete_marker_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		LevelComplete()
		IsLevelCompleted=true
