extends Node2D

export (PackedScene) var note
export (int, 'Mode Lines', 'Mode Spaces', 'Mode All') var mode := 0
export (float) var timer_time := 2.0
export (float, 0.0, 0.1) var speedscale := 0.0075

var note_list: PoolStringArray = ['Do','Re','Mi', 'Fa', 'Sol', 'La', 'Si']
var created_notes = []


func _ready():
	randomize()
	GameEvents.connect("select_button_pressed", self, 'on_button_selected')
	$Timer.wait_time = timer_time
	

func _process(delta: float) -> void:
	if created_notes:
		if created_notes[0].global_position.x <= 0:
			GameEvents.emit_signal('wrong_note')
			remove_note_from_list()
			
	#speedup spawn time time by time
	$Timer.wait_time -= speedscale * delta


func spawn_note():
	var n = note.instance()
	created_notes.append(n)
	if mode == 1: # if is in mode space, ignore b note, else continue normal.
		n.note_name = note_list[randi() % (note_list.size() - 1)]
	else:
		n.note_name = note_list[randi() % note_list.size()]
	n.global_position = $SpawnLines.set_spawn_location(n.note_name, mode)
	get_parent().add_child(n)
	

func _on_spawntimer_timeout() -> void:
	spawn_note()


func on_button_selected(button_name):
	if created_notes:
		if button_name == created_notes[0].note_name:
			GameEvents.emit_signal('correct_note')
			remove_note_from_list()
		else:
			GameEvents.emit_signal('wrong_note')
			

func remove_note_from_list():
	created_notes[0].self_destruct()
	created_notes.pop_front()


func _on_option_selected(index: int) -> void:
	mode = index
