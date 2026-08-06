extends Area2D
func _physics_process(_delta: float) -> void :
	if has_overlapping_areas():
		g.health = 0
