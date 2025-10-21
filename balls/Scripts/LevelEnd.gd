extends Area2D

var playerHere:bool = false

func _process(_delta: float) -> void:
	playerDetect()
func playerDetect():
	var overLappingBodies = $".".get_overlapping_bodies()
	for bod in overLappingBodies:
		if bod.is_in_group("player"):
			playerHere = true
