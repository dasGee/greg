extends RigidBody2D

var dist
var vel

@export var variant: String

@export var damage: int

@export var friend: bool

func _ready():
	if variant == "dirt":
		$Sprite2D.play("dirt")
		$CollisionShape2D.shape.extents = Vector2(6,6)
		$Sprite2D.scale = Vector2(0.5,0.5)
		gravity_scale=randf_range(0.025, 0.05)

func _process(_delta):
	$Sprite2D.rotation = atan2(linear_velocity.y, linear_velocity.x)

func _on_timer_timeout() -> void :
	$AnimationPlayer.play("begone")
func _on_body_entered(area: Node) -> void :
	if area.name == "player" and friend == false:
		g.health -= damage
		set_deferred("contact_monitor", false)
	elif area.has_method("_damagin") and friend == true:
		g.score+=damage
		area._damagin(damage)
		set_deferred("contact_monitor", false)
	if area.get_parent().get("wallHealth"):
		area.get_parent().wallHealth -=damage
	$AnimationPlayer.play("begone")
