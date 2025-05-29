 extends KinematicBody2D

var SPEED = 100
const FLOOR = Vector2(0, -1)
const GRAVITY = 970

var velocity = Vector2()
var is_alive = true
var is_attacking = false

var destination = Vector2()
var target = null

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
	$AnimatedSprite.flip_h = velocity.x < 0

func cancel_movement():
	velocity = Vector2()
	destination = Vector2()
	

func _process(delta):
	if velocity && is_alive && !is_attacking:
		velocity.y += (GRAVITY)
		$AnimatedSprite.play("walk")
		move_and_slide(velocity, FLOOR)
	if is_alive:
		search_for_target()

func kill():
	is_alive = false
	velocity.x = 0
	$AnimatedSprite.play("dead")
	$CollisionShape2D.set_deferred("disabled", true)
	position.y += 30

#func _physics_process(delta):
#	var pl = get_parent().get_player()
#	if is_alive && !is_attacking:
#		velocity.x = SPEED * direction
#		$AnimatedSprite.play("walk")
#	velocity.y += (GRAVITY * delta)
#	if is_alive && position.distance_to(pl.position) < 800:
#		velocity = move_and_slide(velocity, FLOOR)
#	elif is_alive && position.distance_to(pl.position) >= 800:
#		$AnimatedSprite.play("stay")		
#	if is_on_wall():
#		change_direction()

func _on_Area2D_body_entered(body):
	if is_alive && "Player" in body.name:
		is_attacking = true
		$AnimatedSprite.play("attack")
		var pr = get_parent()
		pr.Hits -= 1
		pr.Health = pr.Hits
		if pr.Hits == 0:
			body.die()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "attack":
		is_attacking = false


func _on_StandsTimer_timeout():
	cancel_movement()
