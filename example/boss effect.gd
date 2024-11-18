extends Label

var boss_abilities = ["no_abilities", "", ""]
var can_BOSS_EFFECT
# Called when the node enters the scene tree for the first time.
func _ready():
	Event.boss_has_been_beaten.connect(abilites)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if Event.boss_beaten > 7:
		#can_BOSS_EFFECT = true
	#if can_BOSS_EFFECT == true:
		#var ability = boss_abilities.pick_random()
		#if ability == "no_abilities":
			#Event.abilites_ban = true
		#else:
			#Event.abilites_ban = false
func abilites():
	print("boss_abilite_check")
	if Event.boss_beaten > 6:
		can_BOSS_EFFECT = true
	else:
		can_BOSS_EFFECT = false
	if can_BOSS_EFFECT == true:
		var ability = boss_abilities.pick_random()
		print(ability)
		text = str(ability)
		if ability == "no_abilities":
			Event.abilites_ban = true
		else:
			Event.abilites_ban = false
	else:
		Event.abilites_ban = false
