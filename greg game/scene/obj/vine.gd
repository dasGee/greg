extends Node2D
var wawal=true
@export var wallHealth: int = 2:
	set(val):
		wallHealth = val
		if wallHealth <= 0 and wawal == true:
			wawal=false
			$AnimatedSprite2D.play("new_animation")
			$StaticBody2D.set_deferred("disabled", true)
			$Area2D/CollisionShape2D.set_deferred("disabled", true)
			$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("new_animation_1")
