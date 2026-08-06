extends Node2D

var direct = -150
var rng = RandomNumberGenerator.new()

@onready var seeleft: RayCast2D = $RigidBody2D / seeleft
@onready var seeright: RayCast2D = $RigidBody2D / seeright
@onready var body: RigidBody2D = $RigidBody2D
@onready var timer: Timer = $Timer
@onready var prite: AnimatedSprite2D = $RigidBody2D / AnimatedSprite2D


func _physics_process(_delta: float) -> void :
	if $RigidBody2D / enemy.get_meta("health") <= 0:
		queue_free()

func _on_timer_timeout() -> void :
	if seeleft.is_colliding():
		prite.flip_h = false
		direct = rng.randf_range(140, 210)
	elif seeright.is_colliding():
		prite.flip_h = true
		direct = rng.randf_range(-210, -140)
	body.linear_velocity.x += direct
	body.linear_velocity.y -= rng.randf_range(140, 260)
	prite.play("okjump")
	timer.wait_time = rng.randf_range(0.6, 1)



func _on_rigid_body_2d_body_entered(grr: Node):
	if grr.name == "player":
		g.health -= 1
