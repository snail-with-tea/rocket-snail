extends CharacterBody2D


@export var SPEED_BASE = 300.0
@export var JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var speed = 0.0
var time = 0.0

func _ready():
	speed = SPEED_BASE

func _physics_process(delta):
	speed+=log(time+1)*SPEED_BASE
	time+=delta
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
