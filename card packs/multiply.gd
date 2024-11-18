extends Control

var in_use = false
@onready var button = $Button
@export var card_data : CardUIData
@export var cards_in_deck: Array
@onready var ani: AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#await animation()
	pass

func _on_button_pressed():
	in_use = !in_use
	if !in_use:
			$"../../../../../../../../CardCount/HBoxContainer/DealersHandValue".hide()
			Event.special_card_in_use.emit(card_data.nice_name, false)
			$TextureRect.hide()
	else:
		if Event.stack_card_count > 3:
			in_use = false
			return
		$"../../../../../../../../CardCount/HBoxContainer/DealersHandValue".show()
		Event.special_card_in_use.emit(card_data.nice_name, true)
		$TextureRect.show()
