extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Health = 100
var Hits = 3;

func get_player():
	return $Player
	
func _ready():
	$CanvasLayer2/L4_SUS_Monster.visible = true
	$CanvasLayer2/L4_SUS_Monster.set_is_paused(true)
	
func change_SUS():
	$CanvasLayer2/L4_SUS_Player.visible = true
	$CanvasLayer2/L4_SUS_Player/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	
func save_data():
	var score_file = "user://Save.save"
	var ss
	var file = File.new()
	file.open(score_file, File.READ)
	ss = file.get_var()
	file.close()
	if ss < 5:
		file = File.new()
		file.open(score_file, File.WRITE)
		file.store_var(5)
		file.close()
	
func pick_up_ring():
	$CanvasLayer2/L4_RING.visible = true
	$CanvasLayer2/L4_RING.set_is_paused(true)
	$CanvasLayer2/L4_RING/ColorRect/Text.play("TextInp")
	$CanvasLayer2/L4_RING/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS

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
		get_tree().change_scene("res://WinScreen4.tscn")
