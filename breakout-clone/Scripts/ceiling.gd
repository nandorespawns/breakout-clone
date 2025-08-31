extends StaticBody2D


func reduce_player():
	
	if Global.paddle_size >= 30:
		Global.paddle_size -= 4
		Global.paddle_position_x += 2
		Global.paddle_shape_height -= 4
	
