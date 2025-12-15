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
	if global.transition_scene and global.current_scene == "world":
		var next_scene := ""

		if global.transitionto_cliff:
			print("hehehehe")
			next_scene = "res://scenes/cliff_side.tscn"
		elif global.transitionto_bossmap:
			print("HEHEHEH")
			next_scene = "res://scenes/boss_map.tscn"

		if next_scene != "":
			global.game_first_loadin = false
			global.finish_changescenes()
			get_tree().change_scene_to_file(next_scene)


		
