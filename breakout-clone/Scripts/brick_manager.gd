extends Node

const BRICK = preload("res://Scenes/brick.tscn")

var default_x_1 = 30
var default_y_1 = 91
var brick_width = 56
var brick_separation_y = 13

func _ready() -> void:
	
	for column in range(8):
		for row in range(9):
			var new_brick = BRICK.instantiate()
			new_brick.position.x = default_x_1 + (brick_width * row)
			new_brick.position.y = default_y_1 + (brick_separation_y * column)
			add_child(new_brick)
			var new_brick_style = StyleBoxFlat.new()
			if column < 2:
				new_brick_style.bg_color = Color(0.98, 0, 0.01, 1)
			elif column < 4:
				new_brick_style.bg_color = Color(1, 0.66, 0, 1)
			elif column < 6:
				new_brick_style.bg_color = Color(0, 0.98, 0.23, 1)
			else:
				new_brick_style.bg_color = Color(0.90, 1, 0.05, 1)
			new_brick.panel.add_theme_stylebox_override("panel", new_brick_style)
		
	
