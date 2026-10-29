extends Node2D
@export var cancan=true
var a = preload("res://scene/boom.tscn")
var b

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	$Mine.rotation_degrees=randi_range(0,360)
	$Mine.scale.x = randf_range(0.95,1.2)
	$Mine.scale.y = $Mine.scale.x
func timeout() -> void:#i dont care
	$Timer.wait_time=30
	$Line2D.set_point_position(1,to_local($RayCast2D.get_collision_point()))

func _on_area_2d_area_entered(_area: Area2D) -> void:
	if cancan == true:
		b = a.instantiate()
		b.scale = Vector2(1.5,1.5)
		b.global_position = global_position
		get_parent().call_deferred("add_child",b)
		queue_free()
