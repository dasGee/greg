extends Node2D
var bee
var meh
signal puck #i dont think instantiating something every frame is a good idea so ... signals!!!!!
func _ready() -> void:
	puck.connect(pucked)
	await get_tree().create_timer(0.1).timeout #yeah
	puck.emit()
func _process(_delta):
	if g.lock == false:
		if Input.is_action_just_pressed("tool_one"):
			puck.emit()
			$"../Spring".pitch_scale = 1.2
			$"../Spring".play()
			$b1.modulate = Color(1, 0, 1, 1)
			$b2.modulate = Color(1, 1, 1, 1)
			$b3.modulate = Color(1, 1, 1, 1)
			$b4.modulate = Color(1, 1, 1, 1)
		elif Input.is_action_just_pressed("tool_two"):
			puck.emit()
			$"../Spring".pitch_scale = 1.4
			$"../Spring".play()
			$b2.modulate = Color(1, 0, 1, 1)
			$b1.modulate = Color(1, 1, 1, 1)
			$b3.modulate = Color(1, 1, 1, 1)
			$b4.modulate = Color(1, 1, 1, 1)
		elif Input.is_action_just_pressed("tool_three"):
			puck.emit()
			$"../Spring".pitch_scale = 1.6
			$"../Spring".play()
			$b3.modulate = Color(1, 0, 1, 1)
			$b1.modulate = Color(1, 1, 1, 1)
			$b4.modulate = Color(1, 1, 1, 1)
			$b2.modulate = Color(1, 1, 1, 1)
		elif Input.is_action_just_pressed("tool_four"):
			puck.emit()
			$"../Spring".pitch_scale = 1.8
			$"../Spring".play()
			$b4.modulate = Color(1, 0, 1, 1)
			$b1.modulate = Color(1, 1, 1, 1)
			$b3.modulate = Color(1, 1, 1, 1)
			$b2.modulate = Color(1, 1, 1, 1)
func pucked():
	for a in get_children():
		bee = a.find_child("Circul2")
		if g.tools.get(a.name.to_int()) is not String:
			meh = g.tools.get(a.name.to_int()).instantiate()
		bee.texture = meh.get("img")
		meh.queue_free()
