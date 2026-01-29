extends Node

onready var streamPlayer:AudioStreamPlayer = $pressedSound
onready var mainMenu = get_tree().get_nodes_in_group("mainMenu")[0]

func _ready() -> void:
	pass
#	mainMenu.connect("makeTransitionSound",self,"_playTransition_Sound")
	
func _playTransition_Sound():
	streamPlayer.playing = true
