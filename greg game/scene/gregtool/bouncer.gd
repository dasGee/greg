extends itemer
@onready var anc = $".."
@onready var ray = $RayCast2D
var unlockman
var yeah = true
func _physics_process(_delta):
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot"):
		if yeah == false:
			return
		yeah = false
		if anc.yes == true:
			g.lock = true
			anc.yes = false
			$AnimationPlayer.stop()
			$AnimationPlayer.play("bounce")
			$Timer.start()
		if $Area2D.has_overlapping_areas():
			for a in $Area2D.get_overlapping_areas():
				if a:
					unlockman = a.get_parent()
				if unlockman is enemyman:
					unlockman.movercan = false
					unlockman.linear_velocity = Vector2($".." / ".." / "marker".position.x * -1.225, $".." / ".." / "marker".position.y * -1.225)
					await get_tree().create_timer(0.45).timeout
					g.score += 1
				elif unlockman.get("friend") == false:
					unlockman.friend = true
					unlockman.linear_velocity = Vector2($".." / ".." / "marker".position.x * -1.125, $".." / ".." / "marker".position.y * -1.125)
		elif ray.get_collider():
			$".." / "..".velocity += Vector2($".." / ".." / "marker".position.x * 3.25, $".." / ".." / "marker".position.y / 1.3 - 20)
		await get_tree().create_timer(0.5).timeout
		yeah = true
func _on_timer_timeout() -> void :
	anc.yes = true
	g.lock = false
