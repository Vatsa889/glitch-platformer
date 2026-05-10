extends Node2D

func _ready():
	# loads gameplay music
	var game_music = load("res://audio/retro-retro-synthwave-gaming-music-270173.mp3")
	MusicManager.play_music(game_music)
