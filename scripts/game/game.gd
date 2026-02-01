extends Node

@export var faces: Array[Texture2D]
@onready var people: People = $"../People"

@export var num_of_people: int

func _ready() -> void:
	faces = load_faces_from_folder("res://sprites/masks/")
	if get_tree().current_scene.name == "1":
		GlobalTimer.reset_timer()
	people.create_people(num_of_people)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart_game"):
		people.start_game()
	
func level_win():
	var c: Node = get_tree().current_scene
	await get_tree().create_timer(0.2).timeout
	$WinStream.play()
	if c.name == "2":
		game_win()
	else:
		await get_tree().create_timer(1).timeout
		var new_scene_number = str(c.name.to_int() + 1)
		var new_scene_name = "res://scenes/levels/" + new_scene_number + ".tscn"
		print("loading scene: " + new_scene_name)
		get_tree().change_scene_to_file(new_scene_name)
		

func game_win():
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/win.tscn")
	
func load_faces_from_folder(path: String) -> Array[Texture2D]:
	var result: Array[Texture2D] = []

	var dir := DirAccess.open(path)
	if dir == null:
		push_error("Could not open directory: " + path)
		return result

	dir.list_dir_begin()
	var file_name := dir.get_next()

	while file_name != "":
		if not dir.current_is_dir() and file_name.ends_with(".png"):
			var full_path = path + "/" + file_name
			var tex := load(full_path)
			if tex:
				result.append(tex)
		file_name = dir.get_next()

	dir.list_dir_end()
	return result
