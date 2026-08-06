extends Area2D
@export var much: int = 10
func _area(_ugh):
	g.score += much
	queue_free()
