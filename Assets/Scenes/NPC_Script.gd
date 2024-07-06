extends AnimatedSprite2D

class_name NPC

@export var requestedItem : String
@export var bubbleNode : CanvasItem
@export var itemSprite : AnimatedSprite2D
signal itemLoaded
# Called when the node enters the scene tree for the first time.
func _ready():
	itemLoaded.connect(loadBuble)
		
	pass # Replace with function body.

func loadBuble():
	bubbleNode.show()
	itemSprite.play(requestedItem.to_lower())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is PlayerScript:
		body.canInteract = true
		body.npcEnterRequested = requestedItem
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body is PlayerScript:
		body.canInteract = false
		body.npcEnterRequested = "None"
	pass # Replace with function body.
