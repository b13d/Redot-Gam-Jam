extends Node2D

var seconds = 1
@export var bullet: PackedScene
const LIMIT: int = 200



func _process(delta: float) -> void:
	seconds -= delta
	
	if seconds <= 0:
		seconds = 1
		spawn()
	pass

func spawn() -> void:
	var new_bullet = bullet.instantiate()
	var new_position = Vector2(randi_range(-LIMIT,LIMIT),randi_range(-LIMIT,LIMIT))
	new_bullet.position = new_position
	add_child(new_bullet)
	pass
