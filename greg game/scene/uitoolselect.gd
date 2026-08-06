extends Node2D
var bee
var meh
func _physics_process(_delta):
	for a in get_children():
		bee = a.find_child("Circul2")
		meh = g.tools.get(a.name.to_int()).instantiate()
		bee.texture = meh.get("img")
		meh.queue_free()
	if g.lock == false:
		if Input.is_action_just_pressed("tool_one"):
			$"../Spring".pitch_scale = 1.2
			$"../Spring".play()
			$b1.modulate = Color(1, 0, 1, 1)
			$b2.modulate = Color(1, 1, 1, 1)
			$b3.modulate = Color(1, 1, 1, 1)
			$b4.modulate = Color(1, 1, 1, 1)
		elif Input.is_action_just_pressed("tool_two"):
			$"../Spring".pitch_scale = 1.4
			$"../Spring".play()
			$b2.modulate = Color(1, 0, 1, 1)
			$b1.modulate = Color(1, 1, 1, 1)
			$b3.modulate = Color(1, 1, 1, 1)
			$b4.modulate = Color(1, 1, 1, 1)
		elif Input.is_action_just_pressed("tool_three"):
			$"../Spring".pitch_scale = 1.6
			$"../Spring".play()
			$b3.modulate = Color(1, 0, 1, 1)
			$b1.modulate = Color(1, 1, 1, 1)
			$b4.modulate = Color(1, 1, 1, 1)
			$b2.modulate = Color(1, 1, 1, 1)
		elif Input.is_action_just_pressed("tool_four"):
			$"../Spring".pitch_scale = 1.8
			$"../Spring".play()
			$b4.modulate = Color(1, 0, 1, 1)
			$b1.modulate = Color(1, 1, 1, 1)
			$b3.modulate = Color(1, 1, 1, 1)
			$b2.modulate = Color(1, 1, 1, 1)
