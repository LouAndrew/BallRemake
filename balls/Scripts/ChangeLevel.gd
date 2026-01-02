extends Sprite

var TargetPos:Vector2 =  Vector2(512,300)
onready var LevelEnd = get_tree().get_nodes_in_group("LevelEnd")[0]
onready var Circle = get_tree().get_nodes_in_group("player")[0]
func _ready() -> void:
	$ContinueBtn.connect("pressed",self,"changeLevel")
	$HomeBtn.connect("pressed",self,"backToHome")
	
func _process(delta: float) -> void:
	SlideUp(delta)
	detectMouse(delta)

func SlideUp(delta):
	if Circle.finishedLevel == true:
		self.visible = true
		interpolateEl(delta,TargetPos,self)
	else:
		self.visible = false
	if self.position == TargetPos:
		$Button.visible = true
func changeLevel():
	LevelMonitor.newLevel += 1
	
func backToHome():
	get_tree().change_scene("res://Scenes/MenuScene.tscn")
	
func detectMouse(delta):
	if $ContinueButton.global_position.distance_to(get_global_mouse_position()) < 70:
		interpolateElScale(delta,Vector2(1.2,1.2),$ContinueButton)
	else:
		interpolateElScale(delta,Vector2(1,1),$ContinueButton)
	if $HomeButton.global_position.distance_to(get_global_mouse_position()) < 70:
		interpolateElScale(delta,Vector2(1.2,1.2),$HomeButton)
	else:
		interpolateElScale(delta,Vector2(1,1),$HomeButton)

func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
	
func interpolateEl(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPosition,t)
