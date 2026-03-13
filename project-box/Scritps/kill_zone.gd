extends Area2D

@onready var player: player_class = %Player

func _on_body_entered(body: Node2D) -> void:
	#print(body)
	if body.name == "Player":
		body.Respawn()
		print("Player should take damage and respawn at stable ground")
		#body.Die() # Replace with function body.
