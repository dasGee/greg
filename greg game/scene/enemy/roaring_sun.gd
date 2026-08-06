extends enemyman
var dist
@export var speed: float = 110
var ragedspeed = 185
var rage = 0
var rara
func _physics_process(_delta: float) -> void :
	if $enemy.has_overlapping_areas():
		g.health -= 1
	dist = get_tree().current_scene.find_child("player").global_position - global_position
	linear_velocity = dist.normalized() * speed

func _damagin(amount):
	rage += 1
	health -= amount
	rara = speed
	speed = -125
	if rage >= 4:
		ragedspeed += 30
		$AudioStreamPlayer2D.play()
		speed = 0
		modulate = Color(1.0, 0.0, 0.0, 1.0)
		await get_tree().create_timer(1.75).timeout
		speed = ragedspeed
	else:
		await get_tree().create_timer(1).timeout
		speed = rara + 15
	_damaged()


func _on_timer_timeout() -> void :
	speed += 0.25
