extends Sprite

var dialog = false

func _process(delta):
	var pl = get_parent().get_player()
	if !dialog && $JailOpen.visible && position.distance_to(pl.position) < 200:
		dialog = true
		get_parent().start_dialog_victory()
