# UISoundManager.gd
extends Node

@onready var player: AudioStreamPlayer2D = $AudioStreamPlayer2D

func play_audio(sound: AudioStream):
	player.stream = sound
	player.play()
	print("PLAYING")
