extends Control

signal rotate_image
@onready var button: Button = $Button
@onready var texture: TextureRect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotate_image.connect(rotateImage)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func rotateImage():
	texture.scale *= 2
	pass

func _on_button_pressed() -> void:
	rotate_image.emit()
	pass # Replace with function body.
