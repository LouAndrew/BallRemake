extends Sprite

onready var scoreLabel:Label = $scoreValue
onready var deathScoreLabel:Label = $deathValue

onready var livesText:Label = $Sprite/livesLabel

var deathTotal:int = 0
var scoreTotal:int = 0 


func _ready() -> void:
	calcTotalScores()
	insertScoreValues()
	displayLives()
	
func calcTotalScores():
	for i in ScoringSys.deathScore.size():
		deathTotal += ScoringSys.deathScore[i]
		scoreTotal += ScoringSys.scores[i]
func insertScoreValues():
	scoreLabel.set_text(str(scoreTotal))
	deathScoreLabel.set_text(str(deathTotal))
	
func displayLives():
	livesText.set_text("Spawners: "+str(ScoringSys.lives))
	
