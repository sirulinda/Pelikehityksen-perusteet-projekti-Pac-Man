extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
   
	if body.name == "Player": 
	   
		ScoreManager.add_score(2)

		queue_free()
