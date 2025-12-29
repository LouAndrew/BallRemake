extends Sprite


onready var HomeButton:Button = $Homebtn/Button

func _ready() -> void:
	HomeButton.connect("pressed",self,"_on_homeButton_pressed")
	
func _process(delta: float) -> void:
	IncreaseIconSize(delta)
	
func _on_homeButton_pressed():
	get_tree().change_scene("res://Scenes/MenuScene.tscn")
	
func IncreaseIconSize(delta):
	if $Homebtn.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateScale(delta,Vector2(0.788,0.702),$Homebtn)
	else:
		interpolateScale(delta,Vector2(0.688,0.602),$Homebtn)
func interpolatePosition(delta,targetPositionUI:Vector2,Ui_element):
	var t :float= 0.2
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPositionUI,t)
	
func interpolateScale(delta,targetScaleUI:Vector2,Ui_element):
	var t :float= 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetScaleUI,t)
