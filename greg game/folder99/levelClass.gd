@icon("res://asest/sprite/toolwheelsprites/sword.png")
class_name level extends Node2D
@export var timeBonus: int
@export var speedrunTime: int
@export var escape: bool
@export var leveler: bool
@export var escapeMessage: String
@export var camear: Camera2D
@export var startPos: Marker2D
@export var isHub: bool = false
@export var music: String = "default"
@export_subgroup("man")
@export var manPos: Marker2D
@export var manStartSpeed: int
@export_category("modifier")
@export_subgroup("fun")
@export var wide: bool = false
@export var long: bool = false
@export_subgroup("grav")
@export var changeGrav: bool = false
@export var grav: int

var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

var timespent: float
var timego = false

var cameraugh

var anotherone
var wawah
var wawaha
var memeha

func _ready() -> void :
	if pausemenu.find_child("mobile"):#.enabled == true:
		timego = true
	if g.find_child("music").curFolder != music and music != "keep":
		g.find_child("music").curFolder = music
		g.find_child("music").wawa()

	if isHub == true:
		g.curHub = scene_file_path
	g.currentLevelPath = scene_file_path
	print(g.currentLevelPath)
	g.switcheroo = false
	wawah = load(config.get_value("player", "character", "res://scene/player.tscn"))
	wawaha = wawah.instantiate()
	wawaha.position = startPos.position
	if wide == true:
		wawaha.scale += Vector2(2, 0)
	if long == true:
		wawaha.scale += Vector2(0, 2)
	if camear:
		camear.position = wawaha.position
		camear.reparent(wawaha)
		cameraugh = camear
	if g.popos != Vector2(0, 0):
		wawaha.global_position = g.popos
	g.popos = Vector2(0, 0)
	add_child(wawaha)
	wawaha.owner = get_tree().root
	g.boxBurn = 0
	g.boxed.connect(_boxed)

func _boxed():
	return

func _physics_process(_delta: float):
	if timego == true:
		timespent += 0.01

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			timego = true
