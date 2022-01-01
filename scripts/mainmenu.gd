extends Control

var level1 = preload('res://scenes/main.tscn')
export (NodePath) onready var start_button = get_node(start_button)

func _ready() -> void:
	$NoteParticle.emitting = true
	start_button.grab_focus()


func _on_Start_pressed() -> void:
	get_tree().change_scene_to(level1)


func _on_Quit_pressed() -> void:
	get_tree().quit()
