extends Node2D



var mauspos
var yes = true
func _process(_delta: float):
	if yes == true:
		mauspos = global_position.angle_to_point(get_global_mouse_position())
		rotation = mauspos
		if mauspos > 1.5 or mauspos < -1.5:
			scale.y = -1
		elif mauspos < 1.5 or mauspos > -1.5:
			scale.y = 1
