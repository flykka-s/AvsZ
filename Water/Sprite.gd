tool
extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	_zoom()

func _zoom():
	material.set_shader_param("zoom_y", get_viewport_transform().get_scale().y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
