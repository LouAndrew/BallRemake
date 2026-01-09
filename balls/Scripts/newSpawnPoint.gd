extends Sprite


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	#interpolateEl(delta,Vector2(0,-30),self)
	pass
	
func interpolateEl(delta,targetPos:Vector2,element:Sprite):
	var t = 0.1
	delta += t * 0.04
	element.position = element.position.linear_interpolate(targetPos,t)
