extends Area2D

@onready var congrats = get_parent().get_node("DudeFull").get_node("Camera2D").get_node("Label3")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "DudeFull":
		body.score += 1
		self.queue_free()
		print(body.score)

	if body.score == 8:
		congrats.visible = true
		
