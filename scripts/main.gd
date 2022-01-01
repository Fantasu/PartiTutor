extends Node

export (NodePath) onready var firstbutton = get_node(firstbutton) as Button
var previus_screen = load("res://scenes/mainmenu.tscn")


func _ready() -> void:
	firstbutton.grab_focus()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed('reset'):
		get_tree().reload_current_scene()
	if event.is_action_pressed('quit'):
		get_tree().change_scene_to(previus_screen)
