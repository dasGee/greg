extends Area2D

var heh = 0
var enemy
var en

func _on_area_entered(area: Area2D):
	if area.name == "hit":
		spawn()

func spawn():
	set_deferred("monitoring", false)
	$Sprite2D2.hide()
	$Sprite2D.hide()
	for a in get_children():
		if a.name.begins_with("enemymarker"):
			print("ugh" + str(heh))
			heh += 1
			en = load("res://scene/enemy/" + a.get("enemy") + ".tscn")
			enemy = en.instantiate()
			enemy.variation = a.variant
			enemy.global_position = a.global_position
			get_tree().current_scene.call_deferred("add_child", enemy)
			await get_tree().create_timer(0.25).timeout
	queue_free()
