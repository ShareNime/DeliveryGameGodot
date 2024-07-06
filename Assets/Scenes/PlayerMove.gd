extends State
class_name PlayerMove
@export var playerScript : PlayerScript
@export var animatedSprite : AnimatedSprite2D
@export var staminaDecreaseTimer : Timer
@export var audioPlayer : AudioStreamPlayer2D
var stepSoundPath : String =  "res://Assets/SFX/step.mp3"
var isGameOver : bool = false
func Enter():
	playerScript.playerCurrMoveSpeed = playerScript.playerMoveSpeed
	print("Now in Move State")
	if(playerScript.isBringItem):
		animatedSprite.play("run-box")
	else:
		animatedSprite.play("run")
	pass
	
func Exit():
	pass
	
func Update(delta : float):
	if(playerScript.playerStamina < 100):
		playerScript.playerStamina += 25 * delta
	if Input.is_action_just_pressed("Sprint"):
		Transitioned.emit(self, "Sprint")
	if isGameOver:
		Transitioned.emit(self,"GameOver")
	pass
func Move(inputDir):
	playerScript.velocity = inputDir * playerScript.playerCurrMoveSpeed
	playerScript.velocity.y += playerScript.GRAVITY
	playerScript.move_and_slide()

func Physics_Update(delta : float):
	var inputDir = Input.get_vector("MoveLeft", "MoveRight","MoveTop", "MoveBot").normalized()
	Move(inputDir)
	PlayerFlip()
	if(inputDir.length() <= 0):
		Transitioned.emit(self, "Idle")
	pass

func PlayerFlip():
	if playerScript.velocity.x < 0:
		animatedSprite.flip_h = false
	if playerScript.velocity.x > 0:
		animatedSprite.flip_h = true


func _on_decrease_stamina_timer_timeout():
	
	pass # Replace with function body.


func _on_animated_sprite_2d_frame_changed():
	if animatedSprite.animation == "run" or animatedSprite.animation == "run-box":
		if animatedSprite.frame in [2,5]:
			audioPlayer.stream = load(stepSoundPath)
			audioPlayer.play()
	pass # Replace with function body.


func _on_character_body_2d_game_over_signal():
	isGameOver = true
	pass # Replace with function body.
