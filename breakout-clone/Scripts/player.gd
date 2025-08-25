extends CharacterBody2D


const SPEED :int = 500

func _physics_process(_delta: float) -> void:
	var direction = Input.get_axis("move_left","move_right")
	velocity.x = direction * SPEED 
	move_and_slide()
	
	
