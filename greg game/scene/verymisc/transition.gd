extends CanvasLayer

func _on_animation_player_animation_finished(anim_name: StringName) -> void :
	if anim_name == "in":
		$ColorRect / AnimationPlayer.play("out")
	elif anim_name == "out":
		$ColorRect / AnimationPlayer.play("RESET")

func _on_animation_player_2_animation_finished(anim_name: StringName) -> void :
	if anim_name == "fadeIn":
		$ColorRect / AnimationPlayer.play("fadeOut")
	elif anim_name == "out":
		$ColorRect / AnimationPlayer.play("RESET")
