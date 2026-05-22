extends CharacterBody2D

@export var speed = 100.0
@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
@onready var player = $"../Player"
@onready var aloituspaikka = global_position

func _physics_process(delta: float) -> void:
	if player:
		nav_agent.target_position = player.global_position
	
	if nav_agent.is_navigation_finished():
		return

	var current_pos = global_position
	var next_path_pos = nav_agent.get_next_path_position()
	
	var uusi_velocity = (next_path_pos - current_pos).normalized() * speed
	velocity = uusi_velocity
	move_and_slide()

func _on_tappoalue_body_entered(body: Node2D) -> void:
	if body.name == "Player" or body.name == "Hedgehog":
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
