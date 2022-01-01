extends CanvasLayer


func _ready() -> void:
	$Menu.visible = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed('pause'):
		get_tree().paused = not get_tree().paused
		$Menu.visible = not $Menu.visible
