extends Node
class_name SignalBUS

signal score
signal death
signal restart

var dead = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func to_main():
	get_tree().change_scene_to_file("res://start.tscn")

func to_game():
	get_tree().change_scene_to_file("res://base.tscn")
