extends Node2D

var Health = 100
var Hits = 3;


func get_player():
	return $Player

func _ready():
	$CanvasLayerSUS/SUS.visible = true
	$CanvasLayerSUS/SUS.set_is_paused(true)

func change_SUS():
	$CanvasLayerSUS/SUS2.visible = true
	$CanvasLayerSUS/SUS2/ColorRect/TextInp.pause_mode = Node.PAUSE_MODE_PROCESS

func save_data():
	var score_file = "user://Save.save"
	var ss
	var file = File.new()
	file.open(score_file, File.READ)
	ss = file.get_var()
	file.close()
	if ss < 2:
		file = File.new()
		file.open(score_file, File.WRITE)
		file.store_var(2)
		file.close()

func _process(delta):
	$Stats/CanvasLayer/Label.text = str($Player.coins)
	
	if Health == 3:
		$Health/CanvasLayer/TextureProgress.value = 100
	elif Health == 2:
		$Health/CanvasLayer/TextureProgress.value = 66
	elif Health == 1:
		$Health/CanvasLayer/TextureProgress.value = 33
	elif Health == 0:
		$Health/CanvasLayer/TextureProgress.value = 0
	
	
	
	
	
	if $Player.endlevel == 1:
		get_tree().change_scene("res://WinScreen.tscn")

