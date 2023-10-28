extends Node2D

@export var pipe : PackedScene
@export var space = 300
@export var tip = 300

@export var next_space = 720

func spawn_pipes():
	var spacing = space * randf_range(0.8,1.2);
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
#	call_deferred("add_child",up)
#	call_deferred("add_child",dn)
	add_child.call_deferred(up)
	add_child.call_deferred(dn)
	
	var rect = RectangleShape2D.new()
	rect.size = Vector2(128.0,spacing)
	
	var collider = CollisionShape2D.new()
	collider.shape = rect
	collider.disabled = false
	
	var score_area = Area2D.new()
	score_area.top_level = true
	score_area.position = self.position
	score_area.position.y += shift
	score_area.collision_layer = 0
	score_area.collision_mask = 2
	score_area.add_to_group("pipe")
	score_area.body_exited.connect(on_score)
	
	score_area.add_child(collider)
	add_child.call_deferred(score_area)
	
	
	
	
	


func move(_a: Node2D):
	self.position.x += next_space
	spawn_pipes()

func on_score(_a : Node2D):
	if SignalBus.dead:
		return
	SignalBus.score.emit()
