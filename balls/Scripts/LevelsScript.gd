extends Sprite

onready var LvlButtons:Array = [$Lvl1Button,$Lvl2Button,$Lvl3Button,$Lvl4Button,$Lvl5Button,$Lvl6Button,$Lvl7Button,$Lvl8Button]
onready var Buttons:Array = [$HomeButton,$NextChapterButton]

onready var scoreBubbles:Array = [$Lvl1Button/Icon/scoreBubble/score,$Lvl2Button/Icon/scoreBubble/score,$Lvl3Button/Icon/scoreBubble/score,$Lvl4Button/Icon/scoreBubble/score,$Lvl5Button/Icon/scoreBubble/score,$Lvl6Button/Icon/scoreBubble/score,$Lvl7Button/Icon/scoreBubble/score,$Lvl8Button/Icon/scoreBubble/score]
func _ready() -> void:
	LvlButtons[0].connect("pressed",self,"_on_Button1_pressed")
	LvlButtons[1].connect("pressed",self,"_on_Button2_pressed")
	LvlButtons[2].connect("pressed",self,"_on_Button3_pressed")
	LvlButtons[3].connect("pressed",self,"_on_Button4_pressed")
	LvlButtons[4].connect("pressed",self,"_on_Button5_pressed")
	LvlButtons[5].connect("pressed",self,"_on_Button6_pressed")
	LvlButtons[6].connect("pressed",self,"_on_Button7_pressed")
	LvlButtons[7].connect("pressed",self,"_on_Button8_pressed")
	
	Buttons[0].connect("pressed",self,"_on_homeButton_pressed")
	Buttons[1].connect("pressed",self,"_on_nextChapterButton_pressed")
	
	for i in LevelMonitor.level:
		LvlButtons[i].modulate = Color(1,1,1,1)
	for i in ScoringSys.scores.size():
		scoreBubbles[i].set_text(str(ScoringSys.deathScore[i]))
		
func _process(delta: float) -> void:
	ButtonUtilisation(delta)
	GoToPosition(delta)
	
func _on_Button1_pressed():
	if LevelMonitor.level >= 1:
		get_tree().change_scene("res://Scenes/PlayScene.tscn")
		LevelMonitor.newLevel = 0
	
func _on_Button2_pressed():
	if LevelMonitor.level >= 2:
		get_tree().change_scene("res://Scenes/PlayScene2.tscn")
		LevelMonitor.newLevel = 1
	
func _on_Button3_pressed():
	if LevelMonitor.level >= 3:
		get_tree().change_scene("res://Scenes/PlayScene3.tscn")
		LevelMonitor.newLevel = 2
	
func _on_Button4_pressed():
	if LevelMonitor.level >= 4:
		get_tree().change_scene("res://Scenes/PlayScene4.tscn")
		LevelMonitor.newLevel = 3
	
func _on_Button5_pressed():
	pass
	
func _on_Button6_pressed():
	pass
	
func _on_Button7_pressed():
	pass
	
func _on_Button8_pressed():
	pass
	
func _on_homeButton_pressed():
	get_tree().change_scene("res://Scenes/MenuScene.tscn")
	
func _on_nextChapterButton_pressed():
	pass
	
func ButtonUtilisation(delta):
	if $Lvl1Button/Icon.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$Lvl1Button/Icon)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$Lvl1Button/Icon)
		
	if $Lvl2Button/Icon.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$Lvl2Button/Icon)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$Lvl2Button/Icon)
		
	if $Lvl3Button/Icon.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$Lvl3Button/Icon)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$Lvl3Button/Icon)
		
	if $Lvl4Button/Icon.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$Lvl4Button/Icon)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$Lvl4Button/Icon)
		
	if $Lvl5Button/Icon.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$Lvl5Button/Icon)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$Lvl5Button/Icon)
		
	if $Lvl6Button/Icon.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$Lvl6Button/Icon)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$Lvl6Button/Icon)
		
	if $Lvl7Button/Icon.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$Lvl7Button/Icon)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$Lvl7Button/Icon)
		
	if $Lvl8Button/Icon.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$Lvl8Button/Icon)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$Lvl8Button/Icon)
		
	if $HomeButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.741,0.678),$HomeButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.641,0.578),$HomeButton/Sprite)
		
	if $NextChapterButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.944,0.788),$NextChapterButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.844,0.688),$NextChapterButton/Sprite)
		
func GoToPosition(delta):
	interpolateElPosition(delta,Vector2(54,43),$Lvl1Button/Icon)
	interpolateElPosition(delta,Vector2(54,43),$Lvl2Button/Icon)
	interpolateElPosition(delta,Vector2(54,43),$Lvl3Button/Icon)
	interpolateElPosition(delta,Vector2(54,43),$Lvl4Button/Icon)
	interpolateElPosition(delta,Vector2(54,43),$Lvl5Button/Icon)
	interpolateElPosition(delta,Vector2(54,43),$Lvl6Button/Icon)
	interpolateElPosition(delta,Vector2(54,43),$Lvl7Button/Icon)
	interpolateElPosition(delta,Vector2(54,43),$Lvl8Button/Icon)
	interpolateElPosition(delta,Vector2(54,43),$Lvl8Button/Icon)
	interpolateElPosition(delta,Vector2(48,39),$NextChapterButton/Sprite)
	interpolateElPosition(delta,Vector2(41,37),$HomeButton/Sprite)
	interpolateElPosition(delta,Vector2(442,-222),$Logo)
func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
	
func interpolateElPosition(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPosition,t)
