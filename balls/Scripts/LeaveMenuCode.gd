extends Sprite

onready var NoButton:Button = $NoButton
onready var YesButton:Button = $YesButton

func _ready() -> void:
	YesButton.connect("pressed",self,"_on_yes_pressed")
	NoButton.connect("pressed",self,"_on_no_pressed")
	
func _process(delta: float) -> void:
	showMenu(delta)
	buttonUtilisation(delta)
func _on_yes_pressed():
	get_tree().quit()
	
func _on_no_pressed():
	self.visible = false
	YesButton.disabled = true
	NoButton.disabled = true
	
func showMenu(delta):
	if self.visible == true:
		interpolateEl(delta,Vector2(496,408),self)
		YesButton.disabled = false
		NoButton.disabled = false
	else:
		interpolateEl(delta,Vector2(496,370),self)
		
func buttonUtilisation(delta):
	if $NoButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.8,0.7),$NoButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.719,0.68),$NoButton/Sprite)
		
	if $YesButton/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.8,0.78),$YesButton/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.719,0.6),$YesButton/Sprite)
func interpolateEl(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.position = Ui_element.position.linear_interpolate(targetPosition,t)
	
func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
