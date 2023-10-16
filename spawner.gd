extends Node2D

@export var pipe : PackedScene

func _ready():
	spawn_pipes()


func spawn_pipes():
	var down = pipe.instantiate()
	if down is Node2D :
		down.position = self.position
	add_sibling(down)
