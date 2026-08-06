extends itemer
var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")
func _process(_delta: float) -> void :
	if $RayCast2D.is_colliding():
		$Openhandeye.texture = load("res://asest/sprite/allelse/handeye.png")
	else:
		$Openhandeye.texture = load("res://asest/sprite/allelse/openhandeye.png")
	if Input.is_action_just_pressed("shoot"):
		if $RayCast2D.is_colliding():
			if $RayCast2D.get_collider().get("isUnlock") == true:
				transition.find_child("AnimationPlayer2").play("itemget")
				g.toolsAvailable.insert(0, $RayCast2D.get_collider().get("Unlock"))
				config.set_value("toolFind", $RayCast2D.get_collider().get("Unlock"), true)
				config.save("user://Greg.cfg")
				print("yaeh")
			else:
				g.tools.set(g.current, $RayCast2D.get_collider().item)
				g.toolr.emit()
			if $RayCast2D.get_collider().destroy == true and $RayCast2D.get_collider().ugh == false:
				$RayCast2D.get_collider().ugh = true
				$RayCast2D.get_collider().get("destroyee").queue_free()
