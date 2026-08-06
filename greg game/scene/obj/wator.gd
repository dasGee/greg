extends Node2D
@export var air: bool = false
@export var airCount: int = 10
func _physics_process(_delta: float):
	if $player.has_overlapping_areas():
		if air == false:
			g.inwater = true
		else:
			if g.water <= 1000:
				g.water += airCount
	pass
