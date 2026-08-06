extends TileMapLayer
func _process(_delta: float) -> void :
	if Input.is_action_pressed("down"):
		collision_enabled = false
	else:
		collision_enabled = true
