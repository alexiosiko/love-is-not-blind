extends Area2D

func _ready() -> void:
	for c in $"../WallBody".get_children():
		var _c = c.duplicate()
		add_child(_c)
		
	body_entered.connect(on_body_entered)
	
func on_body_entered(body: Node2D):
	if body is Person:
		body.move_delta *= -1
