extends CharacterBody2D

var y_position: int = 570
const SPEED :int = 500
var direction

@onready var paddle: Panel = $paddle
@onready var paddle_shape: CollisionShape2D = $paddle_shape




func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	direction = Input.get_axis("move_left","move_right")
	velocity.x = direction * SPEED 
	
	#handles when the paddle hits the wall
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var obj_name = collision.get_collider().name
		if obj_name == "walls":
			direction = 0.0
	
	#print(direction)
	move_and_slide()
	
	update_paddle()
	
	
	position.y = y_position
	
	
	

func update_paddle():
	paddle.size.x = Global.paddle_size
	paddle.position.x = Global.paddle_position_x
	paddle_shape.shape.height = Global.paddle_shape_height
