extends "res://example/example__card_ui.gd"


@onready var Double_texture = preload("res://assets/Double.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Frontface.texture = Double_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update()
	#tween.start()

func _on_button_pressed():
	if card_data.nice_name == "Double":
		Event.has_double = true
	hide()
	print(card_data.nice_name)

func update():
	print(card_data.nice_name)
	if card_data.nice_name == "Double":
		$Frontface.texture = preload("res://assets/Double.png")
	else:
		$Frontface.texture = preload("res://assets/card_clubs_02.png")
