extends CanvasLayer
@export var enabled: bool = false 
#i am not going to make it automatically change it because of reasons...
#reasons that it could jsut not work... anyways,, if apk export then must enable!!!!

@export var shootDelay:float
@export var jumpDelat:float

var shootMode = "shoot"

func _ready() -> void:
	if enabled == false:
		queue_free()
	else:
		InputMap.action_erase_events("shoot")
func _physics_process(_delta: float):
	if $Control/left.button_pressed:
		Input.action_press("left")
	else:
		Input.action_release("left")
	if $Control/right.button_pressed:
		Input.action_press("right")
	else:
		Input.action_release("right")
		
	if $Control/up.button_pressed:
		await get_tree().create_timer(jumpDelat).timeout
		Input.action_press("jump")
		await get_tree().create_timer(0.01).timeout
		Input.action_release("jump")

	if $Control/down.button_pressed:
		Input.action_press("down")
	else:
		Input.action_release("down")

	if $"Control/1".button_pressed:
		Input.action_press("tool_one")
	else:
		Input.action_release("tool_one")
	if $"Control/2".button_pressed:
		Input.action_press("tool_two")
	else:
		Input.action_release("tool_two")
	if $"Control/3".button_pressed:
		Input.action_press("tool_three")
	else:
		Input.action_release("tool_three")
	if $"Control/4".button_pressed:
		Input.action_press("tool_four")
	else:
		Input.action_release("tool_four")


func _on_e_pressed() -> void:
	Input.action_press("interact")
	Input.action_release("interact")


func _on_pause_pressed() -> void:
	Input.action_press("pause")
	Input.action_release("pause")


func _on_virtual_joystick_dx_joystick_moved(direction: Vector2) -> void:
	get_tree().current_scene.find_child("player").find_child("virtcursor").position = direction*40


func _on_mode_toggled(t: bool) -> void:
	if t == true:
		shootMode="shoot2"
	else:
		shootMode="shoot"


func _on_virtual_joystick_dx_joystick_released() -> void:
	await get_tree().create_timer(shootDelay).timeout
	Input.action_press(shootMode)
	Input.action_release(shootMode)
