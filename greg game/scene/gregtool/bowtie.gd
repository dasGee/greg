extends itemer
var bullet = preload("res://scene/obj/arrow.tscn")
var bulleta
var dist
var marke
@export var deb = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	marke = get_parent().get_parent().find_child("marker")
	pass # Replace with function body.
	
func _physics_process(_delta):
	marke.global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot") and deb == false:
		$AnimationPlayer.play("shoot")
		#_shot()

func _shot():
	$Paintball.pitch_scale = randf_range(0.7,1.6)
	$Paintball.play()
	bulleta = bullet.instantiate()
	bulleta.global_position = $shootsprite/Marker2D4.global_position
	bulleta.global_rotation = $shootsprite/Marker2D4.global_rotation
	get_tree().current_scene.add_child(bulleta)
