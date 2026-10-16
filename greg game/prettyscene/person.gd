extends Node2D
var varia = "0"
var state = "walking"
var dire = 1
var speed = randf_range(0.25,0.75)

func _ready() -> void:
	if randf() > 0.65:
		varia = str(randi_range(1,3))
		$AnimatedSprite2D.play("walk"+varia)
func _physics_process(_delta: float) -> void:
	if state == "walking":
		position += Vector2(speed*dire,0)
		if $AnimatedSprite2D/RayCast2D.is_colliding() or $AnimatedSprite2D/RayCast2D2.is_colliding() == false:
			$AnimatedSprite2D.scale.x *= -1
			dire = -dire
	else:
		return
	pass

func _on_timer_timeout() -> void:
	$Timer.wait_time=randf_range(4,10)
	speed = randf_range(0.25,0.75)
	if randf() >= 0.35:
		state = "stand"
		$AnimatedSprite2D.play("stand"+varia)
	else:
		state = "walking"
		$AnimatedSprite2D.play("walk"+varia)
