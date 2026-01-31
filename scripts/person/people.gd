extends Node2D

class_name People

@export var person_packed: PackedScene



func create_people(num_of_people: int):
	for i in range(num_of_people):
		var person: Person = person_packed.instantiate()
		add_child(person)
		
		$"../CanvasLayer/Top/LoversLeftCount".text = str(num_of_people / 2)
func erase_game():
	for child in get_children():
		child.queue_free()
