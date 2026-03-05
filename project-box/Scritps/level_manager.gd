extends Node

@onready var level_root: Node2D = $".."
@onready var player: player_class = %Player
@onready var room_lister: Node = %RoomLister

var roomlistfile = FileAccess.open("user://roomlist.dat",FileAccess.READ)
var playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.READ)
var playerprogress = playerprogressfile.get_64()

func GameOver():
	get_tree().change_scene_to_file("res://Scenes/hub_area.tscn")
	print("GameOvering")

func Restart():
	print("Restarting")
	print(level_root.GetSpawnPoint())
	player.position = level_root.GetSpawnPoint()

func NextLevel():
	playerprogressfile.close()
	playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.WRITE)
	playerprogressfile.store_64(playerprogress)
	var roomlist = roomlistfile.get_csv_line()
	#print("room list in the level: ",roomlist)
	get_tree().change_scene_to_file(roomlist[playerprogress])

func _on_progreesor_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		playerprogress+=1
		NextLevel()
