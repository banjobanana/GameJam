extends Node2D

var rng = RandomNumberGenerator.new() 
@onready var player: player_class = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open("user://seed.dat",FileAccess.READ)
	rng.seed = file.get_64()
	var pos = rng.randi_range(1,4)
	match pos:
		1:
			player.position = Vector2(382,-88)
		2:
			player.position = Vector2(455,-54)
		3:
			player.position = Vector2(376,-19)
		4:
			player.position = Vector2(-39,-291)
