extends Sprite

onready var LvlButtons:Array = [$Lvl1Button,$Lvl2Button,$Lvl3Button,$Lvl4Button,$Lvl5Button,$Lvl6Button,$Lvl7Button,$Lvl8Button]

onready var Buttons:Array = [$HomeButton,$NextChapterButton]

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
	
func _on_Button1_pressed():
	get_tree().change_scene("res://Scenes/PlayScene.tscn")
	
func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/PlayScene2.tscn")
	
func _on_Button3_pressed():
	get_tree().change_scene("res://Scenes/PlayScene3.tscn")
	
func _on_Button4_pressed():
	get_tree().change_scene("res://Scenes/PlayScene4.tscn")
	
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
