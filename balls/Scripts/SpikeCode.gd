extends StaticBody2D

onready var player = get_tree().get_nodes_in_group("player")[0]

var showPoints:bool = true

	
func _process(delta):
	playerDetect(delta)
	
func playerDetect(delta):
	if player.global_position.distance_to(self.global_position) < 100 and showPoints:
		$pointBubble.visible = showPoints
		interpolateElPos(delta,Vector2(0,-220),$pointBubble)
		interpolateElScale(delta,Vector2(1.4,1.4),$pointBubble)
		yield(get_tree().create_timer(2.0),"timeout")
		showPoints = false
		$pointBubble.visible = showPoints
		
func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
	
func interpolateElPos(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPosition,t)
