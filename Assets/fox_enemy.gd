extends CharacterBody2D

@export var speed = 120.0 
var pelaaja = null

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D

func _ready():
	# Etsitään pelaaja ryhmästä "Pelaaja"
	pelaaja = get_tree().get_first_node_in_group("Pelaaja")
	
	# Etäisyydet, jolloin kettu katsoo olevansa perillä kohteessa
	nav_agent.path_desired_distance = 4.0
	nav_agent.target_desired_distance = 4.0

func _physics_process(_delta):
	# 1. Jos pelaajaa ei löydy, ei tehdä mitään
	if not pelaaja:
		return

	# 2. Päivitetään ketun maali siilin nykyiseen sijaintiin
	nav_agent.target_position = pelaaja.global_position
	
	# 3. KORJAUS JÄHMETTYMISEEN: Odotetaan, että Godotin navigointikartta on valmis.
	# Jos reittiä ei ole vielä ehditty laskea fysiikkamoottorissa, hypätään tämän kierroksen yli.
	if not nav_agent.is_target_reachable() and nav_agent.get_next_path_position() == global_position:
		return

	# 4. Jos ollaan jo siilin luona, pysäytetään liike
	if nav_agent.is_navigation_finished():
		return

	# 5. Liikkumislogiikka
	var current_pos = global_position
	var next_path_pos = nav_agent.get_next_path_position()
	
	# Lasketaan suunta seuraavaan pisteeseen ja kerrotaan se nopeudella
	var uusi_velocity = (next_path_pos - current_pos).normalized() * speed
	
	velocity = uusi_velocity
	move_and_slide()

func _on_tappo_alue_body_entered(body: Node2D):
	# Jos kettu osuu pelaajaan, tehdään vahinkoa
	if body.is_in_group("Pelaaja"):
		if body.has_method("ota_vahinkoa"):
			body.ota_vahinkoa()
