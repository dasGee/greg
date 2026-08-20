extends itemer
var box = load("res://scene/obj/brick_plat.tscn")
var a
var helpmehelpme

var rotated=false
func _physics_process(_delta: float):
	if rotated == true:
		$Brickplatform.global_rotation_degrees = 90
		$Brickplatform.scale.x = 0.6
	else:
		$Brickplatform.global_rotation = 0
		$Brickplatform.scale.x = 0.5
	if $RayCast2D.is_colliding() == true:
		$Marker2D.global_position = $RayCast2D.get_collision_point()
		$Brickplatform.global_position = $RayCast2D.get_collision_point()
	else:
		if pausemenu.find_child("mobile"):
			$Marker2D.position = Vector2(50,0)
		else:
			$Marker2D.position = Vector2(clamp(get_local_mouse_position().x, 0,56),0)
		$Brickplatform.position = $Marker2D.position
	if Input.is_action_just_pressed("shoot") and g.find_child("Window").visible == false and g.scrap >= 2:
		a = box.instantiate()
		if get_parent().scale.y ==-1 and rotated==true:
			a.rotation_degrees=-90
			a.scale.x = 1.1
			a.scale.y = 0.95
		elif get_parent().scale.y ==1 and rotated==true:
			a.rotation_degrees=90
			a.scale.x = 1.1
			a.scale.y = 0.95
		else:
			a.rotation_degrees=0
			a.scale.x = 1
			a.scale.y = 1
		g.scrap -= 2
		a.modulate = Color(randf_range(0.4, 1), randf_range(0.4, 1), randf_range(0.4, 1))
		a.position = $Marker2D.global_position
		get_tree().current_scene.add_child(a)
	if Input.is_action_just_pressed("shoot2") and g.find_child("Window").visible == false:
		if rotated == false:
			rotated = true
		else:
			rotated = false
