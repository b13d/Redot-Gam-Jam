extends Node

class_name Quest

enum Quests {cheeses, winDragon}

var status
var count
var cost
var target_count

@export var quest := ""
@export var questsEnum: Quests 

func _ready() -> void:
	pass

func DestoyQuestItem(node: Node2D):
	node.queue_free()
	
	if get_child_count() == 1:
		Globals.completedQuests.append(quest)
	pass
