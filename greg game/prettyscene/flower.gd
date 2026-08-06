extends Node2D
var veh
var veh2
func _ready() -> void :
	if randf() < 0.05:
		queue_free()
	veh = randf_range(0.45, 0.65)
	veh2 = Vector2(randf_range(-6, 6), randf_range(-6, 6))
	if randf() < 0.3:
		$AnimatedSprite2D2.modulate = Color.from_hsv(randf_range(0, 1), randf_range(0.5, 0.85), randf_range(0.85, 1))
	if randf() < 0.15:
		$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))
	else:
		$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(0, 1), randf_range(0.5, 0.85), randf_range(0.85, 1))
	$AnimatedSprite2D2.speed_scale = randf_range(0.5, 1.5)
	$AnimatedSprite2D.speed_scale = $AnimatedSprite2D2.speed_scale

	$AnimatedSprite2D2.scale = Vector2(veh, veh)
	$AnimatedSprite2D.scale = $AnimatedSprite2D2.scale

	$AnimatedSprite2D2.rotation = randf_range(0, 6)
	$AnimatedSprite2D.rotation = $AnimatedSprite2D2.rotation

	$AnimatedSprite2D.position = veh2
	$AnimatedSprite2D2.position = veh2
