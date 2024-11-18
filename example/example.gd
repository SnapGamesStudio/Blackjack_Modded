extends Node2D


@onready var card_pile_ui := $CardPileUI
@onready var dropzones := [
	$CanvasLayer/Store/Store/MarginContainer/VBoxContainer/CardDropzone2,
	$CanvasLayer/Store/Store/MarginContainer/VBoxContainer/CardDropzone
]

func _ready():
	Event.boss_beaten = 1
	Event.boss_bank_to_beat = 100
	Event.bets = 5
	Event.bet_min = 5
	Event.hand_card_count = 0
	Event.cards_used = 0
	
	randomize()
func _process(delta):
	#if Input.is_action_just_pressed("ui_down"):
		#Event.bank += 24599200090
	#if Input.is_action_just_pressed("ui_up"):
		#_on_reset_button_pressed()
	#if Input.is_action_just_pressed("ui_right"):
		#$CanvasLayer/CardCount.visible = !$CanvasLayer/CardCount.visible
	#if Input.is_action_just_pressed("ui_left"):
		#$CanvasLayer/bets.visible = !$CanvasLayer/bets.visible
	pass
	
func _get_rand_joker():
	return "Black Joker" if randi_range(0, 1) else "Red Joker"


func _on_draw_button_pressed():
	card_pile_ui.draw(1)


func _on_draw_3_button_pressed():
	card_pile_ui.draw(2)


func _on_sort_button_pressed():
	card_pile_ui.sort_hand(func(a, b): 
		if a.card_data.suit == b.card_data.suit:
			return a.card_data.value < b.card_data.value
		else:
			return a.card_data.suit < b.card_data.suit
	)


func _on_discard_random_button_pressed():
	Event.can_use_select_random_discard_card_ability = false
	var hand_pile_size = card_pile_ui.get_card_pile_size(CardPileUI.Piles.hand_pile)
	if hand_pile_size:
		var random_card_in_hand = card_pile_ui.get_card_in_pile_at(CardPileUI.Piles.hand_pile, randi() % hand_pile_size)
		card_pile_ui.set_card_pile(random_card_in_hand, CardPileUI.Piles.discard_pile)
func _on_add_joker_to_hand_button_pressed():
	card_pile_ui.create_card_in_pile(_get_rand_joker(), CardPileUI.Piles.hand_pile)


func _on_add_joker_to_discard_button_pressed():
	card_pile_ui.create_card_in_pile(_get_rand_joker(), CardPileUI.Piles.discard_pile)


func _on_random_discard_to_hand_button_pressed():
	Event.can_use_select_random_discard_card_ability = false
	var discard_pile_size = card_pile_ui.get_card_pile_size(CardPileUI.Piles.discard_pile)
	if discard_pile_size:
		var random_card_in_discard = card_pile_ui.get_card_in_pile_at(CardPileUI.Piles.discard_pile, randi() % discard_pile_size)
		card_pile_ui.set_card_pile(random_card_in_discard, CardPileUI.Piles.hand_pile)


func _on_reset_button_pressed():
	$click.play()
	card_pile_ui.reset()


func _on_discard_hand_button_pressed():
	for card_ui in card_pile_ui.get_cards_in_pile(CardPileUI.Piles.hand_pile):
		card_pile_ui.set_card_pile(card_ui, CardPileUI.Piles.discard_pile)


#func _on_add_joker_to_dropzones_button_pressed():
	#for dropzone in dropzones:
		#card_pile_ui.create_card_in_dropzone(_get_rand_joker(), dropzone)
		


#func _on_move_from_dropzone_to_pile_button_pressed():
	#for dropzone in dropzones:
		#var top_card_in_dropzone = dropzone.get_top_card()
		#if top_card_in_dropzone:
			#card_pile_ui.set_card_pile(top_card_in_dropzone, CardPileUI.Piles.discard_pile)


func _on_remove_rand_card_in_hand_from_game_pressed():
	var hand_pile_size = card_pile_ui.get_card_pile_size(CardPileUI.Piles.hand_pile)
	if hand_pile_size:
		var random_card_in_hand = card_pile_ui.get_card_in_pile_at(CardPileUI.Piles.hand_pile, randi() % hand_pile_size)
		card_pile_ui.remove_card_from_game(random_card_in_hand)









func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_surrender_pressed():
	pass # Replace with function body.


func _on_add_joker_to_dropzones_button_pressed():
	for dropzone in dropzones:
		$CanvasLayer/Store/CardPileUI.create_card_in_dropzone(_get_rand_joker(), dropzone)




func _on_restart_pressed():
	get_tree().reload_current_scene()



func _on_leaderboard_pressed():
	if !$CanvasLayer/LeaderboardUI.visible:
		$CanvasLayer/LeaderboardUI.show()
	else:
		$CanvasLayer/LeaderboardUI.hide()
