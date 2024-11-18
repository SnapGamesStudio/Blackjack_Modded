extends CardDropzone

@export var hp := 30

@onready var label = $Label

func _ready():
	label.text = "%s" % hp

func card_ui_dropped(card_ui : CardUI):
	if card_pile_ui:
		if hp < 0:
			death()
		hit()
		texture_animation()
		label_animation()
		Event.card_deleted.emit(card_ui)
		#get_parent().mana -= card_ui.card_data.cost
		hp -= card_ui.card_data.power
		label.text = "%s" % hp
		card_pile_ui.set_card_pile(card_ui, CardPileUI.Piles.discard_pile)

func can_drop_card(card_ui : CardUI):
	return card_ui.card_data.type == "Attack"
	#return card_ui.card_data.type == "Attack" and get_parent().mana >= card_ui.card_data.cost

func texture_animation():
	var tween = create_tween()
	var texture = get_node("Texture")
	tween.tween_property(texture, "scale", Vector2(0.885,0.885), .1)
	tween.tween_property(texture, "scale", Vector2(1,1), .1)
	
func label_animation():
	var tween = create_tween()
	var texture = get_node("Texture")
	tween.tween_property(label, "scale", Vector2(1.3,1.3), .1)
	tween.tween_property(label, "scale", Vector2(1,1), .1)

func death():
	var tween = create_tween()
	var texture = get_node("Texture")
	tween.tween_property(texture, "modulate", Color(0.365,0.365,0.365), .1)
	hide()
	tween.tween_property(texture, "modulate", Color(1,1,1), .1)
	
func hit():
	var tween = create_tween()
	var texture = get_node("Texture")
	tween.tween_property(texture, "modulate", Color(0.365,0.365,0.365), .1)
	tween.tween_property(texture, "modulate", Color(1,1,1), .1)
