extends Button

@export var scene_to_load: PackedScene  # Drag your scene here in the Inspector
@export var click_sound_stream: AudioStream
@export var hover_audio_stream: AudioStream

func _ready() -> void:
	mouse_entered.connect(_on_hover)

	self.pressed.connect(_on_pressed)
func _on_hover() -> void:
	GlobalAudioStream.play_audio(hover_audio_stream)
func _on_pressed() -> void:
	GlobalAudioStream.play_audio(click_sound_stream)
	get_tree().change_scene_to_packed(scene_to_load)
