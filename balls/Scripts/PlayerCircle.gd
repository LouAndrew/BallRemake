extends KinematicBody2D

class_name Player

onready var landingSound:AudioStreamPlayer = $Sounds/landingOnGround
onready var deathSound:AudioStreamPlayer = $Sounds/deathSound
onready var jumpSound:AudioStreamPlayer = $Sounds/jumpSound

var velocity:Vector2 = Vector2.UP
var gravity:int = 1000
#var speed:int = 400
var jumpForce:int = -300
var jumpCount:int = 0
var rotationInc:float = 1.5
var SpawnPoint:Vector2 = Vector2()
var finishedLevel:bool = false

var DeathCause:String = "Alive"
var SpikeDeath:String = "SpikeDeath"
var FallOffDeath:String = "FallOffDeath"

var deathCounter:Array = [[0],[0]]

var speed : int  = 0
var Maxspeed:int = 400
var acceleration:int = 1500

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	CompressCircle()
	resetJumpCount()
	brickDetect()
	FallOffDetect()
	RespawnPointDeterminor()
	LevelComplete()
	newSpawnPoint()

func _physics_process(delta: float) -> void:
	deathDetect()
	Jump(delta)
	moveMent(delta)
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
	velocity = move_and_slide(velocity,Vector2.UP)
	
func moveMent(delta):
	if Input.is_action_pressed("ui_right"):
		interpolateEl(delta,Vector2(90,0),$smallCircle)
		if velocity.x == Maxspeed:
			speed = Maxspeed
		elif velocity.x < Maxspeed:
			speed += acceleration * delta
			speed = min(speed,Maxspeed)
			velocity.x = speed
		$RayCast2D.cast_to = Vector2(116,105)
		$streak.position = Vector2(-164,-2)
		$streak.rotation_degrees = 0
		interpolateElScale(delta,Vector2(2.562,1.344),$streak)
		if Input.is_action_pressed("ui_down") != true:
			$CollisionShape2D.rotation += rotationInc
			$Sprite.rotation += rotationInc
	elif Input.is_action_pressed("ui_left"):
		interpolateEl(delta,Vector2(-90,0),$smallCircle)
		if velocity.x == -Maxspeed:
			speed = -Maxspeed
		elif velocity.x > -Maxspeed:
		   speed -= acceleration * delta
		   speed = max(speed,-Maxspeed)
		   velocity.x = speed
		$RayCast2D.cast_to = Vector2(116,-105)
		$streak.position = Vector2(164,2)
		$streak.rotation_degrees = 180
		interpolateElScale(delta,Vector2(2.562,1.344),$streak)
		if Input.is_action_pressed("ui_down") != true:
			$CollisionShape2D.rotation -= rotationInc
			$Sprite.rotation -= rotationInc
	else:
		speed = move_toward(speed,0,acceleration * delta)
		velocity.x = 0
		interpolateEl(delta,Vector2(0,0),$smallCircle)
		$streak.position = Vector2(0,0)
		interpolateElScale(delta,Vector2(0,0),$streak)
		
func Jump(delta):
	if Input.is_action_pressed("ui_up"):
		interpolateEl(delta,Vector2(0,-90),$smallCircle)
		interpolateElScale(delta,Vector2(2.562,1.344),$streak)
		$streak.position = Vector2(0,162)
		$streak.rotation_degrees = -90
		
	if Input.is_action_just_pressed("ui_up"):
		if jumpCount < 1:
			jumpSound.playing = true
			velocity.y = jumpForce
			jumpCount += 1
func resetJumpCount():
	if is_on_floor():
		jumpCount = 0
		
func CompressCircle():
	if Input.is_action_pressed("ui_down"):
		$CollisionShape2D.scale = Vector2(1.0,0.8)
		$Sprite.scale = Vector2(2.215,2)
		$CollisionShape2D.rotation = 0
		$Sprite.rotation = 0
	else:
		$CollisionShape2D.scale = Vector2(1.0,1.0)
		$Sprite.scale = Vector2(2.215,2.211)
func deathDetect():
	var overLappingBodies = $Area2D.get_overlapping_bodies()
	for bod in overLappingBodies:
		if bod.is_in_group("Spike"):
			deathSound.playing = true
			DeathCause = SpikeDeath
			deathCounter[0][0]  += 1
			ScoringSys.newDeathScore[LevelMonitor.currentLevel] += 1
			Respawn()
			
func FallOffDetect():
	var overLappiingAreas = $Area2D.get_overlapping_areas()
	for area in overLappiingAreas:
		if area.is_in_group("fallOffs"):
			deathSound.playing = true
			DeathCause = FallOffDeath
			deathCounter[1][0]  += 1
			ScoringSys.newDeathScore[LevelMonitor.currentLevel] += 1
			Respawn()
			
func brickDetect():
	var overLappingBod = $Area2D.get_overlapping_bodies()
	for bod in overLappingBod:
		if bod.is_in_group("Brick"):
			deathSound.playing = true
			ScoringSys.newDeathScore[LevelMonitor.currentLevel] += 1
			Respawn()
			
func RespawnPointDeterminor():
	var overLappingArea = $Area2D.get_overlapping_areas()
	if SpawnPoint == Vector2():
		for area in overLappingArea:
			if area.is_in_group("InitialSpawnPoint"):
				SpawnPoint = area.position
				
func slopDetect():
	pass
#	if $RayCast2D.is_colliding() and self.get_floor_angle() >= 1.5:
#		speed = 700
#	else:
#		speed = 500
func Respawn():
	self.position = SpawnPoint
	
func LevelComplete():
	var overLappingAreas = $Area2D.get_overlapping_areas()
	for area in overLappingAreas:
		if area.is_in_group("LevelEnd"):
			set_physics_process(false)
			finishedLevel = true
			
func newSpawnPoint():
	if Input.is_action_just_pressed("ui_accept") and ScoringSys.lives > 0:
		var spawnPoint = $Position2D
		var newPoint = preload("res://Scenes/newSpawnPoint.tscn").instance()
		get_parent().add_child(newPoint)
		newPoint.global_transform = spawnPoint.global_transform
		ScoringSys.lives -= 1
		
func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
	
func interpolateEl(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPosition,t)
