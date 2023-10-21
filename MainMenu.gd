extends Control


func _ready():
	pass 

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://World 1.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Option.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Credits.tscn")
