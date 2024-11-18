extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func check_cards():
	var cards = $HBoxContainer.get_children()
	for card in cards:
		if card.in_use == true:
			print("card in inventory_in_use")
			
			cards.pop_front()
