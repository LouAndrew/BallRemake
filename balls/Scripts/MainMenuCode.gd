extends Control
onready var PlayButton = $playButton
onready var levelsButton = $levelsButton
onready var exitButton = $exitButton
func _ready() -> void:
	PlayButton.connect("pressed",self,"PlayGame")
	levelsButton.connect("pressed",self,"LevelsScene")
	exitButton.connect("pressed",self,"LeaveGame")
	
func PlayGame():
	get_tree().change_scene(LevelMonitor.currentScene)
	
func LevelsScene():
	get_tree().change_scene("res://Scenes/LevelsScene.tscn")
	
func LeaveGame():
	get_tree().quit()
