extends RigidBody2D

@onready var timer: Timer = $Timer
var rng = RandomNumberGenerator.new()

var speed = 100
var cando = true
var hh = 15
var ohmeohmy
func _physics_process(_delta: float):
	ohmeohmy = owner.get_parent().get_parent().find_child("player")
	if $enemy.get_meta("health") <= 0:
		queue_free()
	if ohmeohmy.global_position.x > global_position.x - 25 and cando == true:
		speed = 100
		linear_velocity.x = speed
		$AnimatedSprite2D.flip_h = false
	elif ohmeohmy.global_position.x < global_position.x + 25 and cando == true:
		speed = -100
		linear_velocity.x = speed
		$AnimatedSprite2D.flip_h = true
	if hh > $enemy.get_meta("health"):
		linear_velocity.x = speed * 2.5 * rng.randf_range(-2, 2)
		linear_velocity.y -= 200
		cando = false
	hh = $enemy.get_meta("health")

func _on_timer_timeout() -> void :
	timer.wait_time = rng.randf_range(3, 5)
	linear_velocity.y -= 150
	cando = true
func _on_enemy_area_entered(grr: Area2D):
	if grr.name == "hit":
		g.health -= 1
		linear_velocity.x = speed * 2.5 * rng.randf_range(-2, 2)
		linear_velocity.y -= 400
		cando = false
