extends StaticBody2D

@onready var panel: Panel = $Panel


func hit():
	queue_free()
