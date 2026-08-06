extends itemer
var rng = RandomNumberGenerator.new()
var can
func _physics_process(_delta):
	if $".." / "..".is_on_floor():
		can = true
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot") and g.scrap >= 4 and can == true and g.find_child("Window").visible == false:
		can = false
		$smoke.restart()
		g.scrap -= 4
		g.find_child("Barur").pitch_scale = rng.randf_range(0.29, 0.31)
		g.find_child("Barur").play()
		for a in 7:
			await get_tree().create_timer(0.04).timeout
			$".." / "..".velocity = Vector2.ZERO
			$".." / "..".velocity = Vector2($".." / ".." / "marker".position.x * 12, $".." / ".." / "marker".position.y * 8.0 - 100)
