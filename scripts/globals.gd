extends Node

var quests := []
var count_active_quests := 0
var cheeses := 0
var idQuest := 0
var playerWinDragon := false
@export var completedQuests := []


func _ready() -> void:
	pass 

func AddQuest(quest: String):
	count_active_quests += 1
	quests.append(quest)
	pass
	
func RemoveQuest(id: int):
	count_active_quests -= 1
	quests.remove_at(id)
	completedQuests.remove_at(id)
	pass
