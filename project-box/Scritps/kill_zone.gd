extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.TakeDamageEnvironment(5)
		#level_manager.Restart()
		#body.TakeDamage(5,character_body_2d.direction)
		print("Player should take damage and respawn at stable ground")
		#body.Die() # Replace with function body.
