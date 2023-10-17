extends Node2D

@export var pipe : PackedScene
@export var space = 300
@export var tip = 300

func _ready():
	spawn_pipes()


func spawn_pipes():
	var spacing = space * randf_range(0.9,1.1);
	var shift =tip * randf_range(-1.0,1.0)
	
	
	var dn = pipe.instantiate()
	if dn is Node2D :
		dn.position = self.position
		dn.position.y += spacing/2
		dn.top_level = true
		dn.position.y += shift
	
	var up = pipe.instantiate()
	if up is Node2D :
		up.position = self.position
		up.position.y -= spacing/2
		up.rotation_degrees = 180
		up.top_level = true
		up.position.y += shift
		
	call_deferred("add_child",up)
	call_deferred("add_child",dn)
#	add_child(up)
#	add_child(dn)


func move(a):
	self.position.x += 720
	spawn_pipes()
	print("hello")
