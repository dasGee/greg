extends Node

@export var price: int
@export var thing: String
@export_subgroup("finding")
@export var isFind: bool
@export var SvName: String

var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

func _ready():
	find_child("button").connect("pressed", _buy)
func _physics_process(_delta: float):
	if isFind == true:
		if g.toolsAvailable.has(SvName):
			set("visible", true)
		else:
			set("visible", config.get_value("toolFind", SvName, false))
func _buy():
	config.set_value("things", "orbs", g.orb)
	config.save("user://Greg.cfg")
	if g.current != 0:
		if g.tools.get(g.current).instantiate().isHand == false:
			pass
			$"..".text($"..".talkRefuseNothand)
		elif g.orb >= price:
			g.orb -= price
			g.tools.set(g.current, load(thing))
			g.toolr.emit()
			$"..".text($"..".talk)
		elif g.orb < price:
			$"..".text($"..".talkNotOrb)
