extends itemer
var box = load("res://scene/enemy/box.tscn")
var a
var helpmehelpme
func _physics_process(_delta):
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot") and g.find_child("Window").visible == false:
		a = box.instantiate()
		a.position = $Box.global_position
		a.rotation = $Box.rotation
		a.linear_velocity = (Vector2($".." / ".." / "marker".position.x, $".." / ".." / "marker".position.y * 1.25) + $".." / "..".velocity)
		get_tree().current_scene.add_child(a)
		g.tools.set(g.current, load("res://scene/gregtool/openHand.tscn"))
		g.toolr.emit()
		
	elif Input.is_action_just_pressed("shoot2") and g.find_child("Window").visible == false:
		a = box.instantiate()
		a.position = $Box.global_position
		get_tree().current_scene.add_child(a)
		g.tools.set(g.current, load("res://scene/gregtool/openHand.tscn"))
		g.toolr.emit()
