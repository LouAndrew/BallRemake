extends KinematicBody2D

class_name Player

var velocity:Vector2 = Vector2.ZERO
var gravity:int = 1000
var speed:int = 500
var jumpForce:int = -300
var jumpCount:int = 0
var rotationInc:float = 1.5
var SpawnPoint:Vector2 = Vector2()
var finishedLevel:bool = false

#func _ready() -> void:
#	LevelManager.set_player_instance(self)
func _process(_delta: float) -> void:
	CompressCircle()
	resetJumpCount()
	FallOffDetect()
	RespawnPointDeterminor()
	LevelComplete()

func _physics_process(delta: float) -> void:
	deathDetect()
	Jump()
	moveMent()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
	velocity = move_and_slide(velocity,Vector2.UP)
	
func moveMent():
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		if Input.is_action_pressed("ui_down") != true:
			$CollisionShape2D.rotation += rotationInc
			$Sprite.rotation += rotationInc
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		if Input.is_action_pressed("ui_down") != true:
			$CollisionShape2D.rotation -= rotationInc
			$Sprite.rotation -= rotationInc
	else:
		velocity.x = 0
func Jump():
	if Input.is_action_just_pressed("ui_up"):
		if jumpCount < 1:
			velocity.y = jumpForce
			jumpCount += 1
			
func resetJumpCount():
	if is_on_floor():
		jumpCount = 0
		
func CompressCircle():
	if Input.is_action_pressed("ui_down"):
		$CollisionShape2D.scale = Vector2(1.0,0.8)
		$Sprite.scale = Vector2(1.109,0.9)
		$CollisionShape2D.rotation = 0
		$Sprite.rotation = 0
	else:
		$CollisionShape2D.scale = Vector2(1.0,1.0)
		$Sprite.scale = Vector2(1.109,1.098)
func deathDetect():
	var overLappingBodies = $Area2D.get_overlapping_bodies()
	for bod in overLappingBodies:
		if bod.is_in_group("Spike"):
			Respawn()
func FallOffDetect():
	var overLappiingAreas = $Area2D.get_overlapping_areas()
	for area in overLappiingAreas:
		if area.is_in_group("fallOffs"):
			Respawn()
func RespawnPointDeterminor():
	var overLappingArea = $Area2D.get_overlapping_areas()
	if SpawnPoint == Vector2():
		for area in overLappingArea:
			if area.is_in_group("InitialSpawnPoint"):
				SpawnPoint = area.position
func Respawn():
	self.position = SpawnPoint
func LevelComplete():
	var overLappingAreas = $Area2D.get_overlapping_areas()
	for area in overLappingAreas:
		if area.is_in_group("LevelEnd"):
			finishedLevel = true
