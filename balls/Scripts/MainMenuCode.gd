extends Control
onready var PlayButton = $Button
onready var exitButton = $Button2
func _ready() -> void:
	PlayButton.connect("pressed",self,"PlayGame")
	exitButton.connect("pressed",self,"LeaveGame")
	preload("res://Scenes/Level1.tscn").instance()
func PlayGame():
	get_tree().change_scene("res://Scenes/PlayScene.tscn")
func LeaveGame():
	get_tree().quit()
