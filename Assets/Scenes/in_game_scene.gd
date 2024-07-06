extends Node2D
@export var timerLabel : Label
@export var gameTimer : Timer
var availableItems : Array[String] = ["Apple", "Banana", "Cherry","Pineapple"]
@export var NPCs : Array[NPC]
@export var player : PlayerScript
@export var pausePanel : Control
# Called when the node enters the scene tree for the first time.
func _ready():
	for npc in NPCs:
		npc.requestedItem = availableItems.pick_random()
		npc.itemLoaded.emit()
		availableItems.erase(npc.requestedItem)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		get_tree().paused = true
		pausePanel.show()
	timerLabel.text = str(int(gameTimer.time_left))
	pass



func _on_timer_timeout():
	print("GAME FINISH!")
	player.emit_signal("gameOverSignal")
	if Score.currScore > Score.highScore:
		Score.highScoreUpdated.emit()
		print("HIGH SCORE!")
	else:
		Score.noHighScore()
	pass # Replace with function body.
