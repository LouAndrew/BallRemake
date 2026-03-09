extends Sprite

onready var player = get_tree().get_nodes_in_group("player")[0]

var alphaVal:float = 1
var alphaDecreaseVal:float = 5
var selfColor:Color = Color(1,1,1,1)

export var brickGuide:bool = false
export var detectGreaterX: bool = true
export var detectlessThanX: bool = false

func _ready():
	pass
	
func _process(delta):
	if detectGreaterX:
		if player.global_position.x > self.global_position.x:
			reduceAlphaVal(delta)
		else:
			 increaseAlphaVal(delta)
	if detectlessThanX:
		if player.global_position.x < self.global_position.x:
			reduceAlphaVal(delta)
		else:
			 increaseAlphaVal(delta)
			
func reduceAlphaVal(delta):
	alphaVal -= alphaDecreaseVal * delta
	alphaVal = max(alphaVal,0)
	selfColor[3] = alphaVal
	self.self_modulate = selfColor
	
func increaseAlphaVal(delta):
	if not brickGuide:
		alphaVal += alphaDecreaseVal * delta
		alphaVal = min(1,alphaVal)
		selfColor[3] = alphaVal
		self.self_modulate = selfColor
	
	
