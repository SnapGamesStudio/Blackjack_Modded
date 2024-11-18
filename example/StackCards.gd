extends PanelContainer

@onready var Multiply_Card = preload("res://card packs/multiply.tscn")
@onready var Five_Card_Charlie = preload("res://card packs/five_card_charlie.tscn")
@onready var Perfect_Pair = preload("res://card packs/perfect_pair.tscn")
@onready var Dealer_Reveal = preload("res://card packs/dealer_reveal.tscn")
@onready var Lucky_Streak = preload("res://card packs/lucky_streak.tscn")

var has_perfect_pair_card = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Event.special_card_in_use.connect(add_card)
	Event.perfect_pair.connect(perfect_pair)
	Event.bank = 10
	Event.hand_value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Event.abilites_ban == false:
		check()
		check_card_count()
		check_cardss()
	else:
		has_perfect_pair_card = false
		$"../CardCount/HBoxContainer/DealersHandValue".hide()
		
	
func check_cards_on_stand():
	var cards = $MarginContainer/HBoxContainer.get_children()
	for card in cards:
		print("stackCard / ",card.card_data.nice_name)
		if card.card_data.nice_name == "Multiply":
			print("Multiply")
			Event.bets = Event.bets * 2
func check():
	var cards = $MarginContainer/HBoxContainer.get_children()
	if cards != null:
		for card in cards:
			card.button.disabled = true
			print(card.card_data.nice_name, " in use / ", card.in_use)
			print("check")
			if card.card_data.nice_name == "Dealer Reveal":
				print("show_dealer_reveal")
				$"../CardCount/HBoxContainer/DealersHandValue".show()
			if card.card_data.nice_name != "Dealer Reveal":
				print("hide_dealer_reveal")
				$"../CardCount/HBoxContainer/DealersHandValue".hide()
func check_cardss():
	#print("stackCard / ",card.card_data.nice_name)
	var cards = $MarginContainer/HBoxContainer.get_children()
	if cards != null:
		for card in cards:
			card.button.disabled = true
			print(card.card_data.nice_name, " in use / ", card.in_use)
			print("check")
			if card.card_data.nice_name == "Five Card Charlie":
				#$"../CardCount/HBoxContainer/DealersHandValue".hide()
				print(Event.hand_card_count)
				if Event.hand_card_count == 5:
					print("Five Card Charlie")
					Event.bank += 3000
					$"../../win".play()
					$"../.."._on_discard_hand_button_pressed()
			if card.card_data.nice_name == "Perfect Pair":
				#$"../CardCount/HBoxContainer/DealersHandValue".hide()
				has_perfect_pair_card = true
			if card.card_data.nice_name != "Perfect Pair":
				#$"../CardCount/HBoxContainer/DealersHandValue".hide()
				has_perfect_pair_card = false
				print("does not have perfect")
			if card.card_data.nice_name == "Lucky Streak":
				#$"../CardCount/HBoxContainer/DealersHandValue".hide()
				if Event.winning_streak == 3:
					print("Lucky_Streak_Used")
					Event.bank += 600 * Event.boss_beaten
					Event.winning_streak = 0
	if cards == null:
		$"../CardCount/HBoxContainer/DealersHandValue".visible = false
		print("dealer_has_no_card")
		has_perfect_pair_card = false
		print("does not have perfect")
func perfect_pair():
	if has_perfect_pair_card == true:
		print("perfect_pair")
		Event.bank += 9000
		$"../../win".play()
		$"../.."._on_discard_hand_button_pressed()

func check_card_count():
	var card_count = $MarginContainer/HBoxContainer.get_child_count()
	Event.stack_card_count = card_count
	
func add_card(card_name, in_use):
	if !in_use:
		delete_card(card_name)
	if Event.stack_card_count > 4: return
	print("addCard / ", card_name, in_use)
	if in_use:
		print("card_stack / ", "add")
		if card_name == "Multiply":
			print("added")
			var M_card = Multiply_Card.instantiate()
			$MarginContainer/HBoxContainer.add_child(M_card)
		if card_name == "Five Card Charlie":
			var _card = Five_Card_Charlie.instantiate()
			$MarginContainer/HBoxContainer.add_child(_card)
		if card_name == "Perfect Pair":
			var _card = Perfect_Pair.instantiate()
			$MarginContainer/HBoxContainer.add_child(_card)
		if card_name == "Dealer Reveal":
			var _card = Dealer_Reveal.instantiate()
			$MarginContainer/HBoxContainer.add_child(_card)
		if card_name == "Lucky Streak":
			var _card = Lucky_Streak.instantiate()
			$MarginContainer/HBoxContainer.add_child(_card)
			
		pass
	else:
		delete_card(card_name)


func delete_card(card_name):
	var cards = $MarginContainer/HBoxContainer.get_children()
	for card in cards:
		if card.card_data.nice_name == card_name:
			for i in 1:
				#card.call_deferred("queue_free")
				card.queue_free()
				print("card_stack_delete / ", card.card_data, " / ", card_name)
				return
	
