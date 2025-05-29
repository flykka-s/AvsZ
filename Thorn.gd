extends StaticBody2D


func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		var pr = get_parent()
		pr.Hits -= 1
		pr.Health = pr.Hits
		if pr.Hits == 0:
			body.die()

