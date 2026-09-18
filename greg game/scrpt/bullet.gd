extends RigidBody2D

var dist
var vel

@export var damage: int

@export var friend: bool

func _process(_delta):
	$Sprite2D.rotation = atan2(linear_velocity.y, linear_velocity.x)

func _on_timer_timeout() -> void :
	$AnimationPlayer.play("begone")
func _on_body_entered(area: Node) -> void :
	if area.name == "player" and friend == false:
		g.health -= damage
		$AnimationPlayer.play("begone")
		set_deferred("contact_monitor", false)
	elif area.has_method("_damagin") and friend == true:
		g.score+=damage
		area._damagin(damage)
		$AnimationPlayer.play("begone")
		set_deferred("contact_monitor", false)
	else:
		$AnimationPlayer.play("begone")
	if area.get_parent().get("wallHealth"):
		area.get_parent().wallHealth -=2
