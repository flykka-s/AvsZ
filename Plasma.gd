extends Area2D

const SPEED = 600
export var direction = 1
var velocity = Vector2()

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	if(direction == -1):
		$Sprite.flip_h = true
	translate(velocity)

func _on_Plasma_body_entered(body):	
	if "Zombie" in body.name:
		body.kill()
		
	if "Swamp_Monster" in body.name:
		if body.immun == 0:
			body.HP -= 1
			if body.HP == 0:
				body.kill()
			body.immun = 1
			body.startTimer()
			
	if "Uldran" in body.name:
		if body.immun == 0:
			body.HP -= 1
			if body.HP == 0:
				body.kill()
			body.immun = 1
			body.startTimer()
	queue_free()
