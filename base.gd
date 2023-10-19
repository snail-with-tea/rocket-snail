extends Node2D


@onready var camera = $"Camera2D"
@onready var player = $"Snail"
@onready var spawner = $"Spawner"
@onready var ui = $CanvasLayer/InGameUI
@onready var pause_menu = $CanvasLayer/Pause
@onready var death_menu = $CanvasLayer/Death


@export var shift = 300

func _ready():
	SignalBus.restart.connect(restart)
	SignalBus.death.connect(on_death)
	restart()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	camera.position.x = player.position.x + shift
	
func restart():
	death_menu.hide()
	get_tree().paused = false
	get_tree().call_group("pipe","queue_free")
	player.position = Vector2(0,640)
	player.reset()
	camera.position = Vector2(shift,640)
	spawner.position = Vector2(720,640)
	spawner.spawn_pipes()
	ui.reset()
	


func start_area_exited(_body):
	SignalBus.dead = false

func on_death():
	death_menu.show()
	get_tree().paused = true
