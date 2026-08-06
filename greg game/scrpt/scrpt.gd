extends CharacterBody2D

@export var maxhealth: int
@onready var spr: AnimatedSprite2D = $AnimatedSprite2D

var rng = RandomNumberGenerator.new()
const SPEED = 150.0
var JUMP_VELOCITY = -450.0
var canjump = false


@onready var TemCur = $anchor / placeholder

var ui1 = preload("res://prettyscene/background.tscn")
var ui2 = preload("res://scene/verymisc/canvas_layer.tscn")

func _changetool(num):
	g.current = num
	if g.lock:
		return
	else:
		TemCur.queue_free()
		TemCur = g.tools.get(num).instantiate()
		$anchor.add_child(TemCur)

func _wobble():
	_changetool(g.current)

func _gothit(_meh):
	JUMP_VELOCITY = -200
	velocity.y = JUMP_VELOCITY
	spr.play("gethit")
	g.canHealth = false
	$AnimationPlayer.play("gothit")
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.stop()
	g.canHealth = true


func _ready():
	g.healthChange.connect(_gothit)
	g.toolr.connect(_wobble)
	get_tree().current_scene.add_child(ui1.instantiate())
	get_tree().current_scene.add_child(ui2.instantiate())

	g.DefaultTools = {
	1: load("res://scene/gregtool/openHand.tscn"), 
	2: load("res://scene/gregtool/openHand.tscn"), 
	3: load("res://scene/gregtool/openHand.tscn"), 
	4: load("res://scene/gregtool/openHand.tscn"), 
	}

func _jump():
	JUMP_VELOCITY = -350 - abs(velocity.x * 0.45)
	velocity.y = JUMP_VELOCITY
	canjump = false
	if velocity.x > 0: velocity.x += 25
	elif velocity.x < 0: velocity.x -= 25

func _physics_process(delta: float) -> void :
	if Input.is_action_just_pressed("tool_one"):
		_changetool(1)
	if Input.is_action_just_pressed("tool_two"):
		_changetool(2)
	if Input.is_action_just_pressed("tool_three"):
		_changetool(3)
	if Input.is_action_just_pressed("tool_four"):
		_changetool(4)

	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor() and canjump == false:
		canjump = true

	if (Input.is_action_pressed("jump") or Input.is_action_pressed("up")) and canjump == true:
		_jump()

	var direction: = Input.get_axis("left", "right")

	if direction > 0:
		spr.flip_h = true
	if direction < 0:
		spr.flip_h = false
	if g.canHealth == true:
		if is_on_floor():
			if direction == 0:
				spr.play("idle")
			else:
				spr.play("walk")
		else:
			spr.play("jump")


	if direction and g.canHealth == true:

		velocity.x = lerp(velocity.x, SPEED * direction, 0.2)

	else:
		velocity.x = lerp(velocity.x, 0.0, 0.2)


	move_and_slide()

	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse( - c.get_normal() * 80)
