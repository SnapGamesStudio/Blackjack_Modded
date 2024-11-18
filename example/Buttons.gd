extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Event.can_use_select_random_discard_card_ability == true:
		$HBoxContainer/RandomDiscardToHandButton.visible = true
		
	else:
		$HBoxContainer/RandomDiscardToHandButton.visible = false
