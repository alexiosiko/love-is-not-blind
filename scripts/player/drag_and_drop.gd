extends Node2D

var drag_person: Person
signal made_lovers

@export var heart: PackedScene

func _input(event: InputEvent) -> void:
	if event.is_action_released("mouse1"):
		if drag_person:
			release()

func _process(delta: float) -> void:
	if drag_person:
		drag_person.global_position = get_global_mouse_position()
	
func start_drag(person: Person) -> void:
	drag_person = person
	drag_person.start_pickup()
	drag_person.set_collision_layer_value(1, false)
	

func release() -> void:
	var person: Person = $"../IntersectPoint".get_person()
	if person is Person:
		compare(person)
	else:
		drop()
		
func compare(person: Person):
	if person.mask_texture_filter_resource_path == drag_person.mask_texture_filter_resource_path:
		match_love(person)
	else:
		drop()
func drop() -> void:
	drag_person.set_collision_layer_value(1, true)
	drag_person.drop()
	drag_person = null
	
func match_love(person: Person):
	var pos: Vector2 = get_global_mouse_position()
	person.get_node("Body").flip_h = true
	person.global_position = pos + Vector2.RIGHT * 7
	drag_person.global_position = pos + Vector2.LEFT * 7
	
	drag_person.reparent($"../../Lovers")
	person.reparent($"../../Lovers")
	
	drag_person.set_loved(true)
	person.set_loved(true)
	
	drag_person.process_mode = Node.PROCESS_MODE_DISABLED
	person.process_mode = Node.PROCESS_MODE_DISABLED
	
	$"../CreateLoveStream".play()

	drag_person = null
	
	var heart = heart.instantiate()
	heart.global_position = pos + Vector2.UP * 16
	add_child(heart)
	
	made_lovers.emit()
