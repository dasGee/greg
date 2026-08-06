extends itemer

@onready var anc = $".."
@onready var ray = $RayCast2D

@export var damage = 2
@export var scoreDam = 5
var unlockman

func _physics_process(_delta):
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot"):
		if anc.yes == true:
			g.lock = true
			anc.yes = false
			$AnimationPlayer.play("lunge")
			$Timer.start()
			await get_tree().create_timer(0.02).timeout
			if ray.get_collider():
				$".." / "..".velocity += Vector2($".." / ".." / "marker".position.x * 8.5, $".." / ".." / "marker".position.y * 5.75)
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
						unlockman.friend = true
						unlockman.linear_velocity = Vector2($".." / ".." / "marker".position.x * -8, $".." / ".." / "marker".position.y * -8)
					elif unlockman.get("wallHealth"):
						unlockman.wallHealth -= damage
					else:
						return

func _on_timer_timeout() -> void :
	anc.yes = true
	g.lock = false
