@icon("res://asest/sprite/toolwheelsprites/rocket.png")
class_name player extends CharacterBody2D
@export_category("health")
@export var maxHealth: int
@export var defense: int:
	set(val):
		defense -= val
		if defense < 0:
			defense = 0
@export var curHealth: int:
	set(val):
		if defense > 0:
			set("defense", val)
		curHealth += val
		if maxHealth < curHealth:
			curHealth = maxHealth
@export_category("tool")
@export var tools: Dictionary[int, String] = {
1: "res://scene/gregtool/openHand.tscn", 
2: "res://scene/gregtool/openHand.tscn", 
3: "res://scene/gregtool/openHand.tscn", 
4: "res://scene/gregtool/openHand.tscn", 
}

var Current
var Curnt
@onready var TemCur = $anchor / placeholder

func _wobble():
	_changetool(Current)

func _ready():
	g.toolr.connect(_wobble)

func _changetool(num):
	Current = num
	if Current == tools.get(str(num)) or g.lock:
		return
	else:
		TemCur.queue_free()
		Current = tools.get(num)
		TemCur = load(Current).instantiate()
		$anchor.add_child(TemCur)

func _physics_process(_delta: float):
	if Input.is_action_just_pressed("tool_one"):
		_changetool(1)
	if Input.is_action_just_pressed("tool_two"):
		_changetool(2)
	if Input.is_action_just_pressed("tool_three"):
		_changetool(3)
	if Input.is_action_just_pressed("tool_four"):
		_changetool(4)
