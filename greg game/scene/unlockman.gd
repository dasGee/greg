extends StaticBody2D
@export var lev: String

var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

func _ready() -> void :
	if err != OK:
		return
	if get_tree().current_scene.dark == true:
		$PointLight2D.visible = true
		$PointLight2D.color = modulate
	if g.mantex == true:
		$RichTextLabel.visible = true
		$RichTextLabel.text = "[font=res://asest/greg.ttf][font_size=6][outline_size=1]" + lev
	if config.get_value("level", lev, false) == true:
		$Unlockman.visible = false
		$CollisionShape2D.disabled = true
