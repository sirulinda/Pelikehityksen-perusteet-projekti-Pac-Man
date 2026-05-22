extends CharacterBody2D

class_name Player

@export var speed = 300
var movement_direction = Vector2.ZERO

var score = 0

func add_score(amount):
	score += amount
	print("Points: ", score)

@onready var sprite = $Sprite2D 

func _physics_process(_delta):
	get_input()
	
	velocity = movement_direction * speed
	move_and_slide()
	
func get_input():
	
	movement_direction = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		movement_direction = Vector2.LEFT
		sprite.flip_h = true  
	elif Input.is_action_pressed("right"):
		movement_direction = Vector2.RIGHT
		sprite.flip_h = false 
		


	elif Input.is_action_pressed("down"):
		movement_direction = Vector2.DOWN
	elif Input.is_action_pressed("up"):
		movement_direction = Vector2.UP

var elamat = 3

func ota_vahinkoa():
	elamat -= 1
	print("Auts! Elämiä jäljellä: ", elamat)
	
	if elamat <= 0:
		peli_loppui()
	else:
		palaa_alkuun()

func palaa_alkuun():
	
	position = Vector2(100, 100) 

func peli_loppui():
	print("Game Over")
	get_tree().reload_current_scene()
