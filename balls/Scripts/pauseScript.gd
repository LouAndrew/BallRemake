extends Control

onready var PauseButton:Button = $Button
onready var ResumeButton:Button = $Button2
onready var LeaveButton:Button = $Button3

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
# warning-ignore:return_value_discarded
	PauseButton.connect("pressed",self,"PauseGame")
# warning-ignore:return_value_discarded
	ResumeButton.connect("pressed",self,"ResumeGame")
# warning-ignore:return_value_discarded
	LeaveButton.connect("pressed",self,"LeaveGame")
	
func PauseGame():
	get_tree().paused = true
	$Button.visible = false
	$Button2.visible = true
	$Button3.visible = true
	$ColorRect.visible = true
func ResumeGame():
	get_tree().paused = false
	$Button.visible = true
	$Button2.visible = false
	$Button3.visible = false
	$ColorRect.visible = false
func LeaveGame():
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MenuScene.tscn")
