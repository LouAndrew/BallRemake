extends Sprite


onready var HomeButton:Button = $Homebtn/Button

onready var streamPlayer2:AudioStreamPlayer = $Homebtn/hoverSound

onready var InstagramButton:Button = $Homebtn/Button

var i:int = 1

func _ready() -> void:
	HomeButton.connect("pressed",self,"_on_homeButton_pressed")
	InstagramButton.connect("pressed",self,"_on_instagramButton_pressed")
	
func _process(delta: float) -> void:
	IncreaseIconSize(delta)
	
func _on_homeButton_pressed():
	get_tree().change_scene("res://Scenes/MenuScene.tscn")
	
func _on_instagramButton_pressed():
	var accountLink = "https://www.instagram.com/____louis.andrew.____"
	OS.shell_open(accountLink)
	
func IncreaseIconSize(delta):
	if $Homebtn.global_position.distance_to(get_global_mouse_position()) <= 40:
		if i < 2:
			streamPlayer2.playing = true
			i += 1
		interpolateScale(delta,Vector2(0.788,0.702),$Homebtn)
	else:
		interpolateScale(delta,Vector2(0.688,0.602),$Homebtn)
		i = 1
func interpolatePosition(delta,targetPositionUI:Vector2,Ui_element):
	var t :float= 0.2
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPositionUI,t)
	
func interpolateScale(delta,targetScaleUI:Vector2,Ui_element):
	var t :float= 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetScaleUI,t)
