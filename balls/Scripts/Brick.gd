extends KinematicBody2D

var fall:bool=false
var gravity:int = 1800
var velocity:Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	detectCircle()
	floorDetect()
	if fall == true:
		velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
	velocity = move_and_slide(velocity,Vector2.UP)
func _ready() -> void:
	pass
	
func floorDetect():
	if is_on_floor():
		SelfDelete()
func detectCircle():
	if $RayCast2D.is_colliding():
		fall = true
func SelfDelete():
	yield(get_tree().create_timer(1.0),"timeout")
	queue_free()
