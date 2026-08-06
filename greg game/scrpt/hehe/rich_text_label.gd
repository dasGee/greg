extends RichTextLabel
func _process(_delta: float):
	text = "[font=res://asest/greg.ttf][font_size=19]you have " + str(g.orb) + " orb"
