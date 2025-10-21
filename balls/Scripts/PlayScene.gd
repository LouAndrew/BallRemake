extends Node


func pass():
	if true:
		var tileMAP = get_node("TileMap")
		tileMAP.queue_free()
