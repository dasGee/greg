extends itemer
@onready var anc = $".."
var unlockman
const damage = 5
const scoreDam = 22
func _dobe():
	if $Area2D.has_overlapping_areas():
		for a in $Area2D.get_overlapping_areas():
			if a:
				unlockman = a.get_parent()
			else:
				return
			if unlockman is enemyman:
				unlockman._damagin(damage)
				g.score += scoreDam
			elif unlockman.get("friend") == false:
				$shootsprite.modulate = Color(1.825, 1.825, 0.0, 1.0)
				unlockman.queue_free()
				$Timer.start()
				g.score+=5
			elif unlockman.get("wallHealth"):
				unlockman.wallHealth -= damage
			elif unlockman.name=="rocketre":
				unlockman._repair()
	$".." / "..".velocity += Vector2($".." / ".." / "marker".position.x * 20, 0)

func _physics_process(_delta):
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot"):
		if anc.yes == true:
			g.lock = true
			#anc.yes = false
			$AnimationPlayer.play("lunge")

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	anc.yes = true
	g.lock = false

func _on_timer_timeout() -> void:
	$shootsprite.modulate = Color(1.0, 1.0, 1.0, 1.0)
