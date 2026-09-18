class_name interact extends Node2D
@export var area: Area2D
signal interacted
var cando = true
func _interacted():
	if cando == true:
		cando = false
	else: 
		return
func _ready() -> void:
	interacted.connect(_interacted)
