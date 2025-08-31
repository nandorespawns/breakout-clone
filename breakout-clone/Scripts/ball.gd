extends CharacterBody2D

var speed = 300
var is_active = false
var direction: Vector2 = Vector2.UP
var gainspeed: int = 10
@onready var direction_change: Timer = $directionchange
@onready var hit: AudioStreamPlayer = $Hit
@onready var hit_brick: AudioStreamPlayer = $hit_brick


func _ready() -> void:
	Global.ball = self

func _physics_process(delta: float) -> void:
	if is_active:
		var collision = move_and_collide(direction * speed * delta)
		var change_angle = deg_to_rad(30)
		
		if collision:
			var direction_angle = rad_to_deg(direction.angle())
			if collision.get_collider().name == "walls":
				direction = direction.bounce(collision.get_normal()).normalized()
				hit.pitch_scale = (randf_range(0.7, 0.9))
				hit.play()
			if collision.get_collider().has_method("hit"):
				direction = direction.bounce(collision.get_normal()).normalized()
				hit_brick.pitch_scale = randf_range(0.85, 1)
				hit_brick.play()
				collision.get_collider().hit()
				speed += gainspeed
			if collision.get_collider().name == "ceiling":
				direction = direction.bounce(collision.get_normal()).normalized()
				hit.pitch_scale = (randf_range(0.7, 0.9))
				hit.play()
				collision.get_collider().reduce_player()
			#testing getting direction from player
			if collision.get_collider().is_class("CharacterBody2D"):
				var player_direction = collision.get_collider().direction
				hit.pitch_scale = randf_range(0.8,1.2)
				hit.play()
				
				if player_direction == 1 and direction_change.is_stopped():
					if direction_angle >= 0 and direction_angle <= 90:
						direction = Vector2.from_angle(deg_to_rad(-45))
						#print(rad_to_deg(direction.angle()))
					else:
						direction_change.start()
						direction = -direction.rotated(change_angle)
						#print(rad_to_deg(direction.angle()))
				elif player_direction == -1 and direction_change.is_stopped():
					if direction_angle >= 90:
						direction = Vector2.from_angle(deg_to_rad(-135))
						#print(rad_to_deg(direction.angle()))
					else:
						direction_change.start()
						direction = -direction.rotated(-change_angle)
						#print(rad_to_deg(direction.angle()))
				else:
					direction = direction.bounce(collision.get_normal()).normalized()
					#print(rad_to_deg(direction.angle()))
			direction_angle = rad_to_deg(direction.angle())
			if direction_angle >= 165 or direction_angle <= -165:
				direction = Vector2.from_angle((deg_to_rad(-150)))
				#print(rad_to_deg(direction.angle()))
			elif direction_angle <= 15 and direction_angle >= -15:
				direction = Vector2.from_angle(deg_to_rad(-30))
				#print(rad_to_deg(direction.angle()))
		
	
	
