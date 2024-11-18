extends Control

var clicked = false
@export var cards_in_deck: Array
@onready var ani: AnimationPlayer = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		_on_button_pressed()


func _on_button_pressed():
	if clicked == false:
		$GPUParticles2D.emitting = true
		clicked = true
		$"../../../../../../../../unbox".play()
		$Shine.hide()
		ani.play("Clicked")
		await ani.animation_finished
		$GPUParticles2D.emitting = false
		await pick_card()
		queue_free()

func pick_card():
	
	var card = cards_in_deck.pick_random()
	var card_scene = card.instantiate()
	
	var inventory = $"../../Inventory/HBoxContainer"
	#card_scene.scale = Vector2(3,3)
	$"../../Inventory/HBoxContainer".add_child(card_scene)
	#get_parent().add_child(card_scene)
	#add_to_stack(card)

#func add_to_stack(card):
	#var stack_size = $"../../../../../../StackCards/MarginContainer/HBoxContainer".get_child_count()
	#if stack_size > 3: return
	#var card_scene = card.instantiate()
	#
	#var inventory = $"../../Inventory/HBoxContainer"
	#
	#$"../../../../../../StackCards/MarginContainer/HBoxContainer".add_child(card_scene)
