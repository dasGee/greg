extends Node2D
@export var a = false
func _on_area_2d_area_entered(_area: Area2D) -> void :
	if a == false:
		$AnimationPlayer.call_deferred("play", "break")
