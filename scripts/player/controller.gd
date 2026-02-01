extends Node2D

@onready var drag_and_drop = $DragAndDrop
@onready var intersect_point = $IntersectPoint

@export var click_sound: AudioStream
@export var default_cursor: Texture2D
@export var click_cursor: Texture2D

func _ready() -> void:
	Input.set_custom_mouse_cursor(default_cursor)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# change cursor ON CLICK
			Input.set_custom_mouse_cursor(click_cursor)

			var node: Node2D = intersect_point.get_person()
			if node is Person:
				drag_and_drop.start_drag(node)
			else:
				$MissAudio.stream = click_sound
				$MissAudio.play()
		else:
			# reset cursor ON RELEASE
			Input.set_custom_mouse_cursor(default_cursor)
