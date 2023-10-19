extends Control

var score = 0

@onready var label = $PanelContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	SignalBus.score.connect(on_score)
	label.text = "0"


func on_score():
	score += 1
	label.text = "%d" % score

func reset():
	score = 0
	label.text = "0"
