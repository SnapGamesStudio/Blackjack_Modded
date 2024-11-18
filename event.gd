extends Node

#region normal
signal boss_has_been_beaten
signal special_card_in_use(card, in_use)
signal perfect_pair
signal card_deleted(card:CardUI)
signal card_drawn(card: CardUI)

var hand_value = 0

var ai_hand_value = [14,12,10,15,18,17,20]

signal card_selected(card)

var can_use_select_random_discard_card_ability = false

var abilites_ban = false

var bets = 10

var bank = 20

var damage = 0

var boss_health = 900
var self_health = 500

var has_double = false

var music_on = true
var boss_beaten = 1
var boss_bank_to_beat = 100

var bet_min = 5

var hand_card_count = 0
var cards_used = 0

var last_card_drawn = null

var hand_to_beat =0

var stack_card_count = 0
var last_bank_value
var over = 0
var ai_over = 0

var winning_streak = 0

#endregion

var turn = false

signal update_card_count
