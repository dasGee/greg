extends Button
@onready var anim = $"/root/transition/ColorRect/AnimationPlayer"
func _ready():
	anim.animation_finished.connect(_animation_finished)
func _on_pressed() -> void :
	anim.play("in")
func _animation_finished(wawa) -> void :
	if wawa == "in":
		get_tree().change_scene_to_file("res://levle/hubWorld.tscn")
