extends StaticBody2D

@onready var panel: Panel = $Panel


func hit():
	Global.score += 1
	queue_free()
