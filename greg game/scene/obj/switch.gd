extends Node2D

@export var onetime: bool = true
var can = true

func _on_area_2d_area_entered(_area: Area2D):
	if can == false:
		return
	else:
		can = false
		g.switcheroo = not g.switcheroo
		$LeverOn.visible = not $LeverOn.visible
		await get_tree().create_timer(0.35).timeout
		if onetime == false:
			can = true
