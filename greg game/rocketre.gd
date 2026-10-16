extends Node2D

var fixe = false
var config = ConfigFile.new()
var err = config.load("user://Greg.cfg")

var we = false
func _on_area_2d_area_entered(_area: Area2D) -> void:
	if we == false:
		we = true
	else:
		return
	$RichTextLabel.text = '[font=res://asest/rocketre.ttf][font_size=16][color="fff"][outline_size=4][outline_color=000][shake rate=3.0 level=5 connected=0]can you please fix me somehow'
	$AnimationPlayer.play("new_animation")
func _ready() -> void:
	if config.get_value("things", "rocketre", false) == true:
		$Rocketre.play("still")
func _repair():
	if fixe == false:
		fixe = true
	else:
		return
	$RichTextLabel.text = ''
	$Rocketre.play("new_animation")

func _on_rocketre_animation_finished() -> void:
	if $Rocketre.animation=="new_animation":
		$Rocketre.play("talk")
		$AnimationPlayer.speed_scale=0.5
		$RichTextLabel.text = '[font=res://asest/rocketre.ttf][font_size=16][color="fff"][outline_size=4][outline_color=000][shake rate=3.0 level=5 connected=0]me oh my thank you thank you you two thank you if you ever need to get out of here id be glad to help actually i dont think you can go anywhere else maybe you can though im not sure anyways yeah'
		$AnimationPlayer.play("talkRepaired")
		await get_tree().create_timer(2.5).timeout
		$AnimationPlayer.speed_scale=1
		$RichTextLabel.text = ''
		$Rocketre.play("still")
		await get_tree().create_timer(0.5).timeout
		$Rocketre.play("talk")
		$RichTextLabel.text = '[font=res://asest/rocketre.ttf][font_size=16][color="fff"][outline_size=4][outline_color=000][shake rate=3.0 level=5 connected=0]thank you.'
		$AnimationPlayer.play("talkRepaired")
		await get_tree().create_timer(0.5).timeout
		$Rocketre.play("still")
		await get_tree().create_timer(2).timeout
		$RichTextLabel.text = ''
