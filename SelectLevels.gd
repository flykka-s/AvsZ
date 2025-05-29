extends Control

var level

func load_data():
	var score_file = "user://Save.save"    
	var file = File.new()
	if file.file_exists(score_file):
		file.open(score_file, File.READ)
		level = file.get_var()
		file.close()
	else:
		level = 1

func _ready():
	load_data()
	if level == 1:
		$Bg1/Button2.disabled = true
		$Bg1/Button3.disabled = true
		$Bg1/Button4.disabled = true
		$Bg1/Button5.disabled = true
		$Bg1/Button6.disabled = true
		$Bg1/Button7.disabled = true
		$Bg1/Button8.disabled = true
		$Bg1/Button9.disabled = true
		$Bg1/Button10.disabled = true
	elif level == 2:
		$Bg1/Button3.disabled = true
		$Bg1/Button4.disabled = true
		$Bg1/Button5.disabled = true
		$Bg1/Button6.disabled = true
		$Bg1/Button7.disabled = true
		$Bg1/Button8.disabled = true
		$Bg1/Button9.disabled = true
		$Bg1/Button10.disabled = true
	elif level == 3:
		$Bg1/Button4.disabled = true
		$Bg1/Button5.disabled = true
		$Bg1/Button6.disabled = true
		$Bg1/Button7.disabled = true
		$Bg1/Button8.disabled = true
		$Bg1/Button9.disabled = true
		$Bg1/Button10.disabled = true
	elif level == 4:
		$Bg1/Button5.disabled = true
		$Bg1/Button6.disabled = true
		$Bg1/Button7.disabled = true
		$Bg1/Button8.disabled = true
		$Bg1/Button9.disabled = true
		$Bg1/Button10.disabled = true
	elif level == 5:
		$Bg1/Button6.disabled = true
		$Bg1/Button7.disabled = true
		$Bg1/Button8.disabled = true
		$Bg1/Button9.disabled = true
		$Bg1/Button10.disabled = true
	elif level == 6:
		$Bg1/Button7.disabled = true
		$Bg1/Button8.disabled = true
		$Bg1/Button9.disabled = true
		$Bg1/Button10.disabled = true
	elif level == 7:
		$Bg1/Button8.disabled = true
		$Bg1/Button9.disabled = true
		$Bg1/Button10.disabled = true
	elif level == 8:
		$Bg1/Button9.disabled = true
		$Bg1/Button10.disabled = true
	elif level == 9:
		$Bg1/Button10.disabled = true
