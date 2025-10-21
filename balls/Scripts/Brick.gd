extends KinematicBody2D

var fall:bool=false
var gravity:int = 1800
var velocity:Vector2 = Vector2.ZERO
onready var timer = $Timer
func _physics_process(delta: float) -> void:
	detectCircle()
	floorDetect()
	if fall == true:
		velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
	velocity = move_and_slide(velocity,Vector2.UP)
func _ready() -> void:
	timer.connect("timeout",self,"_on_timer_out")
func _on_timer_out():
	SelfDelete()
	
func floorDetect():
	if is_on_floor():
		timer.wait_time = 2.0
		timer.start()
func detectCircle():
	if $RayCast2D.is_colliding():
		fall = true
func SelfDelete():
	queue_free()
