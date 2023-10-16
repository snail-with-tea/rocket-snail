extends Node2D

@export var pipe : PackedScene
@export var space = 300


func _ready():
	spawn_pipes()


func spawn_pipes():
	var spacing = space * randf_range(0.9,1.1);
	
	var dn = pipe.instantiate()
	if dn is Node2D :
		dn.position = self.position
		dn.position.y += spacing/2
		dn.top_level = true
	add_child(dn)
	
	var up = pipe.instantiate()
	if up is Node2D :
		up.position = self.position
		up.position.y -= spacing/2
		up.rotation_degrees = 180
		up.top_level = true
	add_child(up)
