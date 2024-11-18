extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Event.bank < 1:
		show()
		$Panel.show()
	else:
		$Panel.hide()
		hide()


#func death_animation():
	#var tween = create_tween()
	#tween.tween_property($Panel, "modulate", Color(1,1,1,0), 3)
	#tween.tween_property($Panel, "modulate", Color(1,1,1,0), 3)
	#$TextureRect.show()


func _on_leaderboard_pressed():
	$"../leaderboard_scene".show()
