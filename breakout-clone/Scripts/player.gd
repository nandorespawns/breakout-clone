extends CharacterBody2D

var yposition: int = 570
const SPEED :int = 500

func _ready() -> void:
	Global.player = self

func _physics_process(_delta: float) -> void:
	var direction = Input.get_axis("move_left","move_right")
	velocity.x = direction * SPEED 
	move_and_slide()
	
	position.y = yposition
	
