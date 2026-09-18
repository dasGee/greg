extends itemer

@onready var anc = $".."

@export var damage = 2
@export var scoreDam = 5
var unlockman

func _dobe():
	if $Area2D.has_overlapping_areas():
		for a in $Area2D.get_overlapping_areas():
			if a:
				unlockman = a.get_parent()
			else:
				return
			if unlockman is enemyman:
				unlockman._damagin(damage)
				await get_tree().create_timer(0.4).timeout
				g.score += scoreDam
			elif unlockman.get("friend") == false:
				$shootsprite.modulate = Color(1.825, 1.825, 0.0, 1.0)
				unlockman.modulate = Color(1.825, 1.825, 0.0, 1.0)
				$Snap.play()
				transition.find_child("par").visible = true
				Engine.time_scale = 0
				unlockman.friend = true
				unlockman.damage *= 2
				unlockman.linear_velocity = Vector2($".." / ".." / "marker".position.x * 15, $".." / ".." / "marker".position.y * 15)
				$Timer.start()
				g.score+=30
			elif unlockman.get("wallHealth"):
				unlockman.wallHealth -= damage
	else:
		$".." / "..".velocity += Vector2($".." / ".." / "marker".position.x * 10, $".." / ".." / "marker".position.y * 10)

func _physics_process(_delta):
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot"):
		if anc.yes == true:
			g.lock = true
			anc.yes = false
			$AnimationPlayer.play("lunge")

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	anc.yes = true
	g.lock = false


func _on_timer_timeout() -> void:
	transition.find_child("par").visible = false
	$shootsprite.modulate = Color(1.0, 1.0, 1.0, 1.0)
	Engine.time_scale = 1
