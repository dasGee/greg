extends AnimatableBody2D
var wa = false
var godown = 0.002

var lastone = Vector2(1,1)
var newone = Vector2(2,2)
var la = 0

func _physics_process(delta: float) -> void:
	if $RayCast2D2.is_colliding():
		if not $RayCast2D2.get_collider().get_parent():
			return
		if $RayCast2D2.get_collider().get_parent().has_method("_damagin"):
			g.score+=10
			$RayCast2D2.get_collider().get_parent()._damagin(2)
			
			var leleh = $Sprite2D.duplicate()
			var leleha = $Sprite2D/A.duplicate()
			leleh.add_child(leleha)
			leleha.play("dissapear")
			leleh.global_position = global_position
			leleh.global_rotation = $Sprite2D.global_rotation
			get_tree().current_scene.add_child(leleh)
			
			queue_free()
	elif $RayCast2D.is_colliding()==true:
			if $RayCast2D.get_collider().name != "player":
				$Sprite2D/A.current_animation="dissapear"
				var leleh = $Sprite2D.duplicate()
				var leleha = $Sprite2D/A.duplicate()
				leleh.add_child(leleha)
				leleha.play("dissapear")
				leleh.global_position = global_position
				leleh.global_rotation = $Sprite2D.global_rotation
				get_tree().current_scene.add_child(leleh)
				
				queue_free()
	if wa == true:

		newone=lastone-global_position
		global_position = $Marker2D.global_position + get_gravity()*delta*godown
		godown += 0.002
		lastone = global_position
		if la ==1:
			$Sprite2D.global_rotation = (atan2(newone.y, newone.x))
			$CollisionShape2D.global_rotation = (atan2(newone.y, newone.x))
		la=1
		

func _on_timer_timeout() -> void:
	wa = true
