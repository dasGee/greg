extends enemyman

@export var playerange = 250
@export var speed = 100
var speedAttack = 0.24
var speedUnAttack = 0.6
var dir = 1
var playered
var canwalk = true

func _ready():
	super()
	

func _physics_process(_delta: float) -> void:
	playered = get_tree().current_scene.find_child("player")
	#i know there might be better ways to do this but i dont really caver
	if canwalk == false:
		return
	if global_position.distance_to(playered.global_position) < playerange and global_position.distance_to(playered.global_position) > 10:
		if playered.global_position.y > global_position.y+45 or playered.global_position.y < global_position.y-45:
			dir = 0
			#sprit.animation = "stand"+variation
		else:
			#sprit.animation = "walk"+variation
			if playered.global_position.x > global_position.x and $RayCast2D.is_colliding():
				dir = 1
				sprit.flip_h = false
			elif playered.global_position.x < global_position.x and $RayCast2D2.is_colliding():
				dir = -1
				sprit.flip_h = true
			else:
				#sprit.animation = "stand"+variation
				dir = 0
	else:
		dir = 0
		#sprit.animation = "stand"+variation
	if linear_velocity.x > 1 or linear_velocity.x < -1:
		sprit.animation = "walk"+variation
	else:
		sprit.animation = "stand"+variation
	linear_velocity.x = speed * dir


func _on_poke_body_entered(_body: Node2D) -> void:
	if canwalk == false:
		return
	$poke/CollisionShape2D.shape.extents = Vector2(15,20)
	canwalk=false
	sprit.animation ="poke"+variation
	await get_tree().create_timer(speedAttack).timeout
	if health > 0 and $poke.overlaps_area(playered.find_child("hit")):
		g.health -= damage
	await get_tree().create_timer(speedUnAttack).timeout
	$poke/CollisionShape2D.shape.extents = Vector2(0.5,20)
	canwalk=true


func _on_poke_2_body_entered(grr: Node2D) -> void:
	if grr.name == "player" and health > 0 and canwalk == true:
		canwalk = false
		g.health -= damage
		await get_tree().create_timer(speedUnAttack).timeout
		canwalk = true
