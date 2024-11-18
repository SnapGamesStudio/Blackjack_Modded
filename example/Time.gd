extends Label

var hours = 0
var minutes = 0
var seconds = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $"../../../..".visible:
		$"../Timer".stop()
	if seconds == 60:
		minutes += 1
		seconds = 0
	if minutes == 60:
		hours += 1
		minutes = 0
	text = str(hours,":",minutes,":",seconds)
func _on_timer_timeout():
	seconds += 1
