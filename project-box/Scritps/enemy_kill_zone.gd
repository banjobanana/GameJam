extends Area2D

func _on_body_entered(body: Node2D) -> void:
	#print(body)
	if body is Enemy:
		body.Die() # Replace with function body.
