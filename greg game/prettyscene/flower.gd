extends Node2D
var veh
var veh2

#P.S. i'm sorry

func _ready() -> void :
	#0.2 - 0.4
	Color.from_hsv(0.698, 0.62, 1.0, 1.0)
	if randf() < 0.05:
		queue_free()
	veh = randf_range(0.45, 0.65)
	veh2 = Vector2(randf_range(-6, 6), randf_range(-6, 6))
	if get_tree().current_scene.yellow == false:
		$AnimatedSprite2D2.visible = false
	if get_tree().current_scene.forceVar != "no":
		$AnimatedSprite2D.play(get_tree().current_scene.forceVar)
	elif randf() > 0.65:
		if randf() > 0.5:
			$AnimatedSprite2D.play("spikyflower")
		else:
			$AnimatedSprite2D.play("broadflower")
	if randf() < 0.3 or get_tree().current_scene.forceYellow == true:
		if get_tree().current_scene.cangreen==true:
			$AnimatedSprite2D2.modulate = Color.from_hsv(randf_range(get_tree().current_scene.frMi, get_tree().current_scene.frMa), randf_range(get_tree().current_scene.frSaMi, get_tree().current_scene.frSaMa), randf_range(0.85, 1))
		else:
			if randi()%3 >= 1:
				$AnimatedSprite2D2.modulate = Color.from_hsv(randf_range(0.5, 1), randf_range(0.25, 0.85), randf_range(0.85, 1))
			else:
				$AnimatedSprite2D2.modulate = Color.from_hsv(randf_range(0, 0.2), randf_range(0.25, 0.85), randf_range(0.85, 1))
	if randf() < 0.05:
		if get_tree().current_scene.cangreen==true:
			$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(get_tree().current_scene.frMi, get_tree().current_scene.frMa), randf_range(get_tree().current_scene.frSaMi, get_tree().current_scene.frSaMa), randf_range(0, 1))
		else:
			if randi()%3 >= 1:
				$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(0.5, 1), randf_range(0, 1), randf_range(0, 1))
			else:
				$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(0, 0.2), randf_range(0, 1), randf_range(0, 1))
	else:
		if get_tree().current_scene.cangreen==true:
			$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(get_tree().current_scene.frMi, get_tree().current_scene.frMa), randf_range(get_tree().current_scene.frSaMi, get_tree().current_scene.frSaMa), randf_range(0.85, 1))
		else:
			if randi()%3 >= 1:
				$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(0.5, 1), randf_range(0.25, 0.85), randf_range(0.85, 1))
			else:
				$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(0, 0.2), randf_range(0.25, 0.85), randf_range(0.85, 1))
	$AnimatedSprite2D2.speed_scale = randf_range(0.1, 0.75)
	$AnimatedSprite2D.speed_scale = $AnimatedSprite2D2.speed_scale

	$AnimatedSprite2D2.scale = Vector2(veh, veh)
	$AnimatedSprite2D.scale = $AnimatedSprite2D2.scale

	$AnimatedSprite2D2.rotation = randf_range(0, 6)
	$AnimatedSprite2D.rotation = $AnimatedSprite2D2.rotation

	$AnimatedSprite2D.position = veh2
	$AnimatedSprite2D2.position = veh2
