extends Node2D
var diff
var e = false
func _process(delta: float) -> void :
	for other_area in $Area2D.get_overlapping_areas():
		if other_area.get_parent().get("velocity"):
			if other_area.get_parent().name == "player" and e == false:
				e = true
				g.health -= 10
			elif other_area.get_parent() is enemyman and e == false:
				e = true
				other_area.get_parent().set("health", -2)
			diff = global_position - other_area.global_position
			if other_area.get_parent().velocity.y < -350:
				other_area.get_parent().velocity.y = -350
			elif other_area.get_parent().velocity.y < 100:
				other_area.get_parent().velocity.y = -375
			if other_area.get_parent().velocity.x <= 0 and other_area.get_parent().velocity.x >= -200:
				other_area.get_parent().velocity.x -= 200
			elif other_area.get_parent().velocity.x >= 0 and other_area.get_parent().velocity.x <= 200:
				other_area.get_parent().velocity.x += 200
			other_area.get_parent().velocity += - diff.normalized() * delta * 13000.0 * Vector2(0.8, 0.65)
