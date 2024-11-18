extends Control

@export var max_card_packs = 1
@onready var card_pack = preload("res://card packs/King.tscn")
var card_names = ["Double", "Double"]

@onready var dropzones := [
	$Store/MarginContainer/VBoxContainer/PanelContainer/CardDropzone
]
# Called when the node enters the scene tree for the first time.
func _ready():
	Event.boss_has_been_beaten.connect(repopulate_card_packs)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("ui_cancel"):
		#visible = !visible
	pass
#func add_cards_data():
	#var cards = $Store/MarginContainer/VBoxContainer.get_children()
	#for card in cards:
		#var Name = card_names.pick_random()
		#print(Name)
		##card.card_data = ResourceLoader.load(json_data.resource_script_path).new()
		##for key in json_data.keys():
			##if key != "texture_path" and key != "backface_texture_path" and key != "resource_script_path":
				##card.card_data[key] = json_data[key]
		##card.card_data = CardUIData.new()
		#card.card_data.nice_name = Name
		#print(card.card_data.nice_name)
#
##func _get_card_data_by_nice_name(nice_name : String):
	##for json_data in card_database:
		##if json_data.nice_name == nice_name:
			##return json_data
	##return null

func repopulate_card_packs():
	$"../TopRightButtons/HBoxContainer/StoreButton".update_animation()
	#$"../../Notification".play()
	for i in max_card_packs:
		var card_pack_scene = card_pack.instantiate()
		$Store/MarginContainer/ScrollContainer/VBoxContainer2/VBoxContainer.add_child(card_pack_scene)
	
func _on_store_button_pressed():
	$"../../openShop".play()
	visible = !visible
