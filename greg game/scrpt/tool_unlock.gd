extends interact

@export var tool:String

var config = ConfigFile.new()
var erer = config.load("user://Greg.cfg")

func _ready() -> void:
	super()
	if config.get_value("unlockeds", tool, false)==true:
		queue_free()
func _interacted():
	super()
	config.set_value("unlockeds", tool, true)
	transition.find_child("hamr").find_child("AnimationPlayer").play("new_animation")
	g.tools.set(g.current,load("res://scene/gregtool/"+tool+".tscn"))
	g.toolr.emit()
	config.save("user://Greg.cfg")
	queue_free()
