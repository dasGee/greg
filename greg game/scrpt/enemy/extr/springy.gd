extends enemyman

var direct = -150

@onready var seeleft: RayCast2D = $seeleft
@onready var seeright: RayCast2D = $seeright
@onready var body: RigidBody2D = $"."
@onready var timer: Timer = $Timer
@onready var prite: AnimatedSprite2D = $AnimatedSprite2D

var minm = 0.6
var maxm = 1.2

func _ready():
	super ()
	if variation == "champ":
		minm = 0.7
		maxm = 0.9
		prite.play("champ")
	if variation == "ghost":
		health =1
		damage = 2
		minm = 1.5
		maxm = 2.25
		prite.play("ghost")
	if rng.randi_range(1, 100) == 100:
		minm = 1
		maxm = 2
		variation = "cat"
		prite.play("cat")

func _on_timer_timeout() -> void :
	if health <= 0:
		pass
	else:
		if seeleft.is_colliding():
			#if seeleft.get_collider().name == "hit":
				#g.health -= floori(damage * 0.5)
			prite.flip_h = false
			direct = rng.randf_range(140, 210)
		elif seeright.is_colliding():
			#if seeright.get_collider().name == "hit":
				#g.health -= floori(damage * 0.5)
			prite.flip_h = true
			direct = rng.randf_range(-210, -140)
		_velocii(direct, rng.randf_range(220, 280))
		prite.play(variation)
		timer.wait_time = rng.randf_range(minm, maxm)

func _on_enemy_body_entered(grr: Node2D) -> void :
	if grr.name == "player":
		if health > 0:
			g.health -= damage
