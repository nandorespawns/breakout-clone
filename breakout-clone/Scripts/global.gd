extends Node

var score: int = 0
var highscore: int = 0

var lives : int = 3


#player modifiable attributes
var paddle_size = 97
var paddle_position_x = -48
var paddle_shape_height = 97

var ball : Node2D = null


func _process(delta: float) -> void:
	if score >= highscore:
		highscore = score
