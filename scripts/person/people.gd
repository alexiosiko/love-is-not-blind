extends Node2D

class_name People

@export var person_packed: PackedScene

func _ready() -> void:
	$"../Controller/DragAndDrop".made_lovers.connect(on_made_lovers)

func on_made_lovers():
	if get_child_count() == 2:
		for c in get_children():
			c.set_random_face()
			
func create_people(num_of_people: int):
	for i in range(num_of_people):
		var person: Person = person_packed.instantiate()
		add_child(person)
		$"../CanvasLayer/Top/SinglesCount".text = str(num_of_people)
func erase_game():
	for child in get_children():
		child.queue_free()
