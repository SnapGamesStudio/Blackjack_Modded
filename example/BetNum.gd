extends Label

var future_value = 0
var button_clicked
var hold = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button_clicked:
		if Input.is_action_pressed("lmb"):
			$"../../../../../money click".play()
			Event.bets += 10
	text = str(Event.bets)



func minus():
	Event.bets -= 10


func plus():
	if Input.is_action_pressed("lmb"):
		$"../../../../../money click".play()
		Event.bets += 10 * Event.boss_beaten
	$"../../../../../money click".play()
	Event.bets += 10 * Event.boss_beaten


func _on__pressed():
	button_clicked = true



func _on__focus_exited():
	#button_clicked = true
	pass

func _on__focus_entered():
	pass

func _on__mouse_entered():
	button_clicked = true


func _on__mouse_exited():
	button_clicked = false
