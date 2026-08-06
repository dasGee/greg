@icon("res://asest/sprite/allelse/enemy.png")
class_name enemyman extends RigidBody2D
@export var health: int
@export var damage: int
@export var variation: String
@export var score: int
@export_subgroup("nodethings")
@export var coll: CollisionShape2D
@export var area: Area2D
@export var sprit: AnimatedSprite2D
var movercan = true
@export var movercanTimer: float = 1
var rng = RandomNumberGenerator.new()
var bingbing = false
func _physics_process(_delta: float) -> void :
	if movercan == false:
		await get_tree().create_timer(movercanTimer).timeout
		movercan = true
func _ready():
	if variation == "champ":
		score = score * 4
		health = health * 2
		damage = damage * 2
func _velocii(x, y):
	linear_velocity.x += x
	linear_velocity.y -= y
func _damaged():
	if health <= 0 and bingbing == false:
		damage = 0
		bingbing = true
		g.score += score
		g.enScore += score
		coll.set_deferred("disabled", true)
		sprit.flip_v = true
		modulate = Color(0.078, 0.078, 0.078, 0.553)
		z_index = 1
		_velocii(rng.randf_range(-150, 150), rng.randf_range(130, 230))
		get_tree().create_timer(2).timeout.connect(_deleted)
func _damagin(amount):
	health -= amount
	_damaged()
func _deleted():
	queue_free()
	pass
