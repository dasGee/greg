extends enemyman
var dist
@export var speed: float = 110
var ragedspeed = 185
var rage = 0
var rara
func _ready():
	rara = speed
	speed = 0
func _process(_delta: float):
	if rage >= 4:
		$AnimatedSprite2D.position = Vector2(randf_range(rage*0.5,-rage*0.5),randf_range(rage*0.5,-rage*0.5))
		$Node2D.position= Vector2(randf_range(rage*0.5,-rage*0.5),randf_range(rage*0.5,-rage*0.5)+1)
func _physics_process(_delta: float) -> void :
	if $enemy.has_overlapping_areas():
		g.health -= 1
	dist = get_tree().current_scene.find_child("player").global_position - global_position
	linear_velocity = dist.normalized() * speed

func _damagin(amount):
	rage += 1
	health -= amount
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


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	$AnimationPlayer.play("theonlyanimationthereis")
	speed = rara
