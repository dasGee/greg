extends RichTextLabel

@export var vvvv = "[font=res://asest/rocketre.ttf][font_size=8][color=green]"
func _process(_delta: float):
	text = vvvv+str(g.orb)
