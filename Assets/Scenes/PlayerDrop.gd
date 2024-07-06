extends State
class_name PlayerDrop
@export var playerScript : PlayerScript
@export var animatedSprite : AnimatedSprite2D
@export var audioPlayer : AudioStreamPlayer2D
var dropSoundPath : String = "res://Assets/SFX/box-drop.mp3"
func Enter():
	print("Now in Drop State")
	animatedSprite.play("drop-box")
	print("MINTA " + playerScript.npcEnterRequested)
	if(playerScript.npcEnterRequested == playerScript.itemTaken):
		playerScript.points += 1;

		print(playerScript.npcEnterRequested + " Sama " + playerScript.itemTaken + " Points: " + str(playerScript.points))
	playerScript.itemTaken = "None"
	pass
	
func Exit():
	pass
	
func Update(delta : float):
	
	pass
	
func Physics_Update(_delta : float):
	pass


func _on_animated_sprite_2d_animation_finished():
	if animatedSprite.animation == "drop-box":
		playerScript.isBringItem = false
		playerScript.bubbleNode.hide()
		Transitioned.emit(self, "Idle")
	pass # Replace with function body.

func _on_animated_sprite_2d_frame_changed():
	if animatedSprite.animation == "drop-box" and animatedSprite.frame == 3:
		audioPlayer.stream = load(dropSoundPath)
		audioPlayer.play()
	pass # Replace with function body.
