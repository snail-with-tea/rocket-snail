extends Control




func _on_home_pressed():
	SignalBus.to_main()


func _on_restart_pressed():
	get_tree().paused = false
	SignalBus.restart.emit()
	
