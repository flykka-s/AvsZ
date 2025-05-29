extends Control


var is_paused = false setget set_is_paused


func set_is_paused(value):
	is_paused=value
	get_tree().paused=is_paused
	visible = is_paused
	

func _on_Button_pressed():
	self.is_paused = false
	
