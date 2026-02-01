extends Label

func _ready() -> void:
	if GlobalTimer.label:
		text = "Time Elapsed: " + GlobalTimer.label.text
	else:
		text = "Erorr. Its supposed to show ther time you took but something is going really wrong idk happaned :/"
