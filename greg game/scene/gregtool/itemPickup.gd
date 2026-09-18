@icon("res://asest/sprite/toolwheelsprites/hand.png")
extends interact
@export var item: PackedScene
@export var img: CompressedTexture2D
@export var destroy: bool
@export var destroyee: Node
var nd
@export_subgroup("shopUnlock")
@export var isUnlock: bool
@export var Unlock: String
var ugh = false
func _ready():
	if find_child("Sprite2D"):
		nd = $Sprite2D
	if img and nd:
		nd.texture = img
