extends Node

var label: Label

var time_elapsed: float = 0.0  # seconds

func _ready() -> void:
	await get_tree().process_frame
	label.text = "0:00"

func _process(delta: float) -> void:
	time_elapsed += delta
	update_label()

func update_label() -> void:
	var minutes = int(time_elapsed / 60)
	var seconds = int(time_elapsed) % 60
	label.text = str(minutes) + ":" + str(seconds).pad_zeros(2)
