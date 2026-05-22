extends Control

func _on_play_pressed() -> void:
	# Vaihdetaan näkymä Assets-kansiossa olevaan pelikenttään
	get_tree().change_scene_to_file("res://Assets/main.tscn")

func _on_quit_pressed() -> void:
	# Suljetaan peli
	get_tree().quit()
