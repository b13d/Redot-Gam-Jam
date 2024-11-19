extends Area2D

var isDialog: bool = false
var current_index := 0
var isQuestGot: bool
var isQuestReady: bool
var currentIdQuest: int
var maxIndex: int 

@onready var label = $Dialog/BackgroundText/Label
@onready var ui = $"../UI"
@onready var labelCounter = $Dialog/LabelCounter

@export var targetToComplete: String
@export var questText = ""
@export var quest: Quest
@export var texts: Array[String]


func _ready() -> void:
	maxIndex = texts.size() - 1
	$CPUParticles2D.visible = false
	$Dialog.visible = false
	labelCounter.text = "1 / " + str(texts.size())
	label.text = texts[current_index]
	pass # Replace with function body.


func _process(delta: float) -> void:
	if IsTaskReady():
		$CPUParticles2D.visible = true
	
	if Input.is_action_just_pressed("use") and isDialog:
			if not isQuestReady:
				Dialog()
				QuestPaths()

func IsTaskReady() -> bool:
	if Globals.completedQuests.has(targetToComplete):
		return true
	else:
		return false

func QuestPaths() -> void:
	if quest.questsEnum == Quest.Quests.cheeses:
		if Globals.cheeses == 3 and isQuestGot:
			labelCounter.visible = false
			label.text = "Ооо, сынок, ты собрал все кусочки сырааа"
			Globals.cheeses = 0
			ui.labelCheeses.text = "0"
			$CPUParticles2D.visible = false
			Globals.RemoveQuest(currentIdQuest)
			ui.RefreshQuests()
			isQuestReady = true
	
	if quest.questsEnum == Quest.Quests.winDragon:
		if Globals.playerWinDragon:
			labelCounter.visible = false
			isQuestReady = true
			print("Мышенок победитель!!")
			label.text = "Ты ЭТО СДЕЛАЛ МЫШОНОК!!"
		pass
	pass

func Dialog() -> void:
	current_index += 1
			
	if current_index > maxIndex:
		current_index = 0
	
	if current_index == maxIndex and not isQuestGot:
		isQuestGot = true
		currentIdQuest = Globals.idQuest
		Globals.idQuest += 1
		Globals.AddQuest(questText)
		ui.RefreshQuests()
	
	label.text = texts[current_index]
	labelCounter.text = str(current_index + 1) + " / " + str(texts.size())
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not isQuestReady:
		$Dialog.visible = true
		isDialog = true
	pass # Replace with function body.

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Dialog.visible = false
		isDialog = false

		current_index = 0
		label.text = texts[current_index]
	pass # Replace with function body.
