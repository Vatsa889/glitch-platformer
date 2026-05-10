extends Node

@onready var music_player = $AudioStreamPlayer

func play_music(song_stream: AudioStream):
	if music_player.stream == song_stream and music_player.playing:
		return
	
	# if it's a new song, switch to it
	music_player.stream = song_stream
	music_player.play()
