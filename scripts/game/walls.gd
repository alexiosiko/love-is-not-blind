extends Area2D

func _ready() -> void:
	body_entered.connect(on_body_entered)
	
func on_body_entered(body: Node2D):
	if body is Person:
		print(body.move_delta)
		body.move_delta *= -1
		print(body.move_delta)
		
