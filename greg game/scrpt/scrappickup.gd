extends Area2D
@export var gain: int = 1
func _on_area_entered(_area: Area2D):
	g.scrap += gain
	g.score += 3
	queue_free()
