extends CanvasLayer

@onready var nothing_label = $BoxContainer/Label

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Quests.count_active_quests == 0:
		nothing_label.text = "Нету активных квестов"
	else:
		nothing_label.text = "Квесты:" 

func add_quest(text: String) -> void:
	var new_label = Label.new()
	new_label.text = text
	$BoxContainer.add_child(new_label)
	pass
	
