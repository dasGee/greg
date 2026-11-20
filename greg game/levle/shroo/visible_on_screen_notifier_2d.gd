extends VisibleOnScreenNotifier2D
var we = false
func _on_screen_entered() -> void:
	if we == false:
		we = true
		$"../AnimationPlayer".play("new_animation")
