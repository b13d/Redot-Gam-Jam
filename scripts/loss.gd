extends CanvasLayer

func _on_button_pressed() -> void:
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://levels/level_3(boss).tscn")
