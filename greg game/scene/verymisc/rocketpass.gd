extends Window

var thingima:String=''
#yes
var places:Dictionary = {
"1389":"res://levle/scrapWorld/scrapHub.tscn",
"3994":"res://levle/shroo/shrooHub.tscn",
"4193":"res://levle/lab3/lab3hub.tscn",
}

func _ready() -> void:
	for a in $ColorRect2/enter.get_children():
		a.pressed.connect(boop.bind(a.name,a))
func boop(N,waw):
	waw.modulate=Color(0.252, 0.252, 0.252, 1.0)
	if N=="-":
		$Nana.play()
		thingima=''
		await get_tree().create_timer(0.25).timeout
		waw.modulate=Color(1.0, 1.0, 1.0, 1.0)
		return
	if N=="+":
		if places.has(thingima):
			$Yaya.play()
			get_tree().change_scene_to_file.call_deferred(places.get(thingima))
			get_tree().paused=false
			return
		$Yaya.play()
		thingima=''
		await get_tree().create_timer(0.25).timeout
		waw.modulate=Color(1.0, 1.0, 1.0, 1.0)
		return
	var eh = str_to_var(N)
	thingima+=N
	if eh == 0:
		$ling.pitch_scale=5
	else:
		$ling.pitch_scale=eh*0.5
	$ling.play()
	await get_tree().create_timer(0.25).timeout
	waw.modulate=Color(1.0, 1.0, 1.0, 1.0)
func _process(_delta: float) -> void:
	$Handcursor.position=$Handcursor.get_global_mouse_position()
	$ColorRect3/RichTextLabel.text='[font=res://asest/rocketre.ttf][font_size=16][color="0f0"]'+thingima
	if Input.is_action_just_pressed("pause"):
		if visible == true:
			_clo()
func _fee() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	$Handcursor.visible=true
func _bee() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$Handcursor.visible=false
	
func _clo() -> void:
	hide()
	get_tree().paused = false
