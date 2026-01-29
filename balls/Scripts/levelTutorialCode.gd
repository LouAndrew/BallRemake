extends Node

onready var action1 = $inGameAction
onready var action2 = $inGameAction2
onready var textbg = $textBg

onready var player = get_tree().get_nodes_in_group("player")[0]


var triggerPos:Array = [-1000,-289]
var triggNum: int = 0
var desiredInput = Input.is_action_just_pressed("ui_right")
var pressed:bool = false
var displayedGuids:Array = [false,false]
func _ready() -> void:
	pass
func _process(delta: float) -> void:
	introduceMechanic(delta,action1,textbg,Vector2(530,504),triggerPos[0],Input.is_action_just_pressed("ui_right"),displayedGuids[0])
	#introduceMechanic(delta,action2,textbg,Vector2(598,390),triggerPos[1],Input.is_action_just_pressed("ui_up"),displayedGuids[1])
	
func introduceMechanic(delta,action:Sprite,text:Sprite,actionTargetPos:Vector2,triggerDist:float,input,displayed):
	if LevelMonitor.currentLevel == 0 and player.global_position.x >= triggerDist and ! displayed:
		var showGuides:bool  = false
		if showGuides:
			Engine.time_scale = 0.1
			action.visible = true
			text.visible = true
			interpolateEl(delta,actionTargetPos,action)
		if input:
			Engine.time_scale = 1
			pressed = true
			showGuides = false
			action.visible = false
			text.visible = false
			displayed = true
		if player.global_position.x >= triggerDist and ! pressed:
			showGuides = true
			
func interpolateEl(delta,targetPos:Vector2,element):
	var t = 0.07
	t += delta * 0.4
	element.global_position = element.global_position.linear_interpolate(targetPos,t)
