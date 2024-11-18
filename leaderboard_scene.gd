extends Control

@onready var line_edit = $HBoxContainer/LineEdit


var score = Event.bank
var player_name:String

func _on_line_edit_text_submitted(new_text):
	Global.player_name = line_edit.text
	player_name = Global.player_name
	Global.score = Event.bank
	print(player_name)


func _on_submit_b_pressed():
	await Leaderboards.post_guest_score("blackjackmodded-black-jack-modd-vyOu", Event.last_bank_value,line_edit.text)
	get_tree().reload_current_scene()


func _on_exit_pressed():
	hide()
