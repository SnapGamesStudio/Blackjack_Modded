extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	$"../TextureRect".hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		var tween = create_tween()
		tween.tween_property(self, "modulate", Color(1,1,1,1), 1)
		$"../TextureRect".show()
