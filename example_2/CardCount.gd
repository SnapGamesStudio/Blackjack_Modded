extends Control

var hand_to_beat
@onready var label = $HBoxContainer/Label
# Called when the node enters the scene tree for the first time.
func _ready():
	hand_to_beat = Event.ai_hand_value.pick_random()
	Event.card_deleted.connect(card_deleted)
	Event.card_drawn.connect(card_drawn_to_hand)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("winning_streak", Event.winning_streak)
	Event.hand_to_beat = hand_to_beat
	if Input.is_action_just_pressed("ui_accept"):
		print("bet",Event.bet_min)
		_on_stand_pressed()
	print("hand_to_beat", hand_to_beat)
	label.text = str(Event.hand_value)
	if Event.hand_value > 21:
		Event.winning_streak = 0
		hand_to_beat = Event.ai_hand_value.pick_random()
		if $"../../lose".playing == false:
			$"../../lose".play()
		Event.bank -= Event.bets
		Event.bets = Event.bet_min
		$"../.."._on_discard_hand_button_pressed()
		Event.hand_value = 0
		
func card_deleted(card):
	if !Event.hand_value < 1:
		print(card.card_data.value)
		Event.hand_value -= card.card_data.value
	
func card_drawn_to_hand(card):
	if card.card_data.nice_name == Event.last_card_drawn:
		Event.perfect_pair.emit()
	Event.last_card_drawn = card.card_data.nice_name
	print("lastcard / ", Event.last_card_drawn)
	print(card.card_data.value)
	Event.hand_value += card.card_data.value


func _on_stand_pressed():
	$AnimationPlayer2.play("bounce 3")
	$"../../click".play()
	if Event.hand_value >= hand_to_beat:
		$"../StackCards".check_cards_on_stand()
		Event.bank += Event.bets
		Event.bets = Event.bet_min
		print("won")
		Event.winning_streak += 1
		$"../.."._on_discard_hand_button_pressed()
		hand_to_beat = Event.ai_hand_value.pick_random()
		Event.hand_value = 0
		$"../end".text = "winner"
		if $"../../win".playing == false:
			$"../../win".play()
	else:
		Event.winning_streak = 0
		Event.bank -= Event.bets
		Event.bets = Event.bet_min
		$"../.."._on_discard_hand_button_pressed()
		print("hand reset")
		hand_to_beat = Event.ai_hand_value.pick_random()
		Event.hand_value = 0
		$"../end".text = "loser"
		if $"../../lose".playing == false:
			$"../../lose".play()





func _on_surrender_pressed():
	$"../.."._on_discard_hand_button_pressed()
	Event.hand_value = 0
	Event.bank -= Event.bets / 2
