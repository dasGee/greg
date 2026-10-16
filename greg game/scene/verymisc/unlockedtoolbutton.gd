extends TextureButton

@export var stool: PackedScene

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$"../../..".currentChosen = stool
		$"../../..".sette()
		$TextureRect.visible =true
	else:
		$TextureRect.visible =false
