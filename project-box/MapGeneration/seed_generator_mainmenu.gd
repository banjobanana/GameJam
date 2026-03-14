extends Node

var rng = RandomNumberGenerator.new()

@onready var line_edit: LineEdit = $LineEdit


func _ready() -> void:
	#rng.seed=hash("19")
	pass

func _on_button_button_down() -> void:
	
	#ONLY SET SEED HERE, WHEN SEED IS SET RNG STATE IS RESET
	
	var prehashed = str(randi() % 1000)#random seed gen if no seed is entered
	
	#setting seed of rng machine based on input
	if line_edit.text!="":
		prehashed = line_edit.text#sets seed to entered value
		rng.seed = hash(line_edit.text)
	else:
		rng.seed = hash(prehashed)
	print("seed: ",prehashed)
	
	#writing seed to file for access
	var file = FileAccess.open("user://seed.dat",FileAccess.WRITE)
	file.store_64(rng.seed)
	get_tree().change_scene_to_file("res://Levels/hub_area.tscn")
