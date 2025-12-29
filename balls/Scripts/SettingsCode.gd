extends Node

var UiNum:int=0
var SFXxValue:int
var VolumeXValue:int
var acceleration = 0.2

onready var SfxPanel = $panel/SFXBar
onready var volumePanel = $panel/VolumeBar
onready var SFXBar = $panel/SFXBar/moveable
onready var volumeBar = $panel/VolumeBar/moveable


onready var homeButton  = $HomeBtn/Button

func _ready() -> void:
	homeButton.connect("pressed",self,"_on_homeButton_pressed")
	
func _process(delta: float) -> void:
	SettingsUiSelector(delta)
	IncreaseIconSize(delta)
	
func _on_homeButton_pressed():
	get_tree().change_scene("res://Scenes/MenuScene.tscn")
	
func SettingsUiSelector(delta):
	if Input.is_action_just_pressed("ui_down"):
		UiNum += 1
	elif Input.is_action_just_pressed("ui_up"):
		UiNum -= 1
	if UiNum > 2:
		UiNum = 0
	elif UiNum < 0:
		UiNum = 2
	if UiNum == 1:
		MoveVolumeBar(delta)
		interpolateScale(delta,Vector2(1.3,1.039),volumePanel)
	else:
		interpolateScale(delta,Vector2(1,0.739),volumePanel)
	if UiNum == 2:
		SFXVolumeBar(delta)
		interpolateScale(delta,Vector2(1.3,1.039),SfxPanel)
	else:
		interpolateScale(delta,Vector2(1,0.739),SfxPanel)
		
func MoveVolumeBar(delta):
	VolumeXValue = volumeBar.position.x
	if Input.is_key_pressed(KEY_RIGHT) and VolumeXValue <= 280:
		VolumeXValue += 2
		volumeBar.position.x = VolumeXValue
		interpolateVolumeBar(delta,Vector2(volumeBar.position),volumeBar)
	elif Input.is_key_pressed(KEY_LEFT) and VolumeXValue >= -280:
		VolumeXValue -= 2
		volumeBar.position.x = VolumeXValue
		interpolateVolumeBar(delta,Vector2(volumeBar.position),volumeBar)
func SFXVolumeBar(delta):
	SFXxValue = SFXBar.position.x
	if Input.is_key_pressed(KEY_RIGHT) and SFXxValue <= 280:
		SFXxValue += 2
		SFXBar.position.x = SFXxValue
		interpolateVolumeBar(delta,Vector2(SFXBar.position),SFXBar)
	elif Input.is_key_pressed(KEY_LEFT) and SFXxValue >= -280:
		SFXxValue -= 2
		SFXBar.position.x = SFXxValue
		interpolateVolumeBar(delta,Vector2(SFXBar.position),SFXBar)
		
func IncreaseIconSize(delta):
	if $HomeBtn.global_position.distance_to($"..".get_global_mouse_position()) <= 40:
		interpolateScale(delta,Vector2(0.717,0.678),$HomeBtn)
	else:
		interpolateScale(delta,Vector2(0.617,0.578),$HomeBtn)
		
func interpolateVolumeBar(delta,targetPositionUI:Vector2,Ui_element):
	var t :float= 0.2
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPositionUI,t)
func interpolateScale(delta,targetScaleUI:Vector2,Ui_element):
	var t :float= 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetScaleUI,t)
