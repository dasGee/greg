extends CollisionShape2D
func _process(_delta: float) -> void :
	if Input.is_action_pressed("down"):
		disabled = true
	else:
		disabled = false
