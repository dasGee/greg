extends Node2D

@export var saying: String
@export var flippi: bool

func _ready() -> void :
	if flippi == true:
		$Sign.flip_h = true
	$RichTextLabel.text = "[font=res://asest/greg.ttf][font_size=6][outline_size=2][outline_color=000]" + saying + "[p] "

func _physics_process(_delta: float):
	if not $Area2D.has_overlapping_areas():
		$RichTextLabel.visible_ratio = 0

func _on_area_2d_area_entered(_area: Area2D):
	$AnimationPlayer.play("new_animation")
