extends Button

func _on_pressed() -> void :
	$"../../setting".always_on_top = true
	$"../../setting".popup_centered()
