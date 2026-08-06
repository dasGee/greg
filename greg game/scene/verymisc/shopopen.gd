extends Node2D

func _physics_process(_delta: float):
	if Input.is_action_just_pressed("interact") and $Area2D.has_overlapping_areas():
		if g.find_child("Window").visible == false:
			g.find_child("Window").show()
