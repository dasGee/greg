extends Node2D
@export var air: bool = false
@export var airCount: int = 10
@export var colli: CollisionShape2D
func _ready() -> void: #im sorry
	$Area2D/CollisionShape2D.global_position = colli.global_position
	$player/CollisionShape2D.global_position = colli.global_position
	$Area2D/CollisionShape2D.shape = colli.shape
	$player/CollisionShape2D.shape = colli.shape
	$Square.scale = $player/CollisionShape2D.shape.extents*0.5
	$Square.global_position = colli.global_position
	$PointLight2D.scale = $player/CollisionShape2D.shape.extents
	$PointLight2D.global_position = colli.global_position
	$Square.self_modulate = get_tree().current_scene.waterColors
	$Square2.scale = $player/CollisionShape2D.shape.extents*2
	$Square2.global_position = colli.global_position
	$TextureRect.custom_minimum_size = $player/CollisionShape2D.shape.extents*2
	$TextureRect.global_position = colli.global_position-Vector2(2,2)
	colli.queue_free()
	if get_tree().current_scene.water == true:
		$Square2.queue_free()
	if air == false:
		$PointLight2D.queue_free()
		$TextureRect.queue_free()
	else:
		$Area2D.gravity=1505.128
	
func _physics_process(_delta: float):
	if $player.has_overlapping_areas():
		if air == false:
			g.inwater = true
		else:
			if g.water <= 1000:
				g.inwater = false
				g.water += airCount
	pass
