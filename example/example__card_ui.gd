extends CardUI
var SHINE_TIME = 2.0
@onready var sprite = $Frontface
@onready var label := $Frontface/Label


func _ready():
	super()
	label.text = card_data.nice_name

