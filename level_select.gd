extends Control

func _on_level_1_btn_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")

func _on_level_2_btn_pressed():
	print("Level 2 is not done yet")

func _on_shop_btn_pressed():
	get_tree().change_scene_to_file("res://shop_menu.tscn")

func _on_back_btn_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")
