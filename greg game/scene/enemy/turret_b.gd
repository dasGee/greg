extends enemyman
var bullet = preload("res://scene/obj/bullet.tscn")
var bulleta
var dist
var boom = preload("res://scene/boom.tscn")
var boo

var burst = 1
var burstwait = 0.0

var anothervariableidontreallycareabout = 1

var beee = true

var CurColor = Color("ff0000ff")

var rang = 7

var wa = 99

func thingie():
	if health <= 0 and bingbing == false and beee == true:
		beee = false
		boo = boom.instantiate()
		boo.global_position = global_position
		get_tree().current_scene.call_deferred("add_child", boo)
		if find_child("StaticBody2D"):
			$AnimatedSprite2D / TurretTabke / StaticBody2D / CollisionShape2D2.set_deferred("disabled", false)
		set_deferred("freeze", false)
		set_deferred("can_sleep", false)
		$AnimatedSprite2D / TurretTabke.call_deferred("reparent", get_tree().current_scene)

func _ready():
	super ()
	if variation == "dirt":
		burstwait = randf_range(0.75,1.25)
		burst = randi_range(1,2)
		$Timer.wait_time *= randf_range(2,4)
		wa = 99
		$AnimatedSprite2D / TurretGun / Marker2D.position = Vector2(50,0)
		$AnimatedSprite2D/TurretGun.slight = Vector2(0,-25)
		anothervariableidontreallycareabout = 1
		$AnimatedSprite2D / TurretGun.play("dirt")
		$AnimatedSprite2D / TurretTabke.play("dirt")
		CurColor = Color("ffffffff")
		rang = 5
		health = 12
		damage = 15
	if variation == "champ":
		anothervariableidontreallycareabout = 1.75
		$Timer.wait_time *= 1.15
		$AnimatedSprite2D / TurretGun.play("champ")
		$AnimatedSprite2D / TurretTabke.play("champ")
		CurColor = Color("FFB600")
		rang = 1
		health = 6
	elif variation == "minigun":
		health = 4
		burstwait = 0.225
		anothervariableidontreallycareabout = 1.5
		$Timer.wait_time *= 2.5
		burst = 9
		damage = 2
		$AnimatedSprite2D / TurretGun.play("minigun")
		CurColor = Color("FFE900")
		rang = 12
	elif variation == "alpha":
		anothervariableidontreallycareabout = 1.4
		$Timer.wait_time *= 0.85
		burst = 1
		damage = 2
		$AnimatedSprite2D / TurretGun.play("alpha")
		$AnimatedSprite2D / TurretTabke.play("alpha")
		CurColor = Color("59AAFF")
		rang = 0
		wa = 0
	elif variation == "-alpha":
		anothervariableidontreallycareabout = 1.5
		$Timer.wait_time *= 1.5
		burst = 1
		damage = 0
		$AnimatedSprite2D / TurretGun.play("alpha-")
		$AnimatedSprite2D / TurretTabke.play("alpha-")
		CurColor = Color("FFAAFF")
		rang = 0
		wa = 0
func _damaged():
	thingie()
	super ()

func _shoot():
	bulleta = bullet.instantiate()
	bulleta.modulate = CurColor
	$AnimatedSprite2D / TurretGun / Marker2D2.position.y = rng.randf_range( - rang, rang)+2
	bulleta.damage = damage
	bulleta.global_position = $AnimatedSprite2D / TurretGun / Marker2D.global_position
	dist = $AnimatedSprite2D / TurretGun / Marker2D2.global_position - $AnimatedSprite2D/TurretGun.global_position
	bulleta.linear_velocity = dist.normalized() * rng.randi_range(125, 145) * anothervariableidontreallycareabout
	if variation == "dirt":
		bulleta.global_position = $AnimatedSprite2D / TurretGun / Marker2D.global_position
		bulleta.variant = "dirt"
	if wa != 99:
		$AnimatedSprite2D / TurretGun / Marker2D2.position.y = rng.randf_range( - rang, rang)+2
		dist = $AnimatedSprite2D / TurretGun / Marker2D2.global_position - $AnimatedSprite2D/TurretGun.global_position
		bulleta.linear_velocity = dist.normalized() * 100 * anothervariableidontreallycareabout
		bulleta.gravity_scale = wa
	get_tree().current_scene.add_child(bulleta)

func _on_timer_timeout() -> void :
	if bingbing == false:
		for a in burst:
			_shoot()
			await get_tree().create_timer(burstwait).timeout
		if variation == "dirt":
			burstwait = randf_range(0.75,1.25)
			burst = randi_range(1,2)
			$Timer.wait_time = randf_range(3,5)
		$Timer.start()
