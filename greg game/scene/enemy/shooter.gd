extends enemyman

@export var playerange = 250
@export var speed = 100
var speedAttack = 0.24
var speedUnAttack = 0.6
var jump = 1.0
var dir = 1
var playered
@export var bahbe=false
@export var canrot = true
@export var isattt = false
var meh = 10
var juu = true
func _ready():
	if variation == "cyan":
		$Node2D/Line2D2.default_color = Color(0.0, 0.459, 0.459, 1.0)
		$Line2D.default_color = Color(0.0, 1.0, 1.0, 0.0)
		$Node2D/RobotShooCannon.play("cannoncyan")
		jump = 1.25
		playerange=50
		speed=115
		health=9
		score = 350
		movercanTimer=1.75


func _process(_delta: float) -> void:
	$s.global_position = $Node2D/s2.global_position
	if $Node2D/RayCast2D.is_colliding():
		$e.global_position=$Node2D/RayCast2D.get_collision_point()
	else:
		$e.global_position=$Node2D/emer.global_position
	$Line2D.set_point_position(0,$s.position)
	$Line2D.set_point_position(1,$e.position)

func _physics_process(delta: float) -> void:
	playered = get_tree().current_scene.find_child("player")
	 #waiter waiter! 5000 if conditions, please!
	if global_position.y>playered.global_position.y+50:
		if playered.global_position.x > global_position.x and $f2.is_colliding():
			dir = -1
			sprit.flip_h = false
		elif playered.global_position.x < global_position.x and $f1.is_colliding():
			dir = 1
			sprit.flip_h = true
	elif global_position.distance_to(playered.global_position) > playerange:
		if playered.global_position.x > global_position.x and $f1.is_colliding():
			dir = 1
			sprit.flip_h = false
		elif playered.global_position.x < global_position.x and $f2.is_colliding():
			dir = -1
			sprit.flip_h = true
	elif global_position.distance_to(playered.global_position) < playerange*0.5:
		if playered.global_position.x > global_position.x and $f2.is_colliding():
			dir = -1
			sprit.flip_h = false
		elif playered.global_position.x < global_position.x and $f1.is_colliding():
			dir = 1
			sprit.flip_h = true
	else:
		dir = 0
	if canrot == true:
		meh = 5*movercanTimer
	else:
		meh = 1.5*movercanTimer
	$Node2D.rotation = rotate_toward($Node2D.rotation,get_angle_to(playered.global_position),delta*meh)
	if $Node2D/RayCast2D.get_collider() is CharacterBody2D and $AnimationPlayer.is_playing()==false and bahbe == false:
		bahbe=true
		$AudioStreamPlayer2D2.play()
		await get_tree().create_timer(randf_range(0.1,0.5)).timeout
		$AudioStreamPlayer2D2.play()
		await get_tree().create_timer(randf_range(0.25,0.75)).timeout
		$AudioStreamPlayer2D2.play()
		$AnimationPlayer.play("new_animation")
	elif $Node2D/RayCast2D.get_collider() is CharacterBody2D and isattt==true:
		g.health-=damage
	if linear_velocity.x > 1 or linear_velocity.x < -1:
		sprit.animation = "walk"+variation
	else:
		sprit.animation = "stand"+variation
	linear_velocity.x = speed * dir
	if juu==true and (($RayCast2D.is_colliding() or $RayCast2D2.is_colliding()and dir != 0 ) or global_position.y>playered.global_position.y+65):
		juu = false
		_velocii(-100*dir,400*jump)
		await get_tree().create_timer(2/movercanTimer).timeout
		juu = true
