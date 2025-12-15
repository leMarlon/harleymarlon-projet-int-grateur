extends Node

var player_current_attack = false
var found_oldman_item = false
var given_oldman_item = false
var quest_begun = false
var obtained_pickaxe = false
var breakboulder = false

var legend_sword = false

var current_scene = "world"
var transition_scene = false

var player_exit_cliffside_posx = 771.0
var player_exit_cliffside_posy = 126.0

var player_start_posx = 89.0
var player_start_posy = 112.0

var player_enter_bossmap_posx = 126.0
var player_enter_bossmap_posy = 333.0

var player_exit_bossmap_posx = 1050.0
var player_exit_bossmap_posy = 320.0



var transitionto_cliff = false
var transitionto_bossmap = false
var transitionto_world = false
var game_first_loadin = true
var game_outof_cliffside = false
var game_outof_boss = false

func finish_changescenes(new_scene: String):
	transition_scene = false

	current_scene = new_scene

	transitionto_cliff = false
	transitionto_bossmap = false
	transitionto_world = false
