extends Control

@export var texts := []
@onready var label := $TextureRect/Label 
@export var currentIndexText := 0
func _ready() -> void:
	visible = false
	label.text = texts[currentIndexText]

func _process(delta: float) -> void:
	pass
