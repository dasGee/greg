@icon("res://asest/sprite/toolwheelsprites/box.png")
class_name itemer extends Node2D
@export var img: CompressedTexture2D
@export var isHand: bool

@export_subgroup("line")
@export var hasline:bool
@export var line:Line2D
@export var prite:Sprite2D
@export var maximimi:int
@export var offset:Vector2
@export var LO:Vector2

var M

func _process(_delta: float):
	if hasline==true and get_parent().yes == true:
		M = get_local_mouse_position()
		if M.x < maximimi or -M.x > -maximimi:
			prite.position = M+offset
			line.set_point_position(1,Vector2(prite.position.x*0.95+LO.x,LO.y))
		else:
			prite.position = Vector2(maximimi,0)+offset
			line.set_point_position(1,Vector2(maximimi*0.95+LO.x,LO.y))
