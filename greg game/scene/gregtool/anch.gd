extends itemer

@onready var anc = $".."

@export var damage = 2
@export var scoreDam = 5
var unlockman

func _ready() -> void:
	anc.get_parent().find_child("Anchortool").visible = true
	$shootsprite.modulate = anc.get_parent().find_child("Anchortool").modulate

func _physics_process(_delta):
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot"):
		if anc.yes == true:
			g.lock = true
			anc.yes = false
			$AnimationPlayer.play("lunge")
			anc.get_parent().find_child("Anchortool").visible = false
	elif Input.is_action_just_pressed("shoot2"):
		if get_parent().get_parent().getdown == 1:
			$".." / "..".velocity += Vector2(0, 500)
			anc.get_parent().find_child("toolsiesanim").play("anchor")
			anc.get_parent().find_child("Anchortool").modulate = Color(0.49, 0.49, 1.0, 1.0)
			$shootsprite.modulate = Color(0.49, 0.49, 1.0, 1.0)
			get_parent().get_parent().getdown = 1.45
			get_parent().get_parent().speedmuilt = 1.175
		else:
			anc.get_parent().find_child("toolsiesanim").play("anchor")
			anc.get_parent().find_child("Anchortool").modulate = Color(1.0, 1.0, 1.0, 1.0)
			$shootsprite.modulate =Color(1.0, 1.0, 1.0, 1.0)
			get_parent().get_parent().getdown = 1
			get_parent().get_parent().speedmuilt = 1
func shot():
	if $".." / ".." / "marker".global_position.x > $".." / "..".global_position.x:
		$".." / "..".velocity += Vector2(-555, -155)
	else:
		$".." / "..".velocity += Vector2(555, -155)
	for a in $Area2D.get_overlapping_areas():
		if a:
			unlockman = a.get_parent()
		else:
			return
		if unlockman is enemyman:
			unlockman._damagin(damage)
			g.score += scoreDam
		elif unlockman.get("friend") == false:
			transition.find_child("par").visible = true
			Engine.time_scale = 0.01
			unlockman.friend = true
			unlockman.damage *= 2
			unlockman.linear_velocity = Vector2($".." / ".." / "marker".position.x * -15, $".." / ".." / "marker".position.y * -12)
			$Snap.play()
			$shootsprite.modulate = Color(0.0, 0.0, 1.825, 1.0)
			unlockman.modulate = Color(0.0, 0.0, 1.825, 1.0)
			$Timer.start()
			g.score+=10
		elif unlockman.get("wallHealth"):
			unlockman.wallHealth -= damage
		else:
			return

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	anc.yes = true
	g.lock = false
	anc.get_parent().find_child("Anchortool").visible = true
	anc.get_parent().find_child("toolsiesanim").play("anchor")

func _on_timer_timeout() -> void:
	transition.find_child("par").visible = false
	Engine.time_scale = 1
	$shootsprite.modulate = anc.get_parent().find_child("Anchortool").modulate
