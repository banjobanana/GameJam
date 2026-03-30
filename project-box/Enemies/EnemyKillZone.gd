extends Area2D
@onready var character_body_2d: CharacterBody2D = $".."

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.TakeDamage(5,character_body_2d.direction)
		print("ENemioattack")
