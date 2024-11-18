extends Area2D

var can_take: bool = false 

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if can_take and Input.is_action_just_pressed("use"):
		queue_free()
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_take = true
		pass


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_take = false
		pass
