extends Node2D

func _on_area_2d_area_entered(area: Area2D) -> void :
	if area.get_parent().is_in_group("box"):
		print("yeah")
		area.get_parent().queue_free()
		g.boxBurn += 1
		$"../Node2D3/AnimationPlayer".play("new_animation")
