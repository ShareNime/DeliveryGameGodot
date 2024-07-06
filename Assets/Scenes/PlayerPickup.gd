extends State
class_name PlayerPickup
@export var playerScript : PlayerScript
@export var animatedSprite : AnimatedSprite2D
@export var audioPlayer : AudioStreamPlayer2D
var pickupSoundPath : String =  "res://Assets/SFX/box-take.mp3"
func Enter():
	print("Now in Pickup State")
	animatedSprite.play("take-box")
	audioPlayer.stream = load(pickupSoundPath)
	audioPlayer.play()
	pass
	
func Exit():
	pass
	
func Update(delta : float):
	
	pass
	
func Physics_Update(_delta : float):
	pass


func _on_animated_sprite_2d_animation_finished():
	if animatedSprite.animation == "take-box":
		playerScript.itemTaken = playerScript.availableItems.pick_random()
		print("Player Take " + playerScript.itemTaken)
		playerScript.isBringItem = true
		playerScript.bubbleNode.show()
		playerScript.itemSprite.play(playerScript.itemTaken.to_lower())
		Transitioned.emit(self, "Idle")
	pass # Replace with function body.
