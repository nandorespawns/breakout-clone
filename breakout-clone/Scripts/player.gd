extends CharacterBody2D

var y_position: int = 570
const SPEED :int = 300
var direction


func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	direction = Input.get_axis("move_left","move_right")
	velocity.x = direction * SPEED 
	move_and_slide()
	
	position.y = y_position
	#print(direction)
	

func apply_direction():
	print("1")
