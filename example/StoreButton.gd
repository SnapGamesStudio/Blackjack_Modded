extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_animation():
	await get_tree().create_timer(1).timeout
	$"../../../../Notification".play()

	var tween = create_tween()
	tween.tween_property(self, "modulate", Color("#FF4747"), .1)
	
	tween.tween_property(self, "modulate", Color.WHITE, 1)
