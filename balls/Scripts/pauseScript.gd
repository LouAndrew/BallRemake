extends Control

onready var PauseButton:Button = $Button
onready var ResumeButton:Button = $Button2
onready var HomeButton:Button = $Button3

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
# warning-ignore:return_value_discarded
	PauseButton.connect("pressed",self,"PauseGame")
# warning-ignore:return_value_discarded
	ResumeButton.connect("pressed",self,"ResumeGame")
# warning-ignore:return_value_discarded
	HomeButton.connect("pressed",self,"LeaveGame")
	
func PauseGame():
	get_tree().paused = true
	$panel.visible = true
	$Button.visible = false
	$Button2.visible = true
	$Button2.disabled = false
	$Button3.visible = true
	$Button3.disabled = false
	$ColorRect.visible = true
func ResumeGame():
	get_tree().paused = false
	$panel.visible = false
	$Button.visible = true
	$Button2.visible = false
	$Button2.disabled = true
	$Button3.visible = false
	$Button3.disabled = true
	$ColorRect.visible = false
func LeaveGame():
	get_tree().paused = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/MenuScene.tscn")
