extends Node

@export var faces: Array[Texture2D]
@export var people: People


func _ready() -> void:
	people.create_people(2)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart_game"):
		people.start_game()
func win():
	print("win")
