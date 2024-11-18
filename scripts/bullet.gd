extends RigidBody2D

func _ready() -> void:
	linear_velocity.x = randi_range(100, 300)
	pass

func _process(delta) -> void:
	pass
