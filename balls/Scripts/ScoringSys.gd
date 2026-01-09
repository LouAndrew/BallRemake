extends Node

var scores:Array = [0,0,0,0,0,0,0,0]
var newScores:Array = [0,0,0,0,0,0,0,0]

var deathScore:Array = [0,0,0,0,0,0,0,0]
var newDeathScore:Array = [0,0,0,0,0,0,0,0]

var lives:int = 1

func _ready() -> void:
	pass 
	
func _process(_delta: float) -> void:
	levelScoreUpdate()
	
func levelScoreUpdate():
	for i in newScores.size():
		if newScores[i] > scores[i]:
			scores[i] = newScores[i]
		if newDeathScore[i] > deathScore[i]:
			deathScore[i] = newDeathScore[i]
