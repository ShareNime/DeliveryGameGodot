extends State
class_name PlayerIdle
@export var playerScript : PlayerScript
@export var animatedSprite : AnimatedSprite2D

var isGameOver : bool = false
func Enter():
	print("Now in Idle State")
	if(playerScript.isBringItem):
		animatedSprite.play("idle-box")
	else:	
		animatedSprite.play("idle")
	pass
	
func Exit():
	pass
	
func Update(delta : float):
	if(playerScript.playerStamina < 100):
		playerScript.playerStamina += 25 * delta
	if(Input.get_axis("MoveLeft","MoveRight")):
		Transitioned.emit(self, "Move")
	if(Input.is_action_just_pressed("Interact") and playerScript.canInteract and playerScript.isBringItem):
		Transitioned.emit(self, "Drop")
	elif(Input.is_action_just_pressed("Interact") and playerScript.isPickupPlace and !playerScript.isBringItem):
		Transitioned.emit(self, "Pickup")
	if isGameOver:
		Transitioned.emit(self,"GameOver")
	pass
	
func Physics_Update(delta : float):
	playerScript.velocity.y += delta * playerScript.GRAVITY
	var motion = playerScript.velocity * delta
	playerScript.move_and_collide(motion)
	pass


func _on_character_body_2d_game_over_signal():
	isGameOver = true
	pass # Replace with function body.
