extends itemer
var bullet = preload("res://scene/obj/bullet.tscn")
var bulleta
var dist
var marke
var deb = false
var wait = 0.125

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	marke = get_parent().get_parent().find_child("marker")
	pass # Replace with function body.
	
func _physics_process(_delta):
	marke.global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot") and deb == false:
		deb = true 
		for a in 3:
			_shot()
			await get_tree().create_timer(wait).timeout
		await get_tree().create_timer(0.5).timeout
		deb = false
func _shot():
	if g.scrap >= 1:
		g.scrap -= 1
		$Paintball.play()
		$shootsprite/Marker2D3.position.y = randf_range(-5,7)
		get_parent().get_parent().velocity += Vector2(marke.position.x * 6, marke.position.y * 6)
		bulleta = bullet.instantiate()
		bulleta.global_position = $shootsprite/Marker2D4.global_position
		bulleta.damage = 2
		bulleta.friend = true
		dist = ($shootsprite/Marker2D3.global_position - $shootsprite/Marker2D4.global_position)*15
		bulleta.linear_velocity = dist
		get_tree().current_scene.add_child(bulleta)
	else:
		$Kerplunk.play()
