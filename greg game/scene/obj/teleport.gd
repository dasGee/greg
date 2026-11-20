extends Node2D
@export var cee = CollisionShape2D
@export var add = false
@export var to = Vector2()
func _ready() -> void:
	$Area2D/CollisionShape2D.shape = cee.shape
	$Area2D/CollisionShape2D.global_position = cee.global_position

func _on_area_2d_body_entered(body: Node2D) -> void:
	if add == true:
		body.global_position+=to
	else:
		if to.y==0:
			body.global_position.x = to.x
		elif to.x==0:
			body.global_position.y = to.y
