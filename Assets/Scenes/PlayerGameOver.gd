extends State
class_name PlayerGameOver
@export var playerScript : PlayerScript
@export var animatedSprite : AnimatedSprite2D

func Enter():
	print("Now in Gameover State")
	animatedSprite.play("idle")
	pass
	
func Exit():
	pass
	
func Update(delta : float):
	
	pass
	
func Physics_Update(_delta : float):
	pass
