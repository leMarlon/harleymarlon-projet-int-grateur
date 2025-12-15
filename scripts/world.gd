extends Node2D


@onready var pause_menu = $CanvasLayer/Control

var paused = false


func _ready():
	pause_menu.hide()

	if global.game_first_loadin == true:
		global.game_outof_cliffside = false
		global.game_outof_boss = false
		$player.position = Vector2(global.player_start_posx, global.player_start_posy)

	elif global.game_outof_cliffside == true:
		global.game_outof_cliffside = false
		$player.position = Vector2(global.player_exit_cliffside_posx, global.player_exit_cliffside_posy)

	elif global.game_outof_boss == true:
		global.game_outof_boss = false
		$player.position = Vector2(global.player_exit_bossmap_posx, global.player_exit_bossmap_posy)

	
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
		global.transitionto_cliff = true
		global.transitionto_bossmap = false

		
		


func _on_cliffside_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false
		
		
		
func _on_boss_transition_body_entered(body):
	if body is Player:
		print("ENTER boss transition")
		global.transition_scene = true
		global.transitionto_bossmap = true
		global.transitionto_cliff = false




func _on_boss_transition_body_exited(body):
	if body is Player:
		print("EXIT boss transition")
		global.transition_scene = false

		

		
func change_scene():
	if not global.transition_scene:
		return

	if global.current_scene != "world":
		return

	var next_scene := ""
	var next_scene_name := ""

	if global.transitionto_cliff:
		next_scene = "res://scenes/cliff_side.tscn"
		next_scene_name = "cliff_side"
	elif global.transitionto_bossmap:
		next_scene = "res://scenes/boss_map.tscn"
		next_scene_name = "boss_map"

	if next_scene != "":
		global.transition_scene = false
		global.game_first_loadin = false
		global.finish_changescenes(next_scene_name)

		get_tree().change_scene_to_file(next_scene)




		
