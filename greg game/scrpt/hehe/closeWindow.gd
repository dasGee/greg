extends Window

@export var stringAdd: String = "[shake rate=10.0 level=3 connected=1][font=res://asest/greg.ttf][font_size=19][outline_size=6][outline_color=706438]"

@export var talk: Array[String]
@export var talkRefuseNothand: Array[String]
@export var talkNotOrb: Array[String]

func _on_close_requested() -> void :
	hide()
	get_tree().paused = false

func text(which: Array):
	$RichTextLabel2.visible_ratio = 0
	$RichTextLabel2.text = stringAdd + which.pick_random()
	$RichTextLabel2 / AnimationPlayer.play("talke")


func _on_about_to_popup() -> void :
	get_tree().paused = true
