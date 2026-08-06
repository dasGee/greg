extends enemyman
var bullet = preload("res://scene/obj/bullet.tscn")
var bulleta
var dist
var boom = preload("res://scene/boom.tscn")
var boo

var anothervariableidontreallycareabout = 1

var beee = true

var CurColor = Color("ff0000ff")

var rang = 15


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
	if variation == "champ":
		anothervariableidontreallycareabout = 1.75
		$Timer.wait_time *= 0.8
		$AnimatedSprite2D / TurretGun.play("champ")
		$AnimatedSprite2D / TurretTabke.play("champ")
		CurColor = Color("FFB600")
		rang = 1
	elif variation == "minigun":
		health = floori(health * 0.5)
		anothervariableidontreallycareabout = 1.75
		$Timer.wait_time *= 0.25
		damage = 1
		$AnimatedSprite2D / TurretGun.play("minigun")
		CurColor = Color("FFE900")
		rang = 25
func _damaged():
	thingie()
	super ()
func _on_timer_timeout() -> void :
	if bingbing == false:
		bulleta = bullet.instantiate()
		bulleta.modulate = CurColor
		$AnimatedSprite2D / TurretGun / Marker2D2.position.y = rng.randf_range( - rang, rang)
		bulleta.damage = damage
		bulleta.global_position = $AnimatedSprite2D / TurretGun / Marker2D.global_position
		dist = $AnimatedSprite2D / TurretGun / Marker2D2.global_position - global_position
		bulleta.linear_velocity = dist.normalized() * rng.randi_range(105, 165) * anothervariableidontreallycareabout
		get_tree().current_scene.add_child(bulleta)
