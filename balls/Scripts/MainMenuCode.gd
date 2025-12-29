extends Control
onready var PlayButton = $playButton
onready var levelsButton = $levelsButton
onready var creditsButton = $creditsButton
onready var exitButton = $exitButton
onready var settingsButton = $settingsButton

func _ready() -> void:
	PlayButton.connect("pressed",self,"PlayGame")
	levelsButton.connect("pressed",self,"LevelsScene")
	creditsButton.connect("pressed",self,"CreditsScene")
	exitButton.connect("pressed",self,"LeaveGame")
	settingsButton.connect("pressed",self,"SettingsScene")
	
func _process(delta: float) -> void:
	ButtonUtilisation(delta)
	GoToPosition(delta)
func PlayGame():
	get_tree().change_scene(LevelMonitor.currentScene)
	
func LevelsScene():
	get_tree().change_scene("res://Scenes/LevelsScene.tscn")
	
func CreditsScene():
	get_tree().change_scene("res://Scenes/CreditsScene.tscn")
	
func SettingsScene():
	get_tree().change_scene("res://Scenes/SettingsScene.tscn")
	
func GoToPosition(delta):
	interpolateElPos(delta,Vector2(112,32),$playButton/Sprite)
	interpolateElPos(delta,Vector2(112,32),$levelsButton/Sprite)
	interpolateElPos(delta,Vector2(112,32),$creditsButton/Sprite)
	interpolateElPos(delta,Vector2(112,32),$exitButton/Sprite)
	interpolateElPos(delta,Vector2(46,36.5),$settingsButton/Sprite)
	interpolateElPos(delta,Vector2(136,88),$StatsBoard)
	
	interpolateElScale(delta,Vector2(1,1),$Logo)
func LeaveGame():
	$LeaveMenu.visible = true
	#get_tree().quit()
	
func ButtonUtilisation(delta):
	if $playButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.991,0.827),$playButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.891,0.727),$playButton/Sprite)
		
	if $levelsButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.991,0.827),$levelsButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.891,0.727),$levelsButton/Sprite)
		
	if $creditsButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.991,0.827),$creditsButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.891,0.727),$creditsButton/Sprite)
		
	if $exitButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.991,0.827),$exitButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.891,0.727),$exitButton/Sprite)
		
	if $settingsButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.991,0.748),$settingsButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.891,0.648),$settingsButton/Sprite)
		
func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
	
func interpolateElPos(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPosition,t)
