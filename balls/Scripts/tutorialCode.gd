extends Node

var tips:Array = ["press (W) to jump","press (S) to duck","press (Q) to go left","press (E) to go right"]

onready var tipLabel:Label = $tip
onready var title:Label = $tipsLabel
func _ready() -> void:
	tipLabel.set_text(tips[0])

func _process(_delta: float) -> void:
	if LevelMonitor.currentLevel == 0:
		if tipLabel.text == tips[0]:
			if Input.is_action_just_pressed("ui_up"):
				tipLabel.set_text(tips[1])
				
		if tipLabel.text == tips[1]:
			if Input.is_action_just_pressed("ui_down"):
				tipLabel.set_text(tips[2])
				
		if tipLabel.text == tips[2]:
			if Input.is_action_just_pressed("ui_left"):
				tipLabel.set_text(tips[3])
				
		if tipLabel.text == tips[3]:
			if Input.is_action_just_pressed("ui_right"):
				title.visible = false
				tipLabel.visible = false
	else:
		tipLabel.visible = false
		title.visible = false
