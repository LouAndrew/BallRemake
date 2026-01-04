extends Node

onready var backGroundMusic:AudioStreamPlayer = $sound
onready var streamPlayer:AudioStreamPlayer = $pressedSound
onready var mainMenu = get_tree().get_nodes_in_group("mainMenu")[0]

func _ready() -> void:
	mainMenu.connect("makeTransitionSound",self,"_playTransition_Sound")
	
func _playTransition_Sound():
	streamPlayer.playing = true
	
func _process(_delta: float) -> void:
	playSound()
	print(backGroundMusic.playing)
	
func playSound() -> bool:
	backGroundMusic.playing = true
	return true
