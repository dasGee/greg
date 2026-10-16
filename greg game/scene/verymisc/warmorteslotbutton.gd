extends TextureButton
@export var slot: int
func _ready() -> void:
	toggled.connect(_on_toggled)
func _on_toggled(toggled_on: bool) -> void:
	if toggled_on==true:
		$"../..".currentSlot=slot
		$"../..".sette()
