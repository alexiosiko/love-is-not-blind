extends Button

@export var scene_to_load: PackedScene  # Drag your scene here in the Inspector

func _ready() -> void:
	# Connect the pressed signal
	self.pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(scene_to_load)
