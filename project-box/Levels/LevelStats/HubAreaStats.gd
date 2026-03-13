extends LevelStats

var rng = RandomNumberGenerator.new()
var file = FileAccess.open("user://seed.dat",FileAccess.READ)
var playerprogress
var playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.READ)
@onready var item_1: Node = $Item1
@onready var item_2: Node = $Item2
@onready var item_3: Node = $Item3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Hub = true
	rng.seed = file.get_64()
	playerprogress=0
	playerprogressfile.close()
	playerprogressfile = FileAccess.open("user://playerprogress.dat",FileAccess.WRITE)
	playerprogressfile.store_64(playerprogress)
	print(playerprogressfile.get_64())

func RandomizeItems():
	pass

func PersistentUpgrades():
	pass
