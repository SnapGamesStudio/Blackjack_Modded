extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func card_selected(card):
	pass




func _on_card_pile_ui_card_clicked(card):
	print("cardname  ", card.card_data.nice_name)
	if card.card_data.nice_name == "Double":
		#Event.can_use_select_random_discard_card_ability = true
		Event.hand_value = Event.hand_value * 2
	if card.card_data.nice_name == "Split":
		#Event.can_use_select_random_discard_card_ability = true
		Event.hand_value = Event.hand_value / 2
	if card.card_data.nice_name == "Bust Block":
		#Event.can_use_select_random_discard_card_ability = true
		Event.hand_value += 3
	if card.card_data.nice_name == "Reroll":
		Event.hand_value = 0
		$".."._on_discard_hand_button_pressed()
		$".."._on_draw_3_button_pressed()
	if card.card_data.nice_name == "Black Joker":
		Event.hand_value = 0
		Event.has_double = true
		#Event.can_use_select_random_discard_card_ability = true
