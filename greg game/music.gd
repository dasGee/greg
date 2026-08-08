extends Node

var curFolder = "default"
var cur


func wawa():
	cur.stop()
	cur = find_child(curFolder).get_children()[randi() % find_child(curFolder).get_child_count()]
	cur.play()
func _ready():
	for a in get_children():
		for b in a.get_children():
			b.finished.connect(wawa)
	cur = find_child(curFolder).get_children()[randi() % find_child(curFolder).get_child_count()]
	cur.play()
	pass
