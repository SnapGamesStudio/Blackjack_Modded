extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_settings_pressed():
	visible = !visible


func _on_music_toggled(toggled_on):
	if toggled_on:
		Event.music_on = true
		print("music on")
	else:
		Event.music_on = false
		
func _on_shine_effect_toggled(toggled_on):
	if toggled_on:
		print("shine on")

