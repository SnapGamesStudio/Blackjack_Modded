extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Event.boss_bank_to_beat > 8000000000000000000:
		Event.boss_bank_to_beat = 100
		Event.ai_over += 1
	if Event.ai_over != 0:
		text = str(Event.boss_bank_to_beat, " LV", Event.ai_over)
	else:
		text = str("$",Event.boss_bank_to_beat)
	#Event.boss_bank_to_beat = Event.boss_bank_to_beat * Event.boss_beaten
	if Event.ai_over != 0:
		if Event.over > Event.ai_over:
			if Event.bank > Event.boss_bank_to_beat:

				Event.boss_has_been_beaten.emit()
				Event.boss_beaten += 1
				print("bossBeaten / ", Event.boss_beaten)
				Event.boss_bank_to_beat = Event.boss_bank_to_beat * Event.boss_beaten
				Event.bet_min = Event.bet_min * Event.boss_beaten
	else :
		if Event.bank > Event.boss_bank_to_beat:
			Event.boss_has_been_beaten.emit()
			Event.boss_beaten += 1
			print("bossBeaten / ", Event.boss_beaten)
			Event.boss_bank_to_beat = Event.boss_bank_to_beat * Event.boss_beaten
			Event.bet_min = Event.bet_min * Event.boss_beaten
		
