extends Node2D

@export var gameOverPanel : Panel
@export var gameOverScoreLabel : Label

var currScore : int = 0
var highScore : int = 0

signal currScoreUpdated(score)
signal highScoreUpdated
# Called when the node enters the scene tree for the first time.
func _ready():
	currScoreUpdated.connect(on_curr_score_updated)
	highScoreUpdated.connect(on_high_score_updated)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_curr_score_updated(new_value):
	currScore = new_value
	print("GANTI CUYYY")
func on_high_score_updated():
	highScore = currScore
	gameOverPanel.show()
	gameOverScoreLabel.text = "Score : " + str(currScore) + "\n" + "New High Score!"
func noHighScore():
	gameOverPanel.show()
	gameOverScoreLabel.text = "Score : " + str(currScore)


func _on_next_button_pressed():
	gameOverPanel.hide()
	get_tree().change_scene_to_file("res://Assets/Scenes/main_menu.tscn")
	pass # Replace with function body.
