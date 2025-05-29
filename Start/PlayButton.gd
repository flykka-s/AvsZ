extends Button


func _on_button_up():
	save_data()
	get_tree().change_scene("res://Level1.tscn")


func save_data():
	var score_file = "user://Save.save"
	var file = File.new()
	file.open(score_file, File.WRITE)
	file.store_var(1)
	file.close()
