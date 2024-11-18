extends Control

var player_name
var score = 1

@onready var leaderboard_scene = preload("res://addons/silent_wolf/Scores/Leaderboard.tscn")

func _on_button_pressed():
	var inputtext = $LineEdit.text
	player_name = inputtext
	SilentWolf.Scores.save_score(player_name, score)
	get_tree().change_scene_to_packed(leaderboard_scene)
