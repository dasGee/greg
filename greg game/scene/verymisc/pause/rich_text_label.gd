extends RichTextLabel
var sv = ConfigFile.new()
var svr = sv.load("user://Greg.cfg")
func _process(_delta: float):
	await get_tree().create_timer(2.0).timeout
	text = sv.get_value("G1", "namer", "greg")
func _on_line_edit_text_submitted(new_text: String) -> void :
	sv.set_value("G1", "namer", new_text)
	sv.save("user://Greg.cfg")
