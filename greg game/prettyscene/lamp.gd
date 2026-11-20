@tool
extends Node2D
@export var color = Color(1.0, 1.0, 1.0, 1.0)
# Called when the node enters the scene tree for the first time.
func _ready():
	$PointLight2D.color=color
