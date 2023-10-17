extends CharacterBody2D


@export var SPEED_BASE = 300.0
@export var JUMP_VELOCITY = -400.0

signal dead

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var speed = 0.0
var time = 0.0
var multiplier = 1.0

func reset():
	speed = 0.0
	time = 0.0
	multiplier = 1.0
	velocity = Vector2.ZERO

func _ready():
	speed = SPEED_BASE

func _physics_process(delta):
	multiplier = log(time + 1) + 1
	speed=SPEED_BASE * multiplier
	time+=delta
	velocity.x=speed
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta 

	# Handle Jump.
	if Input.is_action_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		$Fireblast1.visible = true
	else: 
		$Fireblast1.visible = false 

	var collision = move_and_collide(velocity*delta)
	if collision :
		print("dead")
#		get_tree().paused = true
		dead.emit()
