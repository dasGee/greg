extends enemyman
var wa
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if variation == "light":
		$AnimatedSprite2D.play("light")
		$AnimatedSprite2D.modulate = Color.WHITE
		$AnimatedSprite2D/PointLight2D.visible = true
		wa=load("res://scene/gregtool/lightbox.tscn")
		$boxbox.item=wa
