extends ColorRect
var wah = true
func _ready() -> void :
	g.textChanging.connect(wawa)
func wawa(texty: String):
	%RichTextLabel.text = "[font=res://asest/greg.ttf][font_size=32]" + texty
	if wah == false:
		pass
	else:
		wah = false
		$AnimationPlayer.play("rectIn")
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("showtext")
		await get_tree().create_timer(5).timeout
		$AnimationPlayer.play("hidetext")
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer.play("rectOut")
		wah = true
