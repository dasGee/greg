extends AnimatableBody2D
var vah = false
func _physics_process(_delta: float):
	if vah == false:
		global_position = $Marker2D.global_position
	if $RayCast2D.is_colliding():
		if $RayCast2D.get_collider().name != "player":
			$RayCast2D.enabled= false
			vah = true
			await get_tree().create_timer(0.35).timeout
			vah = false
			$Marker2D.position = - $Marker2D.position
			$RayCast2D.target_position = - $RayCast2D.target_position
			$Arrrow.flip_h = not $Arrrow.flip_h
			$RayCast2D.enabled= true
