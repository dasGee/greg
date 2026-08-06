extends AnimatableBody2D
func _physics_process(_delta: float):
	global_position = $Marker2D.global_position
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().name != "player":
			$Marker2D.position = - $Marker2D.position
			$RayCast2D.target_position = - $RayCast2D.target_position
			$Arrrow.flip_h = not $Arrrow.flip_h
