extends CanvasLayer

class_name UI

@onready var nothing_label := $BoxContainer/Label
@onready var labelCheeses := $BoxContainer2/LabelCheeses

func _ready() -> void:
	if labelCheeses != null:
		labelCheeses.text = str(Globals.cheeses)

func _process(delta: float) -> void:
	if nothing_label == null:
		return
	
	if Globals.count_active_quests == 0:
		nothing_label.text = "Нету квестов"
	else:
		nothing_label.text = "Квесты:" 

func RefreshQuests() -> void:
	var children = $BoxContainer.get_children()
	for child in children:
		child.queue_free()
	
	InitialLabel()
	
	for i in Globals.quests:
		var newLabel = Label.new()
		newLabel.text = i
		$BoxContainer.add_child(newLabel)
		pass

func InitialLabel() -> void:
	var text = ""
	
	if Globals.count_active_quests == 0:
		text = "Нету квестов"
	else:
		text = "Квесты:"
	
	var newLabel = Label.new()
	newLabel.text = text
	$BoxContainer.add_child(newLabel)
	pass

func RemoveHealth() -> void:
	$HealthPlayer.remove_item($HealthPlayer.item_count - 1)
	
	if $HealthPlayer.item_count == 0:
		Engine.time_scale = 0
		$"../Loss".visible = true
		pass
