extends enemyman
@export var roll = false

var tempor = false
var startdirect = -1

var bege = true
var gasege=0
var direct = -150
var height = 1.0
@onready var seeleft: RayCast2D = $seeleft
@onready var seeright: RayCast2D = $seeright
@onready var body: RigidBody2D = $"."
@onready var timer: Timer = $Timer
@onready var prite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super ()
	if startdirect==1:
		prite.flip_h = false
		direct = rng.randf_range(140, 210)
	var wege = randi_range(0,4)
	if wege == 0:
		$AnimatedSprite2D.modulate=Color(0.289, 0.289, 0.289, 1.0)
	elif wege == 1:
		$AnimatedSprite2D.modulate=Color(1.0, 0.741, 0.398, 1.0)
	elif wege == 2:
		$AnimatedSprite2D.modulate=Color(1.0, 1.0, 1.0, 1.0)
	elif wege == 3:
		$AnimatedSprite2D.modulate=Color(1.0, 0.867, 0.529, 1.0)
	elif wege == 4:
		$AnimatedSprite2D.modulate=Color(0.822, 0.822, 0.822, 1.0)

	if roll == false:
		set_deferred("lock_rotation",true)
		global_rotation=0
		$circle.set_deferred("disabled", true)
		$square.set_deferred("disabled", false)
	else:
		$AnimatedSprite2D.play("roll")
		$circle.set_deferred("disabled", false)
		$square.set_deferred("disabled", true)

func _on_body_entered(wee: Node) -> void :
	if wee.get_parent().has_method("_damagin") and bege == true:
		$AudioStreamPlayer2D2.play()
		roll=false
		bege=false
		$AnimatedSprite2D.play("rabbit")
		wee.get_parent()._damagin(4)
		g.score+=10
		if roll==true:
			wee.get_parent()._damagin(4)
		set_deferred("contact_monitor", false)
		global_rotation=0
		set_deferred("lock_rotation",true)
		$circle.set_deferred("disabled", true)
		$square.set_deferred("disabled", false)
		await get_tree().create_timer(0.8).timeout
		bege = true


func _on_timer_timeout() -> void :
	height=randf_range(0.75,1.8)
	if roll == true:
		gasege+=1
		if gasege==9:
			roll=false
			$AnimatedSprite2D.play("rabbit")
			set_deferred("contact_monitor", false)
			global_rotation=0
			set_deferred("lock_rotation",true)
			$circle.set_deferred("disabled", true)
			$square.set_deferred("disabled", false)
		return
	if health <= 0:
		pass
	else:
		global_rotation=0
		if randi_range(0,1)==1:
			$AudioStreamPlayer2D.volume_db=0
			$AudioStreamPlayer2D.pitch_scale=randf_range(0.5,1.25)
			$AudioStreamPlayer2D.play()
		else:
			$AudioStreamPlayer2D.volume_db=-10
			$AudioStreamPlayer2D.pitch_scale=randf_range(0.5,1.25)
			$AudioStreamPlayer2D.play()
		if seeleft.is_colliding():
			prite.flip_h = false
			direct = rng.randf_range(140, 210)
		elif seeright.is_colliding():
			prite.flip_h = true
			direct = rng.randf_range(-210, -140)
		_velocii(direct, rng.randf_range(220, 280)*height)
		prite.play("rabbit")
		timer.wait_time = rng.randf_range(0.9, 2.25)
		if tempor==true:
			_damagin(1)
