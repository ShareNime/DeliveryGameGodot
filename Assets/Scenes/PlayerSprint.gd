extends State
class_name PlayerSprint
@export var playerScript : PlayerScript
@export var animatedSprite : AnimatedSprite2D
@export var staminaDecreaseTimer : Timer
@export var sprintParticle : ParticleProcessMaterial
@export var sprintParticleNode : GPUParticles2D
@export var audioPlayer : AudioStreamPlayer2D
var stepSoundPath : String =  "res://Assets/SFX/step.mp3"
var isSprint : bool = false
var isGameOver : bool = false
func Enter():
	playerScript.playerCurrMoveSpeed = playerScript.playerSprintSpeed
	print("Now in Move State")
	sprintParticleNode.emitting = true
	if(playerScript.isBringItem):
		animatedSprite.play("run-box")
	else:
		animatedSprite.play("run")
	pass
	
func Exit():
	sprintParticleNode.emitting = false
	pass
	
func Update(delta : float):
	playerScript.playerStamina -= 50 * delta
	#playerScript.playerStamina -= delta * 1
	if Input.is_action_just_released("Sprint"):
		Transitioned.emit(self, "Move")
	if playerScript.playerStamina <= 0:
		Transitioned.emit(self, "Move")
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
		sprintParticle.emission_shape_offset.x = 12
		sprintParticle.gravity.x = 60
	if playerScript.velocity.x > 0:
		animatedSprite.flip_h = true
		sprintParticle.emission_shape_offset.x = -12
		sprintParticle.gravity.x = -60
		


func _on_decrease_stamina_timer_timeout():
	
	pass # Replace with function body.


func _on_animated_sprite_2d_frame_changed():
	if (animatedSprite.animation == "run" or animatedSprite.animation == "run-box") and sprintParticleNode.emitting:
		if animatedSprite.frame in [1,3,5]:
			audioPlayer.stream = load(stepSoundPath)
			audioPlayer.play()
	pass # Replace with function body.


func _on_character_body_2d_game_over_signal():
	isGameOver = true
	pass # Replace with function body.
