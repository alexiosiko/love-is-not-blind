extends Label

func _ready() -> void:
	$"../../../Controller/DragAndDrop".made_lovers.connect(on_made_lovers)

func on_made_lovers() -> void:
	var count = text.to_int() - 1
	text = str(count)
	if count == 0:
		$"../../../Game".win()
