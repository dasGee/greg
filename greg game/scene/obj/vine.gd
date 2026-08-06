extends Node2D
@export var wallHealth: int = 2:
	set(val):
		wallHealth = val
		if wallHealth <= 0:
			$AnimatedSprite2D.play("new_animation")
			$StaticBody2D / CollisionShape2D.disabled = true
			$Area2D / CollisionShape2D.disabled = true
func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.play("new_animation_1")
