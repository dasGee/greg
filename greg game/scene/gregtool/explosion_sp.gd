extends itemer
var boom = preload("res://scene/boom.tscn")
var boo
func _physics_process(_delta):
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot"):
		boo = boom.instantiate()
		boo.global_position = global_position
		get_tree().current_scene.add_child(boo)
