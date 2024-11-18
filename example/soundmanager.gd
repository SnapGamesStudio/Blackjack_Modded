extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Event.music_on == true:
		$"../AudioStreamPlayer".volume_db = -12.18
	else:
		$"../AudioStreamPlayer".volume_db = -80
	
