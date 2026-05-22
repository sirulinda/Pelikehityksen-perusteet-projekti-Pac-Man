extends Control

func _on_button_pressed() -> void:
	if typeof(ScoreManager) != TYPE_NIL:
		ScoreManager.score = 0
	get_tree().change_scene_to_file("res://Assets/main.tscn")
