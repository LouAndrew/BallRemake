extends Node

var LevelScenes:Array = ["res://Scenes/PlayScene.tscn","res://Scenes/PlayScene2.tscn","res://Scenes/PlayScene3.tscn","res://Scenes/PlayScene4.tscn"]
var currentLevel:int = 0
var newLevel:int = 0

func _process(delta: float) -> void:
	SwitchLevel()
func SwitchLevel():
	if newLevel < 4:
		if newLevel > currentLevel:
			currentLevel += 1
			get_tree().change_scene(LevelScenes[currentLevel])
	if newLevel == 4:
		get_tree().free()
