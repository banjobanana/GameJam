extends Area2D

var playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.READ)
var playerprogress
var roomlistfile = FileAccess.open("user://roomlist.dat",FileAccess.READ)
var roomlist
@onready var player: player_class = %Player
@onready var label: Label = $Label
@onready var level_manager: Node = %LevelManager

#@onready var level_manager: Node = %LevelManager

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if overlaps_body(player):
		if Input.is_action_just_pressed("Interact"):
			#level_manager.playerprogress+=1
			print("Nextlevel")
			level_manager.NextLevel()

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		label.visible = true # Replace with function body.
