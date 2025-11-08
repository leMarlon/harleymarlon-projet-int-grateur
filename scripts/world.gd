extends Node2D


@onready var pause_menu = $CanvasLayer/Control

var paused = false


func _ready():
	pause_menu.hide()
	if global.game_first_loadin == true:
		global.game_outof_cliffside = false
		$player.position.x = global.player_start_posx
		$player.position.y = global.player_start_posy
	elif global.game_outof_cliffside == true:
		$player.position.x = global.player_exit_cliffside_posx
		$player.position.y = global.player_exit_cliffside_posy
	
func _process(delta):
	change_scene()
	if Input.is_action_just_pressed("esc"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		get_tree().paused = false
		pause_menu.hide()
	else:
		pause_menu.show()
		get_tree().paused = true
	paused = !paused


func _on_cliffside_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		print("The player came back to the world")
		


func _on_cliffside_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false
		
func change_scene():
	if global.transition_scene and global.current_scene == "world":
		global.finish_changescenes()
		global.game_first_loadin = false
		
		get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
		
