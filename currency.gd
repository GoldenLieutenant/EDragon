extends Node

var currency_amount = 0
var currency_label: Label

func _ready():
	currency_label = get_node("/root/World 1/Zach/Camera2D/CurrencyNode/CurrencyAmount")
	if currency_label:
		currency_label.scale.x = 0.5
		currency_label.scale.y = 0.5
	else:
		print("CurrencyAmount Label not found!")
	update_currency_label()

func update_currency_label():
	if currency_label:
		currency_label.text = "Drakes: " + str(currency_amount)

func add_currency(amount: int):
	currency_amount += amount
	update_currency_label()

func subtract_currency(amount: int):
	currency_amount = max(0, currency_amount - amount)
	update_currency_label()
