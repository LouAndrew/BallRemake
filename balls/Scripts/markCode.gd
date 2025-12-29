extends Sprite

onready var player = get_tree().get_nodes_in_group("player")[0]

export var ypos:int = 00
export var backward:bool = true

var xposTarget:float = 0

func _ready() -> void:
	xposTarget = self.global_position.x - 600
	
func _process(delta: float) -> void:
	detectPlayerPos(delta)
	
func detectPlayerPos(delta):
	if backward and player.global_position.x >= self.global_position.x:
		interpolateElScale(delta,Vector2(2,1),self)
		interpolateElPos(delta,Vector2(xposTarget,ypos),self)
		if (player.global_position.x - self.global_position.x) > 400:
			self.queue_free()
	elif ! backward and player.global_position.x <= self.global_position.x:
		interpolateElScale(delta,Vector2(2,1),self)
		interpolateElPos(delta,Vector2(xposTarget,ypos),self)
		if (self.global_position.x - player.global_position.x) > 400:
			self.queue_free()
				
func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
	
func interpolateElPos(delta,targetPosition:Vector2,Ui_element):
	var t := 0.0005
	t += delta * 0.4
	Ui_element.global_position = Ui_element.global_position.linear_interpolate(targetPosition,t)
	
