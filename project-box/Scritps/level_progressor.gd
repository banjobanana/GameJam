extends Area2D

var playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.READ)
var playerprogress
var roomlistfile = FileAccess.open("user://roomlist.dat",FileAccess.READ)
var roomlist

@onready var level_manager: Node = %LevelManager

func _on_level_manager_next() -> void:
	roomlist = roomlistfile.get_csv_line()
	playerprogress = playerprogressfile.get_64()
	#get_tree().change_scene_to_file(roomlist[playerprogress])
	

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		level_manager.NextLevel() # Replace with function body.
