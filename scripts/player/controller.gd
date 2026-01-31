extends Node2D

@onready var drag_and_drop = $DragAndDrop
@onready var intersect_point = $IntersectPoint

@export var click_sound: AudioStream

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse1"):
		print("asdsa")
		
		var node: Node2D = intersect_point.get_person()
		if node is Person:
			drag_and_drop.start_drag(node)
		else:
			$AudioStreamPlayer2D.stream = click_sound
			$AudioStreamPlayer2D.play()
