extends AudioStreamPlayer
var wawa = false
func sounder(_w):
	if wawa == false:
		wawa = true
		play()
		await get_tree().create_timer(0.25).timeout
		wawa = false

func _ready() -> void :
	get_parent().body_entered.connect(sounder)
