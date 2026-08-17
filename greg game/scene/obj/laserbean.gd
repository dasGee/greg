extends Node2D

var can = true
var can2 = false
var tween

func _ready() -> void :
	$AnimatedSprite2D.speed_scale = randf_range(0.75,1.25)
	$RayCast2D.target_position = Vector2(-250, 0)
	$RayCast2D2.target_position = $RayCast2D.target_position

func _physics_process(_delta: float) -> void :
	if $RayCast2D.is_colliding():
		$RayCast2D2.target_position = to_local($RayCast2D.get_collision_point())
		$Marker2D.position = to_local($RayCast2D.get_collision_point())
		$Line2D.set_point_position(1, $Marker2D.position)
	else:
		$Line2D.visible = false
	if $RayCast2D2.is_colliding() and can == true and can2 == true:
		can = false
		g.health -= 25
		await get_tree().create_timer(1.5).timeout
		can = true


func _on_animated_sprite_2d_animation_finished() -> void :
	if $AnimatedSprite2D.animation == "charge":
		$AudioStreamPlayer2D.play()
		$Line2D.set_point_position(1, Vector2.ZERO)
		$Marker2D.position = Vector2(0, 0)
		$AnimatedSprite2D.play("shoot")
		$Line2D.visible = true
		$Line2D / AnimationPlayer.play("new_animation")
		await get_tree().create_timer(0.2).timeout
		can = true
		can2 = true
	else:
		$AudioStreamPlayer2D2.play()
		can = false
		can2 = false
		$Line2D.visible = false
		$AnimatedSprite2D.play("charge")
