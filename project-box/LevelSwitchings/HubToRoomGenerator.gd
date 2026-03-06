extends Area2D

var playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.READ)
var playerprogress
var roomlistfile = FileAccess.open("user://roomlist.dat",FileAccess.READ)
var roomlist

#@onready var level_manager: Node = %LevelManager

func _ready() -> void:
	pass 
	

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		get_tree().change_scene_to_file("res://Scenes/RoomGeneratorScene.tscn")
