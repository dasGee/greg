extends Window

var currentChosen
var currentSlot

var waw
var meh
var lala
var wewe

var ehhhhh = 0

var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

func _on_close_requested() -> void:
	for a in $ScrollContainer/Control.get_children(true):
		if a.name.begins_with("wa"):
			a.queue_free()
	hide()
	get_tree().paused = false
	g.toolr.emit()

func _on_about_to_popup() -> void:
	ehhhhh = 0
	lala = config.get_value("things", "unlockeds", ["res://scene/gregtool/hammer.tscn","res://scene/gregtool/box.tscn"])
	for a in lala.size():
		wewe = $ScrollContainer/Control/ColorRect0.duplicate()
		wewe.name = "wa"+str(a)
		ehhhhh +=64
		wewe.position.x +=ehhhhh
		wewe.texture_normal = load(lala[a]).instantiate().img
		wewe.stool = load(lala[a])
		$ScrollContainer/Control.add_child(wewe)
	for a in 4:
		waw = $Control.find_child("S"+str(a))
		if g.DefaultTools.get(a+1) is not String:
			meh = g.DefaultTools.get(a+1).instantiate()
			waw.texture_normal = meh.get("img")
			meh.queue_free()

func sette():
	if currentChosen != null and currentSlot != null:
		g.DefaultTools.set(currentSlot,currentChosen)
		g.tools.set(currentSlot,currentChosen)
		config.set_value("things", "DefTools"+str(currentSlot),currentChosen)
		config.save("user://Greg.cfg")
		get_tree().current_scene.find_child("ui", false, false).find_child("Node").emit_signal("puck")
		currentChosen=null
		currentSlot=null
		for a in 4:
			$Control.find_child("S"+str(a)).button_pressed = false
		for a in $ScrollContainer/Control.get_children():
			a.button_pressed = false
		for a in 4:
			waw = $Control.find_child("S"+str(a))
			if g.DefaultTools.get(a+1) is not String:
				meh = g.DefaultTools.get(a+1).instantiate()
				waw.texture_normal = meh.get("img")
				meh.queue_free()
