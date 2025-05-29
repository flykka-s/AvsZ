extends Node2D


var Health = 100
var Hits = 3;

func get_player():
	return $Player


func uldran_died():
	$Key.position = $Uldran.position
	$Key.position.y += 70
	$Key.position.x -= 25

func save_data():
	var score_file = "user://Save.save"
	var file = File.new()
	file.open(score_file, File.WRITE)
	file.store_var(10)
	file.close()
	
func start_dialog_victory():	
	$CanvasLayer3/victory1.set_is_paused(true)
	$CanvasLayer3/victory1/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	$CanvasLayer3/victory1/ColorRect/Text.play("TextInp")
	$CanvasLayer3/victory1.visible = true
	
func change_dialog_victory():
	$CanvasLayer3/victory2/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	$CanvasLayer3/victory2/ColorRect/Text.play("TextInp")
	$CanvasLayer3/victory2.visible = true

func start_dialog():
	$CanvasLayer2/Dialog1.set_is_paused(true)
	$CanvasLayer2/Dialog1/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	$CanvasLayer2/Dialog1/ColorRect/Text.play("TextInp")
	$CanvasLayer2/Dialog1.visible = true
	
func change_dialog():
	$CanvasLayer2/Dialog2/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	$CanvasLayer2/Dialog2/ColorRect/Text.play("TextInp")
	$CanvasLayer2/Dialog2.visible = true
	
func change_dialog2():
	$CanvasLayer2/Dialog3/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	$CanvasLayer2/Dialog3/ColorRect/Text.play("TextInp")
	$CanvasLayer2/Dialog3.visible = true
	
func change_dialog3():
	$CanvasLayer2/Dialog4/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	$CanvasLayer2/Dialog4/ColorRect/Text.play("TextInp")
	$CanvasLayer2/Dialog4.visible = true
	
func change_dialog4():
	$CanvasLayer2/Dialog5/ColorRect/Text.pause_mode = Node.PAUSE_MODE_PROCESS
	$CanvasLayer2/Dialog5/ColorRect/Text.play("TextInp")
	$CanvasLayer2/Dialog5.visible = true

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
		
		
		
		
func pick_up_key():
	$JailOpen.visible = true
	$JailOpen.visible = true
	$Jail/JailOpen.visible = true
	$Jail.visible = false
