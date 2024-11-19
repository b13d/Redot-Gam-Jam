extends Control

@export var playerTexts := []
@export var dragonTexts := []

@export var labelPlayer: Label
@export var labelDragon: Label

var indexText := 0

var indexDragonText := 1
var indexPlayerText := 0
 

func _ready() -> void:
	labelDragon.text = dragonTexts[0]
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if indexPlayerText >= 3:
		print("Запуск заставки, полета дракона вверх")
		return
	
	if indexText == 0 or indexText == 2 or indexText == 5:
		labelPlayer.text = playerTexts[indexPlayerText]
		indexPlayerText += 1
	else:
		labelDragon.text = dragonTexts[indexDragonText]
		indexDragonText += 1
		
	indexText += 1
	pass # Replace with function body.
