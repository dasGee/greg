extends Node2D

func _on_area_2d_area_entered(area: Area2D) -> void :
	if area.get_parent().is_in_group("box"):
		area.get_parent().queue_free()
		g.boxBurn += 1
func _physics_process(_delta: float) -> void :
	if $enemy.has_overlapping_areas():
		g.health -= 1
