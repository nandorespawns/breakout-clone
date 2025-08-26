extends RigidBody2D

const SPEED :int  = 300

func _ready() -> void:
	
	linear_velocity = Vector2(SPEED, -SPEED)

func _physics_process(delta: float) -> void:
	print(linear_velocity)
