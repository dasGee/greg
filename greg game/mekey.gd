extends Area2D
@export var door: Node
@export_category("enemy spawn")
@export var enemySpawn: bool
@export var enemy: String
@export var location: Marker2D
var tempE
var the = preload("res://scene/enemy/mekeyEnemy.tscn")
var thee
var do = true
func _on_area_entered(_area: Area2D):
	if do == false:
		return
	do = false
	if enemySpawn == true:
		tempE = load(enemy).instantiate()
		tempE.speed = get_tree().current_scene.manStartSpeed
		tempE.global_position = location.global_position
		get_tree().current_scene.call_deferred("add_child", tempE)
	if get_tree().current_scene.escapeMessage != "":
		g.textChanging.emit(get_tree().current_scene.escapeMessage)
	door.emit_signal("key")
	thee = the.instantiate()
	thee.global_position = global_position
	await get_tree().create_timer(0.05).timeout
	get_tree().current_scene.call_deferred("add_child", thee)
	queue_free()
