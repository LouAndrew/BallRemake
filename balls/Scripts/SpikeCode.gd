extends StaticBody2D

onready var player = get_tree().get_nodes_in_group("player")[0]

func _ready():
	pass 
	
func _process(delta):
	playerDetect(delta)
	
func playerDetect(delta):
	print(player.global_position.distance_to(self.global_position) )
	if player.global_position.distance_to(self.global_position) <= 100:
		$pointBubble.visible = true
		print("hello")
		
func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
	
func interpolateElPos(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPosition,t)
