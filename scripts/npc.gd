extends Area2D

var is_dialog: bool = false
var current_index := 0
var quest = ""
var is_quest_got: bool

@onready var label = $Dialog/BackgroundText/Label
@onready var ui = $"../UI"

@export var id_quest: int = 0 
@export var MAX_INDEX: int 
@export var texts: Array[String]

func _ready() -> void:
	quest = Quests.quests[id_quest]
	$Dialog.visible = false
	label.text = texts[current_index]
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and is_dialog:
		current_index += 1
		
		if current_index > MAX_INDEX:
			current_index = 0
		
		if current_index == MAX_INDEX and not is_quest_got:
			is_quest_got = true
			ui.add_quest(quest)
			Quests.count_active_quests += 1
		
		label.text = texts[current_index]
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Dialog.visible = true
		is_dialog = true
	pass # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Dialog.visible = false
		is_dialog = false

		current_index = 0
		label.text = texts[current_index]
	pass # Replace with function body.
