extends Node

@onready var level_root: Node2D = $".."
@onready var player: player_class = %Player

func GameOver():
	print("GameOvering")

func Restart():
	print("Restarting")
	print(level_root.GetSpawnPoint())
	player.position = level_root.GetSpawnPoint()

#func _ready() -> void:
	#print(level_root.GetSpawnPoint())
