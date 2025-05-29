extends KinematicBody2D

var SPEED = 100
const FLOOR = Vector2(0, -1)
const GRAVITY = 970

var velocity = Vector2()
var is_alive = true
var is_attacking = false

var HP = 5
var immun = 0
var rush = false

var destination = Vector2()
var stands = true
var target = null

var dialog = false

func startTimer():
	if is_alive:
		$Timer.start(6)
		$Shield.visible = true

func search_for_target():
	var pl = get_parent().get_player()
	if position.distance_to(pl.position) < 800:
		target = pl
	else:
		if target:
			cancel_movement()
		target = null
	if target:
		set_distination(target.position)

func set_distination(dest):
	destination = dest
	velocity = (destination - position).normalized() * SPEED
	stands = false

func cancel_movement():
	velocity = Vector2()
	destination = Vector2()
	

func _process(delta):
	
	var pl = get_parent().get_player()
	if !dialog && position.distance_to(pl.position) < 500:
		dialog = true
		get_parent().start_dialog()
	if velocity && is_alive:
		velocity.y += (GRAVITY)
		move_and_slide(velocity, FLOOR)
	if !rush && is_alive:
		rush = true
		rush()
		$rush_duration.start(2)
		$rush_cd.start(9)
	if is_alive:
		search_for_target()
		
	if velocity.x < 0 and is_alive:
		$Polygon2D.visible = false
		$Polygon2D2.visible = true
		$AnimationPlayer2.play("Walk")		
	if velocity.x > 0 and is_alive:
		$Polygon2D.visible = true
		$Polygon2D2.visible = false
		$AnimationPlayer.play("Walk")
	

#func _physics_process(delta):
#	var pl = get_parent().get_player()
#	if is_alive && !is_attacking:
#		velocity.x = SPEED * direction
#	velocity.y += (GRAVITY * delta)
#	if is_alive && position.distance_to(pl.position) < 800:
#		velocity = move_and_slide(velocity, FLOOR)
#	if is_on_wall():
#		change_direction()

func rush():
	SPEED = 300

func kill():
	is_alive = false
	velocity.x = 0
	$CollisionShape2D.set_deferred("disabled", true)
	position.y += 30
	$AnimationPlayer.play("Idle")
	$AnimationPlayer2.play("Idle")
	get_parent().uldran_died()


func _on_Area2D_body_entered(body):
	if is_alive && "Player" in body.name:
		var pr = get_parent()
		pr.Hits -= 1
		pr.Health = pr.Hits
		if pr.Hits == 0:
			body.die()


func _on_AnimatedSprite_animation_finished():
		is_attacking = false
	

func _on_Timer_timeout():
	immun = 0
	$Shield.visible = false


func _on_rush_duration_timeout():
	SPEED = 100


func _on_rush_cd_timeout():
	rush = false
