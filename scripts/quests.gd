extends Node

var quests = []
var count_active_quests = 0


func AddQuest(quest: String):
	count_active_quests += 1
	quests.append(quest)
	pass
