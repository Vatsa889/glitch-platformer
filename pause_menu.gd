extends Control

@onready var options_menu = $OptionsMenu

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

func _on_resume_pressed():
	toggle_pause()

func _on_restart_pressed():
	toggle_pause() 
	get_tree().reload_current_scene()

func _on_quit_pressed():
	toggle_pause() 
	get_tree().change_scene_to_file("res://start_menu.tscn")

func _on_settings_button_pressed():
	options_menu.visible = true


## help I have 6h to qualify for overglade
