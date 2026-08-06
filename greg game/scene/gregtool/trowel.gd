extends itemer
var box = load("res://scene/obj/brick_plat.tscn")
var a
var helpmehelpme
func _process(_delta: float):
	$Brickplatform.global_rotation = 0
	if $RayCast2D.is_colliding() == true:
		$Marker2D.global_position = $RayCast2D.get_collision_point()
		$Brickplatform.global_position = $RayCast2D.get_collision_point()
	else:
		$Marker2D.position = Vector2(54, 0)
		$Brickplatform.position = Vector2(54, 0)
	if Input.is_action_just_pressed("shoot") and g.find_child("Window").visible == false and g.scrap >= 2:
		g.scrap -= 2
		a = box.instantiate()
		a.modulate = Color(randf_range(0.4, 1), randf_range(0.4, 1), randf_range(0.4, 1))
		a.position = $Marker2D.global_position
		get_tree().current_scene.add_child(a)
