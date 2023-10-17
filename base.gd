extends Node2D


@onready var camera = $"Camera2D"
@onready var player = $"Snail"
@onready var spawner = $"Spawner"

@export var shift = 300

func _ready():
	restart()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	camera.position.x = player.position.x + shift
	
func restart():
	get_tree().paused = false
	get_tree().call_group("pipe","queue_free")
	player.position = Vector2(0,640)
	player.reset()
	camera.position = Vector2(shift,640)
	spawner.position = Vector2(720,640)
	
	
