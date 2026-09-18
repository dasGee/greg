extends Node2D

@export var slight: Vector2
@export var lookPlyaer: bool

var a = 0
var b

func _process(_delta: float):
	if lookPlyaer == true:
		look_at(get_tree().current_scene.find_child("player").global_position+slight)
	else:
		look_at(get_global_mouse_position())
