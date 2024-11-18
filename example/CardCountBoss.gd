extends Control
var hand_to_beat
@onready var label = $Label
# Called when the node enters the scene tree for the first time.
func _ready():
	hand_to_beat = Event.ai_hand_value.pick_random()
	Event.card_drawn.connect(card_drawn_to_hand)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_on_stand_pressed()
	print("hand_to_beat", hand_to_beat)
	label.text = str(Event.hand_value)
	if Event.hand_value >= 21:
		Event.self_health -= 5
		if $"../../lose".playing == false:
			$"../../lose".play()
		Event.bank -= Event.bets
		if $AnimationPlayer.current_animation != "bounce 2":
			$AnimationPlayer.play("bounce 2")
		Event.bets = 0
		$"../.."._on_discard_hand_button_pressed()
		Event.hand_value = 0
func card_drawn_to_hand(card):
	print(card.card_data.value)
	if $AnimationPlayer.current_animation != "bounce":
		$AnimationPlayer.play("bounce")
	Event.hand_value += card.card_data.value


func _on_stand_pressed():
	$AnimationPlayer2.play("bounce 3")
	$"../../click".play()
	if Event.hand_value >= hand_to_beat:
		Event.bank += Event.bets
		Event.bets = 0
		if $AnimationPlayer.current_animation != "bounce 2":
			$AnimationPlayer.play("bounce 2")
		Event.boss_health -= Event.hand_value
		print("won")
		$"../.."._on_discard_hand_button_pressed()
		hand_to_beat = Event.ai_hand_value.pick_random()
		Event.hand_value = 0
		$"../end".text = "winner"
		if $"../../win".playing == false:
			$"../../win".play()
	else:
		Event.self_health -= 5
		Event.bank -= Event.bets
		Event.bets = 0
		if $AnimationPlayer.current_animation != "bounce 2":
			$AnimationPlayer.play("bounce 2")
		$"../.."._on_discard_hand_button_pressed()
		print("hand reset")
		hand_to_beat = Event.ai_hand_value.pick_random()
		Event.hand_value = 0
		$"../end".text = "loser"
		if $"../../lose".playing == false:
			$"../../lose".play()



