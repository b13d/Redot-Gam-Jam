extends Node

@onready var progressBar: ProgressBar = $"../UIBossFight/ProgressBar"
@onready var player: Player = $"../Player"

const TIMETOATTACK := 1.25
const TIMETOANSWER := 1.25
const MIN_VALUE := 0.65

var timeToAttack := TIMETOATTACK
var waitAnswer := TIMETOANSWER
var waiting := false
var currentKey = ""
var inputEvent = InputEvent.new
@export var isWin := false

enum NameKey {H, J, K, Y}



func _ready() -> void:
	randomize()
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if isWin:
		return
	
	if event is InputEventKey and event.is_pressed() and currentKey != "":
		if waiting:
			if currentKey == event.as_text_keycode():
				attack()
			else:
				damage()
		else:
			print("here")
			damage()
	pass

func _process(delta: float) -> void:
	if isWin:
		return
	
	timeToAttack -= delta
	
	if timeToAttack <= 0 and not waiting:
		%UIBossFight.get_node("AnimationPlayerButton").play("show")
		timeToAttack = randf_range(MIN_VALUE, TIMETOATTACK)
		currentKey = getKey()
		%UIBossFight.get_node("TextureRect/LabelKey").text = currentKey
		
		print("currentKey: " + currentKey)
	
	if waiting:
		waitAnswer -= delta
		
		if waitAnswer <= 0:
			damage()
	pass

func damage() -> void:
	if progressBar.value > 0:
		player.translate(Vector2(-20,0))
		progressBar.value -= 10
		
	reset()	
	%UIBossFight.get_node("AnimationPlayer").play("damage")
	%UIBossFight.RemoveHealth()
	print("damage")
 
func getKey() -> String:
	waiting = true
	
	var random = randi_range(0, 3)
	return NameKey.find_key(random)
	pass

func attack() -> void:
	player.translate(Vector2(20,0))
	progressBar.value += 10
	print("attack")
	%UIBossFight.get_node("AnimationPlayer").play("attack")
	
	reset()
	
	if progressBar.value == 100:
		isWin = true
		%UIBossFight.visible = false
		$"../FinalDialog".visible = true
		print("Победа!")

func reset() -> void:
	%UIBossFight.get_node("AnimationPlayerButton").play("hide")
	waiting = false
	waitAnswer = randf_range(MIN_VALUE, TIMETOANSWER)
	currentKey = ""
	timeToAttack = randf_range(MIN_VALUE, TIMETOATTACK)
	
	pass
