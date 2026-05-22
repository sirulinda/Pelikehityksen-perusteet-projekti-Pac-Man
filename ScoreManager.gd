extends Node

var score = 0 

func add_score(amount):
	score += amount
	print("Pisteet: ", score)

func vahenna_pisteita(maara: int) -> void:
	score -= maara
	# Estetään pisteitä menemästä miinuksen puolelle, jos haluat
	if score < 0:
		score = 0
	
	# Päivitetään tekstikenttä ruudulla, jos sinulla on se täällä
	# label.text = "Pisteet: " + str(score)
