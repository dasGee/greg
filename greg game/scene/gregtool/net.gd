extends itemer

var b1=load("res://scene/enemy/bunny.tscn")
var b2
const fast=0.575
var playing = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
func _process(_delta: float):
	if playing==true:
		$Node/Line2D2.set_point_position(7,($shootsprite/Marker2D.global_position))
func _physics_process(_delta):
	$".." / ".." / "marker".global_position = $Marker2D.global_position
	if Input.is_action_just_pressed("shoot2"):
		bnuy(Vector2(-25,-50),false)
		await get_tree().create_timer(0.1).timeout
		if randi_range(0,1)==1:
			bnuy(Vector2(0,-75),true)
		else:
			bnuy(Vector2(0,-75),false)
		await get_tree().create_timer(0.1).timeout
		bnuy(Vector2(25,-50),true)
			
	if Input.is_action_just_pressed("shoot"):
		if playing == false:
			playing = true
			g.lock = true
			#anc.yes = false
			shot()
			$AnimationPlayer.play("lunge")
		else:
			$Node/Line2D2.visible = false
			$shootsprite.play("new_animation")
			playing = false
			$AnimationPlayer.play("RESET")
			g.lock = false
			get_parent().get_parent().speedmuilt -= fast

func shot():
	$Node/Line2D2.visible = true
	#im sorry for this one but i was too lazy
	$Node/Line2D2.set_point_position(0,$shootsprite/Marker2D.global_position)
	$Node/Line2D2.set_point_position(1,$shootsprite/Marker2D.global_position)
	$Node/Line2D2.set_point_position(2,$shootsprite/Marker2D.global_position)
	$Node/Line2D2.set_point_position(3,$shootsprite/Marker2D.global_position)
	$Node/Line2D2.set_point_position(4,$shootsprite/Marker2D.global_position)
	$Node/Line2D2.set_point_position(5,$shootsprite/Marker2D.global_position)
	$Node/Line2D2.set_point_position(6,$shootsprite/Marker2D.global_position)
	$Node/Line2D2.set_point_position(7,$shootsprite/Marker2D.global_position)
	$shootsprite.play("default")
	$Timer.start()
	get_parent().get_parent().speedmuilt += fast

func bnuy(wawa:Vector2,beng:bool):
	if g.scrap>=3:
		g.scrap-=3
		b2=b1.instantiate()
		b2.global_position = global_position+wawa
		if beng==true:
			b2.startdirect = 1
		b2.tempor=true
		get_tree().current_scene.add_child(b2)
		$Netspawn.pitch_scale=randf_range(0.5,1.5)
		$Netspawn.play()

func _on_timer_timeout() -> void:
	$Node/Line2D2.remove_point(0)
	$Node/Line2D2.add_point(($shootsprite/Marker2D.global_position))


func _on_wooden_net_spin_finished() -> void:
	$WoodenNetSpin.pitch_scale=randf_range(0.35,0.55)
