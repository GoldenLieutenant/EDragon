extends Control

var max_hp = 100
var current_hp = max_hp

var hp_bar: TextureRect

var full_hp_width = 100.0  # Change this value to match the width of the full HP bar in your texture

func _ready():
	# Find the TextureRect node during the _ready() function
	hp_bar = get_node("/root/World 1/Zach/Camera2D/Control/TextureRect")
	update_hp_bar(max_hp)

# Function to update the HP bar
func update_hp_bar(new_hp):
	current_hp = clamp(new_hp, 0, max_hp)
	var percentage = current_hp / max_hp
	hp_bar.rect_scale.x = percentage
