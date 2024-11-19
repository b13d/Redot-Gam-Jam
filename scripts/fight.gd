extends Node

@onready var progressBar: ProgressBar = $"../UIBossFight/ProgressBar"
@onready var player: Player = $"../Player"

const TIMETOATTACK = 1.25
const TIMETOANSWER = 2.25

var timeToAttack := TIMETOATTACK
var waitAnswer := TIMETOANSWER
var waiting := false
var currentKey = ""
var inputEvent = InputEvent.new

enum NameKey {H, J, K, Y}



func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
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
	timeToAttack -= delta
	
	if timeToAttack <= 0 and not waiting:
		timeToAttack = randf_range(1, TIMETOATTACK)
		currentKey = getKey()
		
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
	
	reset()
	pass

func reset() -> void:
	waiting = false
	waitAnswer = randf_range(1, TIMETOANSWER)
	currentKey = ""
	timeToAttack = randf_range(1, TIMETOATTACK)
	
	pass
