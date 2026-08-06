extends Label

var rng = RandomNumberGenerator.new()

func _ready() -> void :
	text = str(rng.randf_range(1, 210))
