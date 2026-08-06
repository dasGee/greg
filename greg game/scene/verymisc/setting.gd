extends Window
var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

func _ready():
	if err != OK:
		return
	else:
		if config.get_value("setting", "timer", false) == true:
			$"../time".visible = true
			$timerbutton.button_pressed = true
		if config.get_value("setting", "mantex", false) == true:
			$togglemantex.button_pressed = true
		if config.get_value("setting", "quickrestart", false) == true:
			$qrestart.button_pressed = true
		if config.get_value("setting", "1hp", false) == true:
			$oneHp.button_pressed = true
			g.maxhealth = 1
		$HSlider.set_value_no_signal(config.get_value("setting", "musicVol", 1))
		$HSlider2.set_value_no_signal(config.get_value("setting", "sfxVol", 1))
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("music"), linear_to_db(config.get_value("setting", "musicVol", 1)))
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("sfx"), linear_to_db(config.get_value("setting", "sfxVol", 1)))

func _on_h_slider_value_changed(value: float) -> void :
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("music"), linear_to_db(value))
	config.set_value("setting", "musicVol", AudioServer.get_bus_volume_linear(AudioServer.get_bus_index("music")))
	config.save("user://Greg.cfg")
func _on_h_slider_2_value_changed(value: float) -> void :
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("sfx"), linear_to_db(value))
	config.set_value("setting", "sfxVol", AudioServer.get_bus_volume_linear(AudioServer.get_bus_index("sfx")))
	config.save("user://Greg.cfg")

func _ontimerbutton(t: bool):
	if t == false:
		$"../time".visible = false
		config.set_value("setting", "timer", false)
		config.save("user://Greg.cfg")
	else:
		$"../time".visible = true
		config.set_value("setting", "timer", true)
		config.save("user://Greg.cfg")

func _on_close_requested() -> void :
	get_tree().paused = false
	always_on_top = false
	hide()


func _on_texture_button_2_pressed() -> void :
	OS.shell_open(ProjectSettings.globalize_path("user://"))


func _on_control_pressed() -> void :
	hide()
	g.score = 0
	get_tree().paused = false
	g.canHealth = true
	g.health = g.maxhealth
	g.lock = false
	g.tools = g.DefaultTools
	g.scrap = 0
	get_tree().paused = false
	transition.find_child("ColorRect2").color = Color(0, 0, 0)
	transition.find_child("AnimationPlayer2").play("fadeOut")
	get_tree().change_scene_to_file(g.curHub)

func _on_control_2_pressed() -> void :
	hide()
	g.canHealth = true
	g.health = g.maxhealth
	g.lock = false
	g.tools = g.DefaultTools
	g.scrap = 0
	get_tree().paused = false
	transition.find_child("ColorRect2").color = Color(0, 0, 0)
	transition.find_child("AnimationPlayer2").play("fadeOut")
	get_tree().change_scene_to_file(g.currentLevelPath)

func _togglemantex(t: bool) -> void :
	if t == false:
		g.mantex = false
		config.set_value("setting", "mantex", false)
		config.save("user://Greg.cfg")
	else:
		g.mantex = true
		config.set_value("setting", "mantex", true)
		config.save("user://Greg.cfg")


func _on_qrestart_toggled(t: bool):
	if t == false:
		config.set_value("setting", "quickrestart", false)
		config.save("user://Greg.cfg")
	else:
		config.set_value("setting", "quickrestart", true)
		config.save("user://Greg.cfg")


func _on_hp_toggled(t: bool):
	if t == false:
		g.maxhealth = 100
		config.set_value("setting", "1hp", false)
		config.save("user://Greg.cfg")
	else:
		g.maxhealth = 1
		g.health = 1
		config.set_value("setting", "1hp", true)
		config.save("user://Greg.cfg")
