extends KinematicBody2D


signal health_updated(health)
signal killed()

const SPEED = 350
const FLOOR = Vector2(0, -1)
const GRAVITY = 970
const JUMP_POWER = 550
const PLASMA = preload("res://Plasma.tscn")

var is_firing = false
var is_dead = false
var velocity = Vector2()

export (float) var max_health = 100

onready var health  = max_health setget _set_health
onready var inv_timer = $InvulnerabilityTimer

var coins = 0
var endlevel = 0
var pashalka = 0

func add_coin():
	coins += 1

func add_pashalka():
	pashalka += 1;
	
func add_endlevel():
	endlevel += 1;

func die():
	
	$CollisionShape2D2.set_disabled(true)
	
	$AnimatedSprite.play("die")
	$CollisionShape2D.set_deferred("disabled", true)
	is_dead = true
	
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()	
	yield(t, "timeout")
	
	if get_tree().get_current_scene().get_name() == "Level1":
		get_tree().change_scene("res://DeadScreen.tscn")		
	elif get_tree().get_current_scene().get_name() == "Level2":
		get_tree().change_scene("res://DeadScreen2.tscn")	
	elif get_tree().get_current_scene().get_name() == "Level_3":
		get_tree().change_scene("res://DeadScreen3.tscn")	
	elif get_tree().get_current_scene().get_name() == "Level_4":
		get_tree().change_scene("res://DeadScreen4.tscn")	
	elif get_tree().get_current_scene().get_name() == "Level_5":
		get_tree().change_scene("res://DeadScreen5.tscn")	
	elif get_tree().get_current_scene().get_name() == "Level_6":
		get_tree().change_scene("res://DeadScreen6.tscn")	
	elif get_tree().get_current_scene().get_name() == "Level_7":
		get_tree().change_scene("res://DeadScreen7.tscn")	
	elif get_tree().get_current_scene().get_name() == "Level_8":
		get_tree().change_scene("res://DeadScreen8.tscn")	
	elif get_tree().get_current_scene().get_name() == "Level_9":
		get_tree().change_scene("res://DeadScreen9.tscn")	
	elif get_tree().get_current_scene().get_name() == "Level_10":
		get_tree().change_scene("res://DeadScreen10.tscn")	
	
	

	
func _physics_process(delta):
	if is_dead:
		return
	if position.y > 1000:
		if get_tree().get_current_scene().get_name() == "Level1":
			get_tree().change_scene("res://DeadScreen.tscn")		
		elif get_tree().get_current_scene().get_name() == "Level2":
			get_tree().change_scene("res://DeadScreen2.tscn")	
		elif get_tree().get_current_scene().get_name() == "Level_3":
			get_tree().change_scene("res://DeadScreen3.tscn")	
		elif get_tree().get_current_scene().get_name() == "Level_4":
			get_tree().change_scene("res://DeadScreen4.tscn")	
		elif get_tree().get_current_scene().get_name() == "Level_5":
			get_tree().change_scene("res://DeadScreen5.tscn")	
		elif get_tree().get_current_scene().get_name() == "Level_6":
			get_tree().change_scene("res://DeadScreen6.tscn")	
		elif get_tree().get_current_scene().get_name() == "Level_7":
			get_tree().change_scene("res://DeadScreen7.tscn")	
		elif get_tree().get_current_scene().get_name() == "Level_8":
			get_tree().change_scene("res://DeadScreen8.tscn")	
		elif get_tree().get_current_scene().get_name() == "Level_9":
			get_tree().change_scene("res://DeadScreen9.tscn")	
		elif get_tree().get_current_scene().get_name() == "Level_10":
			get_tree().change_scene("res://DeadScreen10.tscn")	
		#position.y = 0
	if is_firing == true:
		return
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		$Position2D.position.x = abs($Position2D.position.x)
		if is_on_floor():
			$AnimatedSprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		$Position2D.position.x = abs($Position2D.position.x) * -1
		if is_on_floor():
			$AnimatedSprite.play("walk")
	else:
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite.play("idle")

	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity.y = -JUMP_POWER
		$AnimatedSprite.play("jump")
	

	if Input.is_action_just_pressed("ui_accept") && is_firing == false && is_on_floor():
		is_firing = true
		$AnimatedSprite.play("fire")

	velocity.y += (GRAVITY * delta)
	velocity = move_and_slide(velocity, FLOOR)




func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "fire":
		var plasma = PLASMA.instance()
		plasma.direction = sign($Position2D.position.x)
		plasma.position = $Position2D.global_position
		get_parent().add_child(plasma)
		is_firing = false
		
		
		


func damage(amount):
	if inv_timer.is_stopped():
		inv_timer.start()
		_set_health(health - amount)

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0 , max_health)
	if health != prev_health:
		emit_signal("health_updated", health)
		
		if health == 0:
			die() 
			emit_signal("killed")
