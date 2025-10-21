extends Control

onready var PauseButton:Button = $Button
onready var ResumeButton:Button = $Button2
onready var LeaveButton:Button = $Button3
onready var ChangeButton:Button = $Button4
signal LevelCompleted()
onready var LevelEnd = get_tree().get_nodes_in_group("LevelEnd")[0]
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	PauseButton.connect("pressed",self,"PauseGame")
	ResumeButton.connect("pressed",self,"ResumeGame")
	LeaveButton.connect("pressed",self,"LeaveGame")
	ChangeButton.connect("pressed",self,"changeLevel")
func _process(_delta: float) -> void:
	LevelCompletion()
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
	get_tree().change_scene("res://Scenes/MenuScene.tscn")
func LevelCompletion():
	if LevelEnd.playerHere == true:
		$Button4.visible = true
func changeLevel():
	$"/root/LevelMonitor".newLevel += 1
