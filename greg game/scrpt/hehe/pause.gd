extends Node
func _physics_process(_delta: float) -> void :
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:



			$setting.popup_centered()
			if get_tree().current_scene.scene_file_path == "res://levle/endScore.tscn":
				$setting / Control2.disabled = true
			else:
				$setting / Control2.disabled = false
			get_tree().paused = true
		else:


			$setting.hide()
			$Window.hide()
			get_tree().paused = false

func _on_window_close_requested() -> void :


	$setting.hide()
	$Window.hide()
	get_tree().paused = false
