extends Node

onready var player = get_tree().get_nodes_in_group("player")[0]

var triggerPos:Array = [-1000,-289]
var triggNum: int = 0
var desiredInput = Input.is_action_just_pressed("ui_right")
var pressed:bool = false
var displayedGuids:Array = [false,false]

var basicHelp:Array = [
	"Press Q to go left",
	"Press E to go right",
	"Press W to Jump",
	"Press S to Duck"
	]
var advancedHelp:Array = [
	"To jump over obstacles, jump and hit the left or right button",
	"To dodge low obstacles press S to duck, to fit through",
	"To pass large gaps use ramps to gain speed to cover them",
	"Use the color guides to plan your next move",
	"To change direction mid air release button and press the opposite button",
	"avoid falling bricks and spikes"
	]
	
onready var helpButton:Button = $helpButton

func _ready() -> void:
	helpButton.connect("pressed",self,'onHelpButtonPressed')
	
func _process(delta: float) -> void:
	detectMouseDist(delta)
	
func detectMouseDist(delta):
	if $helpButton/Sprite.global_position.distance_to($helpButton/Sprite.get_global_mouse_position()) <= 50:
		interpolateElScale(delta,Vector2(0.98,0.88),$helpButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.844,0.757),$helpButton/Sprite)
		
func onHelpButtonPressed():
	$text.visible = true
	
func interpolateEl(delta,targetPos:Vector2,element):
	var t = 0.07
	t += delta * 0.4
	element.global_position = element.global_position.linear_interpolate(targetPos,t)
	
func interpolateElScale(delta,targetPos:Vector2,element):
	var t = 0.2
	t += delta * 0.4
	element.scale = element.scale.linear_interpolate(targetPos,t)
