extends enemyman
var dist
@export var speed: float = 110
var ragedspeed = 200
var rage = 0
var wewee = 0.5
func _physics_process(delta: float) -> void :
	super (delta)
	$AnimatedSprite2D2.global_rotation = 0
	if movercan == true and health > 0:

		dist = get_tree().current_scene.find_child("player").global_position - global_position
		linear_velocity.x = dist.normalized().x * speed + randf_range( - speed, speed)

func _ready():
	super ()
	if randf() > 0.98:
		$AnimatedSprite2D2.visible = false
		$AnimatedSprite2D.play("rare")
		$AnimatedSprite2D.scale = Vector2(0.3, 0.3)
	if randf() > 0.5:
		$AnimatedSprite2D2.flip_h = true
	if randf() > 0.95:
		$AnimatedSprite2D2.flip_v = true
	if randf() > 0.15:
		$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(0, 1), randf_range(0.5, 0.85), randf_range(0.85, 1))
	else:
		$AnimatedSprite2D.modulate = Color.from_hsv(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1))

func _on_timer_timeout() -> void :
	if movercan == true and health > 0:
		_velocii(linear_velocity.x, randf_range(200, speed * 3.75))
		speed = randf_range(51, 150)
		$Timer.wait_time = randf_range(0.5, 1.1)
func _damaged():
	super ()
	movercan = false
	_velocii(0, randf_range(200, speed * 3.75))
	await get_tree().create_timer(wewee).timeout
	movercan = true
func _damge(areea):
	if areea.name == "player":
		g.health -= damage
