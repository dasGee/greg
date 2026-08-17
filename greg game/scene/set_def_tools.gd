extends Area2D

func _on_body_entered(body: Node2D):
	g.tools = g.DefaultTools
	body._changetool(1)
