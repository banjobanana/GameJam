extends Node

var rng = RandomNumberGenerator.new()

#signal seed(cSeed)

@onready var line_edit: LineEdit = $LineEdit

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
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")
	# Replace with function body.
