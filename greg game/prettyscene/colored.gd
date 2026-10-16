extends Node
@export var sprite = Node2D
func _ready() -> void:
	sprite.modulate = get_tree().current_scene.misColor
