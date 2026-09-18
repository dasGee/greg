@icon("res://asest/sprite/toolwheelsprites/box.png")
class_name itemer extends Node2D
@export var img: CompressedTexture2D
@export var isHand: bool
@export var scrappable:bool =true
@export var scrapVal: int=1
@export_subgroup("line")
@export var hasline:bool
@export var line:Line2D
@export var prite:Sprite2D
@export var maximimi:int
@export var offset:Vector2
@export var LO:Vector2

var M
var tempp
func _process(_delta: float):
	if hasline==true and get_parent().yes == true:
		if pausemenu.find_child("mobile"):
			tempp = get_tree().current_scene.find_child("player").find_child("virtcursor").position.distance_to(Vector2(0,0))
			M=Vector2(tempp,0)
		else:
			M = get_local_mouse_position()
		if M.x < maximimi or -M.x > -maximimi:
			prite.position = Vector2(abs(M.x)+abs(M.y),0)+offset
			line.set_point_position(1,Vector2(prite.position.x*0.95+LO.x,LO.y))
		else:
			prite.position = Vector2(maximimi,0)+offset
			line.set_point_position(1,Vector2(maximimi*0.95+LO.x,LO.y))
func _physics_process(_delta: float):
	if Input.is_action_just_pressed("scrap") and scrappable==true:
		g.scrap += scrapVal
		g.tools.set(g.current, load("res://scene/gregtool/openHand.tscn"))
		g.toolr.emit()
