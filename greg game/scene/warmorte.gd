extends Node2D

var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

func _ready() -> void:
	if config.get_value("things", "gotHam", false) == false:
		queue_free()

func _physics_process(_delta: float) -> void:
	if $Area2D.has_overlapping_areas():
		$Warmorte.visible = false
		$Warmorte2.visible = true
		if Input.is_action_just_pressed("interact"):
			pausemenu.find_child("warmorte").popup_centered()
			get_tree().paused = true
	else:
		$Warmorte.visible = true
		$Warmorte2.visible = false
