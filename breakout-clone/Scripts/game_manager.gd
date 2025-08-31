extends Node

const BALL = preload("res://Scenes/ball.tscn")
const PLAYER = preload("res://Scenes/player.tscn")
var player = PLAYER.instantiate()
var ball = BALL.instantiate()

var player_spawn_x = 257
var player_spawn_y = 570

var ball_spawn_y = 550


const GAME_OVER = preload("res://Scenes/game_over.tscn")
var game_over = GAME_OVER.instantiate()

const UI = preload("res://Scenes/ui.tscn")
var ui = UI.instantiate()

func _ready() -> void:
	add_child(player)
	player.position.x = player_spawn_x
	player.position.y = player_spawn_y
	
	add_child(ball)
	
	add_child(ui)
	
	add_child(game_over)
	game_over.visible = false

func _process(delta: float) -> void:
	
	if ball.is_active == false:
		ball.position.x = player.position.x
		ball.position.y = ball_spawn_y
		ball.direction = Vector2.UP
		shoot_ball()
	
	ui.get_child(1).text = str(Global.score)
	ui.get_child(3).text = str(Global.highscore)
	ui.get_child(5).text = str(Global.lives)
	
	end_game()
	
func shoot_ball():
	var shoot = Input.is_action_pressed("shoot_ball")
	if shoot:
		ball.is_active = true

func end_game():
	if Global.lives <= 0:
		game_over.visible = true
		get_tree().paused = true
		
		
		game_over.get_child(4).text = str(Global.score)
		game_over.get_child(5).text = str(Global.highscore)
		
		var game_reset = Input.is_action_just_pressed("game_reset")
		if game_reset:
			get_tree().change_scene_to_file("res://Scenes/game.tscn")
			Global.score = 0
			Global.lives = 3
			
			Global.paddle_size = 97
			Global.paddle_position_x = -48
			Global.paddle_shape_height = 97
			
	else:
		get_tree().paused = false
		game_over.visible = false
