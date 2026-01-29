extends Sprite

var currentPos:Vector2 = Vector2(0,0)
onready var player = get_tree().get_nodes_in_group("player")[0]

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	currentPos = self.position
	player.SpawnPoint = currentPos
#
#func interpolateEl(delta,targetPos:Vector2,element:Sprite):
#	var t = 0.1
#	delta += t * 0.04
#	element.position = element.position.linear_interpolate(targetPos,t)
#
