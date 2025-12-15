extends Node2D

@onready var pause_menu = $CanvasLayer/Control

var paused = false

func _ready():
	pause_menu.hide()
	$player.position = Vector2(global.player_enter_bossmap_posx, global.player_enter_bossmap_posy)

	
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

func _on_exit_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = true
		print(global.transition_scene, "Transition has been made.")


func _on_exit_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		global.transition_scene = false
		
		
		
func change_scene():
	if global.transition_scene and global.current_scene == "boss_map":
		global.transitionto_world = true
		global.finish_changescenes()
		global.game_outof_boss = true
		get_tree().change_scene_to_file("res://scenes/world.tscn")
