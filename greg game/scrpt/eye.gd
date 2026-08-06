extends Node2D

@export var slight: bool
@export var lookPlyaer: bool

var a = 0
var b

func _process(_delta: float):
	if lookPlyaer == true and slight == false:
		look_at(get_tree().current_scene.find_child("player").global_position)
	elif lookPlyaer == true and slight == true:
		look_at(get_tree().current_scene.find_child("player").global_position + Vector2(0, -30))
	else:
		look_at(get_global_mouse_position())
