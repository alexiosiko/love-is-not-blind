extends Node2D

@onready var drag_and_drop = $DragAndDrop
@onready var intersect_point = $IntersectPoint

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse1"):
		var node: Node2D = intersect_point.get_person()
		if node is Person:
			drag_and_drop.start_drag(node)
