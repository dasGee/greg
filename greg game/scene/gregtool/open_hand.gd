extends itemer
var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")
func _physics_process(_delta: float):
	#super(delta)
	if $RayCast2D.is_colliding():
		$Openhandeye.texture = load("res://asest/sprite/allelse/handeye.png")
	else:
		$Openhandeye.texture = load("res://asest/sprite/allelse/openhandeye.png")
	if Input.is_action_just_pressed("shoot"):
		if $RayCast2D.is_colliding():
			if $RayCast2D.get_collider().get_parent() is interact:
				$RayCast2D.get_collider().get_parent().emit_signal("interacted")
			if $RayCast2D.get_collider().get("destroy"):
				if $RayCast2D.get_collider().destroy == true and $RayCast2D.get_collider().ugh == false:
					$RayCast2D.get_collider().ugh = true
					$RayCast2D.get_collider().get("destroyee").queue_free()
	elif Input.is_action_pressed("shoot2"):
		$Openhandeye.texture = load("res://asest/sprite/allelse/handeye.png")
