extends interact

var config = ConfigFile.new()
var erer = config.load("user://Greg.cfg")

func _ready():
	super()
	if config.get_value("things", "gotHam", false) == true:
		queue_free()

func _interacted():
	super()
	if erer:
		pass
	else:
		return
	config.set_value("things", "gotHam", true)
	transition.find_child("hamr").find_child("AnimationPlayer").play("new_animation")
	g.tools.set(g.current,load("res://scene/gregtool/hammer.tscn"))
	g.toolr.emit()
	config.save("user://Greg.cfg")
	g.DefaultTools = {
	1: load("res://scene/gregtool/hammer.tscn"), 
	2: load("res://scene/gregtool/openHand.tscn"), 
	3: load("res://scene/gregtool/openHand.tscn"), 
	4: load("res://scene/gregtool/openHand.tscn"), 
	}
	queue_free()
