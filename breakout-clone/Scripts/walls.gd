extends Node2D

func _on_failzone_body_entered(body: Node2D) -> void:
	body.is_active = false
	Global.lives -= 1
	
