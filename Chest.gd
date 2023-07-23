extends Area2D

const Currency = preload("res://currency.gd")
var currency_system: Currency
var collision_occurred = false

func _ready():
	# Get the instance of the Currency script attached to the node "CurrencySystem"
	currency_system = get_node("/root/World 1/Zach/Camera2D/CurrencyNode")
	if not currency_system:
		print("CurrencySystem node not found or Currency script not attached!")
	else:
		print("CurrencySystem node found!")
		# Now you can call functions or access variables from the Currency script instance

func _on_body_entered(body):
	print("100 drakes obtained")
	# Call the function directly from the instance, you don't need to create a new instance here
	currency_system.add_currency(100)
	if !collision_occurred:
		collision_occurred = true
	queue_free()
