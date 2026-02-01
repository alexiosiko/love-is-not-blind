extends AnimatedSprite2D


func play_mask_change() -> void:
	play("change_mask")
	await get_tree().create_timer(0.9).timeout
	play("walk")
