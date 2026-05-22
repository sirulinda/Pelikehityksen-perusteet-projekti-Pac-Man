extends Node

var score = 0 

func lisaa_pisteita(amount):
	score += amount
	print("Pisteet: ", score)

func vahenna_pisteita(maara: int) -> void:
	score -= maara
	if score < 0:
		score = 0
