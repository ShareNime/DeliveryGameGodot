extends CharacterBody2D
class_name PlayerScript

@export var bubbleNode : CanvasItem
@export var itemSprite : AnimatedSprite2D
@export var staminaBar : ProgressBar
@export var scoreLabel : Label
var isBringItem : bool = false
var playerMoveSpeed : int = 75
var playerSprintSpeed : int = 150

var playerCurrMoveSpeed : int
# Get the gravity from the project settings to be synced with RigidBody nodes.
var canInteract : bool = false
var npcEnterRequested : String = "None"
var availableItems : Array[String] = ["Apple", "Banana", "Cherry","Pineapple"]
var itemTaken : String
var isPickupPlace : bool = false
var playerStamina : float = 100

signal gameOverSignal

var points : int:
	set(value):
		points = value
		scoreLabel.text = "Score : " + str(points)
		Score.currScoreUpdated.emit(points)

const GRAVITY = 200.0

func _ready():
	scoreLabel.text = "Score : 0"
	playerCurrMoveSpeed = playerMoveSpeed
	pass

func _process(delta):
	staminaBar.value = playerStamina
	
	pass
	
