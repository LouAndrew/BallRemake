extends Node

var LevelScore:Array = [0,0,0,0]
var newLevelScore:Array = [0,0,0,0]
var j:int = 0
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_page_up"):
		print(LevelScore[0])
		
	while j <= (newLevelScore.size() - 1):
		if newLevelScore[j] > LevelScore[j]:
			print("increased level ",j+1," yeah")
			print(LevelScore[j])
			LevelScore[j] = newLevelScore[j]
		if j == newLevelScore.size():
			j = 0
			print("reset")
		j += 1
