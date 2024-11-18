extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Event.bank > 8000000000000000000:
		Event.bank = 0
		Event.over += 1
	if Event.over != 0:
		text = str(Event.bank, " LV", Event.over)
	else:
		text = str("$",Event.bank)
