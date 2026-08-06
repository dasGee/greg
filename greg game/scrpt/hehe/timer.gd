extends RichTextLabel

func _process(_delta: float):
	if get_tree().current_scene:
		if get_tree().current_scene.get("timespent"):
			text = "[outline_size=10][outline_color=\"white\"][font=res://asest/greg.ttf][font_size=40][color=\"black\"]" + str(snappedf(get_tree().current_scene.timespent / 0.6, 0.01))
