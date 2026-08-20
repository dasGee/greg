extends Node2D
@export var scene: String
@export var textie: String

@export var champ: bool
@export var square: bool
@export var esc: bool
@export var closed: bool
@export var pos: Vector2

@export_subgroup("level")
@export var islevel: bool
@export var levelis: String
@export_subgroup("unlock")
@export var manUnlock: bool
@export var UnlockMan: String
@export var ohmymeohmy: bool

@warning_ignore("unused_signal")
signal key
@onready var anim = $"/root/transition/ColorRect/AnimationPlayer"

var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

var meh
func _open():
	if square == true:
		closed = false
		$AnimatedSprite2D.play("EscOpen")
func _ready():
	key.connect(_open)
	if closed:
		$AnimatedSprite2D.play("EscClosed")
	elif square:
		$AnimatedSprite2D.play("EscOpen")
	elif champ:
		$AnimatedSprite2D.play("champ")
	$RichTextLabel.text = "[wave amp=6 freq=0.5 connected=1][font_size=5][font=\"res://asest/greg.ttf\"][outline_size=1][outline_color=808080]" + textie
	if islevel == true:
		$Signsmall.visible = true
		$Signsmall / RichTextLabel.text = "[font=res://asest/greg.ttf][font_size=6][color=\"707070\"]" + str(config.get_value("level", levelis + "_score", "X"))
		$Signsmall / RichTextLabel2.text = "[font=res://asest/greg.ttf][font_size=6][color=\"707070\"]" + str(snappedf(config.get_value("level", levelis + "_time", 0) / 0.6, 0.01))
	if manUnlock == true:
		scene = g.curHub
func _physics_process(_delta: float):
	await get_tree().create_timer(0.5).timeout
	if get_tree().current_scene.cameraugh:
		meh = get_tree().current_scene.cameraugh.zoom
		$RichTextLabel.scale = meh
	if not $Area2D2.has_overlapping_areas():
		$RichTextLabel.visible_characters = 0
	if Input.is_action_just_pressed("interact") and $Area2D.has_overlapping_areas() and not closed:
		if ohmymeohmy == true:

			g.tempscore = g.score
			g.timeSp = get_tree().current_scene.speedrunTime
			g.timeN = get_tree().current_scene.timeBonus
			g.timeC = get_tree().current_scene.timespent
			g.finalhealth = g.health
		elif manUnlock == true:
			config.set_value("level", g.currentLevel, true)
			if config.get_value("level", g.currentLevel + "_score", 0) <= g.finalscore:
				config.set_value("level", g.currentLevel + "_score", g.finalscore)
			if config.get_value("level", g.currentLevel + "_time", 9001) >= g.timeC:
				config.set_value("level", g.currentLevel + "_time", g.timeC)
			config.save("user://Greg.cfg")
			g.set("score", 0)
			g.scrap = 0
			g.enScore -= g.score
			g.health = g.maxhealth
			g.tools = g.DefaultTools
		if islevel == true:
			g.set("score", 0)
			g.currentLevel = levelis
		g.popos = pos
		get_tree().current_scene.process_mode = Node.PROCESS_MODE_DISABLED
		anim.animation_finished.connect(_animation_finished)
		anim.play("in")
func _animation_finished(wawa):
	if wawa == "in":
		get_tree().change_scene_to_file(scene)
		g.lock = false
func _on_area_2d_2_area_entered(_area: Area2D) -> void :
	$AnimationPlayer.play("text")
