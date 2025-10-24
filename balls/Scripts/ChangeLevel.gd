extends Sprite

var TargetPos:Vector2 =  Vector2(512,300)
onready var LevelEnd = get_tree().get_nodes_in_group("LevelEnd")[0]
onready var Circle = get_tree().get_nodes_in_group("player")[0]
func _ready() -> void:
	$Button.connect("pressed",self,"changeLevel")
func _process(delta: float) -> void:
	SlideUp(delta)

func SlideUp(delta):
	if Circle.finishedLevel == true:
		self.visible = true
		interpolateEl(delta,TargetPos,self)
	else:
		self.visible = false
	if self.position == TargetPos:
		$Button.visible = true
func changeLevel():
	if Input.is_action_just_pressed("ui_select"):
		$"/root/LevelMonitor".newLevel += 1
	$"/root/LevelMonitor".newLevel += 1
func interpolateEl(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPosition,t)
