extends Node2D



var we = false
func _on_area_2d_area_entered(_area: Area2D) -> void:
	if we == false:
		we = true
	else:
		return
	$RichTextLabel.text = '[font=res://asest/rocketre.ttf][font_size=16][color="fff"][outline_size=4][outline_color=000][shake rate=3.0 level=5 connected=0]oh... hi there'
	$AnimationPlayer.play("new_animation")
	await get_tree().create_timer(5).timeout
	$RichTextLabel.text = '[font=res://asest/rocketre.ttf][font_size=16][color="fff"][outline_size=4][outline_color=000][shake rate=3.0 level=5 connected=0]would be cool if you could...[br]like,,,[br]repair me or something...'
	$AnimationPlayer.play("new_animation")
	await get_tree().create_timer(7).timeout
	$RichTextLabel.text = '[font=res://asest/rocketre.ttf][font_size=16][color="fff"][outline_size=4][outline_color=000][shake rate=3.0 level=5 connected=0]because you cant'
	$AnimationPlayer.play("new_animation")
	await get_tree().create_timer(7).timeout
	$RichTextLabel.text = '[font=res://asest/rocketre.ttf][font_size=16][color="fff"][outline_size=4][outline_color=000][shake rate=3.0 level=5 connected=0]and wont be able to for a while,,,[br]probably,,,'
	$AnimationPlayer.play("new_animation")
	await get_tree().create_timer(7).timeout
	$RichTextLabel.text = '[font=res://asest/rocketre.ttf][font_size=16][color="fff"][outline_size=4][outline_color=000][shake rate=3.0 level=5 connected=0]yeah...'
	$AnimationPlayer.play("new_animation")
