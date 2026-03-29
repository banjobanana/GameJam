extends Area2D

@onready var player: player_class = %Player
@onready var level_manager: Node = %LevelManager

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.TakeDamageEnvironment(5)
		level_manager.Restart()
		#body.TakeDamage(5,character_body_2d.direction)
		print("Player should take damage and respawn at stable ground")
		#body.Die() # Replace with function body.
