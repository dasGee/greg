extends Area2D
func _on_area_entered(_area: Area2D):
	g.scrap += 1
	g.score += 3
	queue_free()
