extends Node2D

var rng = RandomNumberGenerator.new()
var file = FileAccess.open("user://seed.dat",FileAccess.READ)

@onready var item_1: Node = $Item1
@onready var item_2: Node = $Item2
@onready var item_3: Node = $Item3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.seed = file.get_64()

func RandomizeItems():
	pass

func PersistentUpgrades():
	pass
