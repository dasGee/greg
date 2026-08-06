extends Node
@warning_ignore("unused_signal")
signal toolr
@warning_ignore("unused_signal")
signal textChanging
@warning_ignore("unused_signal")
signal boxed
@warning_ignore("unused_signal")
signal scored
@warning_ignore("unused_signal")
signal healthChange
@warning_ignore("unused_signal")
signal switcherood

var toolsAvailable: Array

var mantex: bool = false

var canHealth: bool = true
var maxhealth: int = 100
var health: int = 100:
	set(val):
		if canHealth == true and not val - health > 0:
			if val - health < -2:
				healthChange.emit(val)
		health = val

var orb: int = 0:
	set(val):
		orb = val
		config.set_value("things", "orbs", val)
		config.save("user://Greg.cfg")

var scrap: int = 0
var ammo: int = 0
var text: String
var lock = false

var curHub = "res://levle/hubWorld.tscn"

var tempscore

var popos: Vector2 = Vector2(0, 0)

var maxwater = 1000
var water = 1000
var inwater = false

var switcheroo = false:
	set(val):
		switcheroo = val
		switcherood.emit()

var currentLevelPath: String
var currentLevel: String
var timeC: float
var timeN: float
var timeSp: float
var finalhealth: int

var got: int
var score: int = 0:
	set(val):
		got = val - score
		score = val
		scored.emit(val)
var enScore: int = 0
var finalscore: int

var boxBurn = 0:
	set(val):
		boxBurn = val
		boxed.emit()

var current: int = 0

var DefaultTools = {
1: load("res://scene/gregtool/openHand.tscn"), 
2: load("res://scene/gregtool/openHand.tscn"), 
3: load("res://scene/gregtool/openHand.tscn"), 
4: load("res://scene/gregtool/openHand.tscn"), 
}
var tools = {
1: load("res://scene/gregtool/openHand.tscn"), 
2: load("res://scene/gregtool/openHand.tscn"), 
3: load("res://scene/gregtool/openHand.tscn"), 
4: load("res://scene/gregtool/openHand.tscn"), 
}



var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

func _ready():
	config.set_value("belbanga", "haha i see you messing around with the save :)", "alright go ahead! i dont mind")
	config.save("user://Greg.cfg")
	orb = config.get_value("things", "orbs", 0)

func _physics_process(_delta: float):
	if health <= 0:
		canHealth = true
		health = 100
		lock = false
		tools = DefaultTools
		scrap = 0
		get_tree().change_scene_to_file("res://scene/verymisc/died.tscn")
	if inwater == true:
		g.inwater = false
		water -= 2
	else:
		if water < 1000:
			water += 1
	if water <= 0:
		canHealth = true
		health = 0
		water = 1000


func _on_score_dec_timeout() -> void :
	if score > 0:
		g.score -= 1
