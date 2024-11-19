extends CharacterBody2D

class_name Player

@export var isFight: bool = false

enum {left = -1, right, up}


const SPEED = 300.0
const JUMP_VELOCITY = -200.0

var dictionary = {"name": "Danila"}
var colors = Colors.new()

func _ready() -> void:
	if isFight:
		$Camera2D.enabled = false
	else:
		$Camera2D.enabled = true

func _physics_process(delta: float) -> void:
	if isFight:
		return
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if not is_on_floor():
		velocity += get_gravity() * delta

	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
