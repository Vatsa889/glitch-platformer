extends Control

func _ready():
	visible = false 

func _on_back_button_pressed():
	visible = false


func _on_master_slider_value_changed(value):
	volume(0, value)

func _on_music_slider_value_changed(value):
	volume(1, value)

func _on_sfx_slider_value_changed(value):
	volume(2, value)

func volume(bus_index, value):
	if value <= 0:
		AudioServer.set_bus_mute(bus_index, true)
	else:
		AudioServer.set_bus_mute(bus_index, false)
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
