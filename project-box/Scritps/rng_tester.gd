extends Node

var rng = RandomNumberGenerator.new()

@onready var line_edit: LineEdit = $LineEdit

var levels = ["res://Scenes/node_2d.tscn","res://Scenes/Areana.tscn"]

func _ready() -> void:
	pass

func _on_button_button_down() -> void:
	if line_edit.text=="":
		rng.seed = randi() % 100
		#rng.seed = str(randi() % 100).hash()
	else:
		rng.seed = line_edit.text.hash()
	#print(rng.seed)
	var file = FileAccess.open("user://seed.dat",FileAccess.WRITE)
	file.store_64(rng.seed)
	var level = rng.randi_range(0,1)
	get_tree().change_scene_to_file(levels[level])
	# Replace with function body.
