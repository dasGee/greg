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
var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")
func _interacted():
	super()
	if isUnlock == true:
		transition.find_child("AnimationPlayer2").play("itemget")
		g.toolsAvailable.insert(0, $RayCast2D.get_collider().get("Unlock"))
		config.set_value("toolFind", $RayCast2D.get_collider().get("Unlock"), true)
		config.save("user://Greg.cfg")
	else:
		g.tools.set(g.current, item)
		g.toolr.emit()
	if destroy==true:
		destroyee.queue_free()
func _ready():
	super()
	if find_child("Sprite2D"):
		nd = $Sprite2D
	if img and nd:
		nd.texture = img
