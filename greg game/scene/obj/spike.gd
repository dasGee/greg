extends Node2D
@export var isSwitch: bool = false
@export var enabledAtSwitch: bool = false

func _ready() -> void :
	g.switcherood.connect(switchee)
	if isSwitch == true:
		if enabledAtSwitch == g.switcheroo:
			$AnimationPlayer.call_deferred("play", "out")
		else:
			$AnimationPlayer.call_deferred("play", "in")

func switchee():
	if isSwitch == true:
		$AnimationPlayer.call_deferred("stop")
		if enabledAtSwitch == g.switcheroo:
			$AnimationPlayer.call_deferred("play", "out")
		else:
			$AnimationPlayer.call_deferred("play", "in")
func _physics_process(_delta: float) -> void :
	pass
func _on_area_2d_area_entered(_area: Area2D):
	g.health -= 10
	$AnimationPlayer.call_deferred("play", "in")
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.call_deferred("play", "out")
