extends enemyman

var direct = -150
var height = 1.0

@onready var seeleft: RayCast2D = $seeleft
@onready var seeright: RayCast2D = $seeright
@onready var body: RigidBody2D = $"."
@onready var timer: Timer = $Timer
@onready var prite: AnimatedSprite2D = $AnimatedSprite2D

var minm = 0.6
var maxm = 1.2

func _ready():
	super ()
	if variation == "rabbit":
		minm = 1
		maxm = 1.5
		prite.play("rabbit")
		damage = 0
		var wege = randi_range(0,4)
		if wege == 0:
			$AnimatedSprite2D.modulate=Color(0.289, 0.289, 0.289, 1.0)
		elif wege == 1:
			$AnimatedSprite2D.modulate=Color(1.0, 0.741, 0.398, 1.0)
		elif wege == 2:
			$AnimatedSprite2D.modulate=Color(1.0, 1.0, 1.0, 1.0)
		elif wege == 3:
			$AnimatedSprite2D.modulate=Color(1.0, 0.867, 0.529, 1.0)
		elif wege == 3:
			$AnimatedSprite2D.modulate=Color(0.822, 0.822, 0.822, 1.0)
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
	if variation == "longie":
		health =8
		damage = 6
		minm = 1.25
		maxm = 2.5
		height = rng.randf_range(1.45,1.75)
		score = 100
		$seeleft.target_position*=2
		$seeright.target_position*=2
		prite.play("longie")
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
		_velocii(direct, rng.randf_range(220, 280)*height)
		prite.play(variation)
		timer.wait_time = rng.randf_range(minm, maxm)

func _on_enemy_body_entered(grr: Node2D) -> void :
	if grr.name == "player":
		if health > 0:
			g.health -= damage
			
