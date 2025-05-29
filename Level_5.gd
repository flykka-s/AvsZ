extends Node2D




var Health = 100
var Hits = 3;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/Camera2D.limit_left = -100000
	$CanvasLayer2/L5_SUS_Monster.visible = true
	$CanvasLayer2/L5_SUS_Monster.set_is_paused(true)
	
func save_data():
	var score_file = "user://Save.save"
	var ss
	var file = File.new()
	file.open(score_file, File.READ)
	ss = file.get_var()
	file.close()
	if ss < 6:
		file = File.new()
		file.open(score_file, File.WRITE)
		file.store_var(6)
		file.close()

func get_player():
	return $Player
	
func change_SUS():
	$CanvasLayer2/L5_SUS_Player.visible = true
	$CanvasLayer2/L5_SUS_Player/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS

func monster_died():
	$KinematicBody2D/CollisionShape2D2.position.y -= 300
	$KinematicBody2D/Area2D2.visible = false
	$Box6.position.y = -1000000
	$Box7.position.y = -1000000
	$Box8.position.y = -1000000
	

func monster_dialog():
	$KinematicBody2D/CollisionShape2D.position.y += 300
	$KinematicBody2D/Area2D.visible = true
	$CanvasLayer3/mons_dial.set_is_paused(true)
	$CanvasLayer3/mons_dial/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	$CanvasLayer3/mons_dial/ColorRect/Text.play("TextInp")
	$CanvasLayer3/mons_dial.visible = true
	
func change_monster_dialog():
	$CanvasLayer3/mons_dial2.visible = true
	$CanvasLayer3/mons_dial2/ColorRect/Text.play("TextInp")
	$CanvasLayer3/mons_dial2/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	
func change_monster_dialog2():
	$CanvasLayer3/mons_dial3.visible = true
	$CanvasLayer3/mons_dial3/ColorRect/Text.play("TextInp")
	$CanvasLayer3/mons_dial3/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	
func change_monster_dialog3():
	$CanvasLayer3/mons_dial4.visible = true
	$CanvasLayer3/mons_dial4/ColorRect/Text.play("TextInp")
	$CanvasLayer3/mons_dial4/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	
func change_monster_dialog4():
	$CanvasLayer3/mons_dial5.visible = true
	$CanvasLayer3/mons_dial5/ColorRect/Text.play("TextInp")
	$CanvasLayer3/mons_dial5/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS

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
		get_tree().change_scene("res://WinScreen5.tscn")
