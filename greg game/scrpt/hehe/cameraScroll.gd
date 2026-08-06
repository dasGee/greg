extends Camera2D
var tween
@export var maximi = 5
@export var minimi = 2
func _process(_delta: float) -> void :
	if zoom.x == 0:
		zoom = Vector2(0.1, 0.1)
	if zoom.x <= minimi:
		tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property($".", "zoom", Vector2(minimi, minimi), 0.15)
	if zoom.x >= maximi:
		tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property($".", "zoom", Vector2(maximi, maximi), 0.15)
	if Input.is_action_just_released("scrollout"):
		if zoom.x <= minimi:
			pass
		else:
			tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_property($".", "zoom", Vector2(zoom - (Vector2(1, 1)) * zoom / 2.25), 0.15)
	if Input.is_action_just_released("scrollin"):
		if zoom.x >= maximi:
			pass
		else:
			tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_property($".", "zoom", Vector2(zoom + (Vector2(1, 1)) * zoom / 2.25), 0.15)
