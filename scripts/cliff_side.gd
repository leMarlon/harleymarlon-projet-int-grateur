extends Node2D

@onready var pause_menu = $CanvasLayer/Control

var paused = false

func _ready():
	pause_menu.hide()
	
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		pauseMenu()
	change_scene()
		
func pauseMenu():
	if paused:
		get_tree().paused = false
		pause_menu.hide()
	else:
		pause_menu.show()
		get_tree().paused = true
	paused = !paused

func _on_cliffside_exit_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true
		print(global.transition_scene, "Transition has been made.")


func _on_cliffside_exit_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false
		
func change_scene():
	if global.transition_scene and global.current_scene == "cliff_side":
		global.transition_scene = false
		global.transitionto_world = false

		global.game_outof_cliffside = true
		global.finish_changescenes("world")

		get_tree().change_scene_to_file("res://scenes/world.tscn")
