extends Control

onready var PauseButton:Button = $Button
onready var ResumeButton:Button = $Button2
onready var HomeButton:Button = $Button3
onready var RetryButton:Button = $RetryBtn

var showDeathStats:bool = false
var deathNum:int = 0 

onready var player = get_tree().get_nodes_in_group("player")[0]

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
# warning-ignore:return_value_discarded
	PauseButton.connect("pressed",self,"PauseGame")
# warning-ignore:return_value_discarded
	ResumeButton.connect("pressed",self,"ResumeGame")
# warning-ignore:return_value_discarded
	HomeButton.connect("pressed",self,"LeaveGame")
	RetryButton.connect("pressed",self,"reloadLevel")
	
	player.connect("showDeathStats",self,"showDthStat")
	
func _process(delta: float) -> void:
	buttonUtilisation(delta)
	showDeathStatsDisplay(delta)
	
func showDthStat():
	showDeathStats = true
	
func PauseGame():
	get_tree().paused = true
	$panel.visible = true;PauseButton.visible = false
	ResumeButton.visible = true;ResumeButton.disabled = false
	HomeButton.visible = true;HomeButton.disabled = false
	RetryButton.disabled = false;RetryButton.visible = true
	$ColorRect.visible = true
func ResumeGame():
	get_tree().paused = false
	$panel.visible = false;PauseButton.visible = true
	ResumeButton.visible = false;ResumeButton.disabled = true
	HomeButton.visible = false;HomeButton.disabled = true
	RetryButton.disabled = true;RetryButton.visible = false
	$ColorRect.visible = false
	
func LeaveGame():
	$LeaveMenu.visible = true
	
func reloadLevel():
	get_tree().reload_current_scene()
	get_tree().paused = false
	
func buttonUtilisation(delta):
	if $Button/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.663,0.538),$Button/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.563,0.438),$Button/Sprite)
		
	if $Button2/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.663,0.538),$Button2/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.563,0.438),$Button2/Sprite)
		
	if $Button3/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.663,0.538),$Button3/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.563,0.438),$Button3/Sprite)
		
	if $RetryBtn/Sprite.global_position.distance_to(get_global_mouse_position()) <= 40:
		interpolateElScale(delta,Vector2(0.78,0.725),$RetryBtn/Sprite)
	else:
		interpolateElScale(delta,Vector2(0.68,0.625),$RetryBtn/Sprite)
		
func showDeathStatsDisplay(delta):
	if showDeathStats:
		var deathTotal:int = 0
		$DeathCountDisplay.visible = true
		interpolateEl(delta,Vector2(808,300),$DeathCountDisplay)
		yield(get_tree().create_timer(1.0),"timeout")
		deathTotal = player.deathCounter[0][0] + player.deathCounter[1][0]
		$DeathCountDisplay.visible = false
		if $DeathCountDisplay.visible == false:
			$DeathCountDisplay.global_position = Vector2(808,382)
			showDeathStats = false

func interpolateEl(delta,targetPosition:Vector2,Ui_element):
	var t := 0.1
	t += delta * 0.4
	Ui_element.global_position = Ui_element.global_position.linear_interpolate(targetPosition,t)
func interpolateElScale(delta,targetPosition:Vector2,Ui_element):
	var t := 0.2
	t += delta * 0.4
	Ui_element.scale = Ui_element.scale.linear_interpolate(targetPosition,t)
