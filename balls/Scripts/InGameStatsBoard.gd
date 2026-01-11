extends Node

onready var scoreLabel:Label = $ScoreBoard/scoreValue
onready var deathLabel:Label = $DeathBoard/deathValue

onready var livesText:Label = $sprite/livesLabel

func _ready() -> void:
	for i in ScoringSys.scores.size():
		ScoringSys.newDeathScore[i] = 0
		ScoringSys.newScores[i] = 0

func _process(_delta: float) -> void:
	displayStats()
	livesText.set_text("Spawners: " + str(ScoringSys.lives))
	
func displayStats():
	scoreLabel.set_text(str(ScoringSys.newScores[LevelMonitor.currentLevel]))
	deathLabel.set_text(str(ScoringSys.newDeathScore[LevelMonitor.currentLevel]))
