extends Control

var mainGameScenePath : String = "res://Assets/Scenes/in_game_scene.tscn"
@export var highScoreLabel : Label
@export var tutorialPanel : Control
# Called when the node enters the scene tree for the first time.
func _ready():
	highScoreLabel.text = "High Score: " + str(Score.highScore)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_now_button_pressed():
	get_tree().change_scene_to_file(mainGameScenePath)
	pass # Replace with function body.


func _on_how_to_play_button_pressed():
	tutorialPanel.show()
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_exit_button_pressed():
	tutorialPanel.hide()
	pass # Replace with function body.
