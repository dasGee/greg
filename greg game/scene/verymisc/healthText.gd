extends Node2D

@export var wave: bool
var waveT = ""

var meh
var meh2

func _ready():
	g.scored.connect(score)
	if wave == true:
		waveT = "[wave amp=50 freq=2]"

func score(_val):
	$RichTextLabel3.text = "[font=res://asest/greg.ttf][font_size=40][outline_size=5]score: " + str(g.score)
	if g.got < 0:
		return
	meh2 = load("res://scene/verymisc/scoretext.tscn")
	meh = meh2.instantiate()
	meh.text = waveT + "[outline_size=5][wave amp=50 freq=6][font=res://asest/greg.ttf][font_size=40]+" + str(g.got)
	meh.find_child("AnimationPlayer").play("upyougo")
	add_child(meh)

func _physics_process(_delta: float) -> void :
	$RichTextLabel.text = waveT + "[font=res://asest/greg.ttf][font_size=40][outline_size=5]health " + str(g.health)
	$RichTextLabel2.text = waveT + "[font=res://asest/greg.ttf][font_size=40][outline_size=5]scrap " + str(g.scrap)
	$TextureProgressBar.value = g.water
