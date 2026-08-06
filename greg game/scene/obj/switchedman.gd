extends Node2D
@export var switch: bool = true
func _ready() -> void :
	g.switcherood.connect(switchee)
func switchee():
	if g.switcheroo == switch:
		$Manrest.visible = false
		$StaticBody2D / CollisionShape2D.set_deferred("disabled", true)
	else:
		$Manrest.visible = true
		$StaticBody2D / CollisionShape2D.set_deferred("disabled", false)
