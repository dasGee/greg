extends Node
var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")
func _ready() -> void:
	if config.get_value("setting", "quickrestart", false) == true:
		g.score = 0
		transition.find_child("ColorRect2").color = Color(0, 0, 0)
		transition.find_child("AnimationPlayer2").play("fadeOut")
		get_tree().change_scene_to_file(g.currentLevelPath)
	else:
		$Window.show()
func _on_control_pressed() -> void :
	$Window.hide()
	g.score = 0
	await get_tree().create_timer(1).timeout
	transition.find_child("ColorRect2").color = Color(0, 0, 0)
	transition.find_child("AnimationPlayer2").play("fadeOut")
	get_tree().change_scene_to_file(g.curHub)

func _on_control_2_pressed() -> void :
	$Window.hide()
	g.score = 0
	await get_tree().create_timer(1).timeout
	transition.find_child("ColorRect2").color = Color(0, 0, 0)
	transition.find_child("AnimationPlayer2").play("fadeOut")
	get_tree().change_scene_to_file(g.currentLevelPath)
