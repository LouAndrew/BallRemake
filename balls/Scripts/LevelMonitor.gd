extends Node

var LevelScenes:Array = ["res://Scenes/PlayScene.tscn","res://Scenes/PlayScene2.tscn","res://Scenes/PlayScene3.tscn","res://Scenes/PlayScene4.tscn"]
var currentLevel:int = 0
var newLevel:int = 0
var currentScene:String = LevelScenes[0]
var level:int = 1

func _process(_delta: float) -> void:
	SwitchLevel()
	
func SwitchLevel():
	if newLevel <= LevelScenes.size():
		if newLevel > currentLevel:
			currentLevel += 1
			currentScene = LevelScenes[currentLevel]
			get_tree().change_scene(LevelScenes[currentLevel])
		if newLevel < currentLevel:
			currentLevel -= 1
	if currentLevel >= level:
		level += 1
		
	if newLevel == LevelScenes.size():
		get_tree().free()
		
