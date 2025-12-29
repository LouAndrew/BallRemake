extends StaticBody2D

onready var player = get_tree().get_nodes_in_group("player")[0]

var showScore:bool 
var detectPlayer:bool = true
var score:int = 5

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	playerDetect(delta)
	
func playerDetect(delta):
	if showScore:
		$pointBubble.visible = true
		interpolatePosition(delta,Vector2(0,-200),$pointBubble)
		interpolateScale(delta,Vector2(1.7,1.7),$pointBubble)
		yield(get_tree().create_timer(0.9),"timeout")
		$pointBubble.visible = false
	if player.global_position.distance_to(self.global_position) < 100 and detectPlayer:
		showScore = true
		ScoringSys.newLevelScore[LevelMonitor.currentLevel] += score
		detectPlayer = false
		
func interpolatePosition(delta,targetPositionUI:Vector2,Ui_element):
	var t :float= 0.3
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPositionUI,t)
	
func interpolateScale(delta,targetPositionUI:Vector2,Ui_element):
	var t :float= 0.3
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPositionUI,t)
