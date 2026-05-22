extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Hedgehog":
		ScoreManager.lisaa_pisteita(2)
		
		# Poistetaan tämä sydän pelistä heti
		queue_free()
		
		# Kutsutaan pientä viivettä, jotta Godot ehtii laskea jäljellä olevat sydämet oikein
		await get_tree().process_frame
		
		# Haetaan listaus kaikista kentällä vielä olevista sydämistä
		# HUOM! Tämän toimivuus vaatii, että kaikki sydämet ovat samassa "Heart"-ryhmässä (ohje alla)
		var jaljella_olevat_sydamet = get_tree().get_nodes_in_group("Heart")
		
		# Jos sydämiä ei ole enää yhtään jäljellä, pelaaja voitti!
		if jaljella_olevat_sydamet.size() == 0:
			get_tree().change_scene_to_file("res://Scenes/you_win.tscn")
