extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Hedgehog":
		ScoreManager.lisaa_pisteita(2)
		
		queue_free()
		
		await get_tree().process_frame
		
		
		var jaljella_olevat_sydamet = get_tree().get_nodes_in_group("Heart")
		
		if jaljella_olevat_sydamet.size() == 0:
			get_tree().change_scene_to_file("res://Scenes/you_win.tscn")
