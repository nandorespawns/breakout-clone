extends CharacterBody2D

var speed = 300
var is_active = true
var direction: Vector2 = Vector2.DOWN

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if is_active:
		var collision = move_and_collide(direction * speed * delta)
		if collision:
			direction = direction.bounce(collision.get_normal()).normalized()
	
	
