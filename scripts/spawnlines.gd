extends Node2D

enum Types {Line, Space, Both}


onready var Spaces = [
	$DoSpace,
	$ReSpace,
	$MiSpace,
	$FaSpace,
	$SolSpace,
	$LaSpace,
]

onready var Lines = [
	$DoLine,
	$ReLine,
	$MiLine,
	$FaLine,
	$SolLine,
	$LaLine,
	$SiLine,
]

onready var SpaceAndLines = [
	$DoLine,
	$DoSpace,
	$ReLine,
	$ReSpace,
	$MiLine,
	$MiSpace,
	$FaLine,
	$FaSpace,
	$SolLine,
	$SolSpace,
	$LaLine,
	$LaSpace,
	$SiLine,
]

func _ready():
	randomize()
	
	
func set_spawn_location(note_name: String, LineSpaceOrBoth: int) -> Vector2:
	var note_pos
	
	match note_name:
		'Do':
			if LineSpaceOrBoth == 0:
				note_pos = Lines[0]
			elif LineSpaceOrBoth == 1:
				note_pos = Spaces[0]
			else:
				note_pos = SpaceAndLines[randi() % 2]
		'Re':
			if LineSpaceOrBoth == 0:
				note_pos = Lines[1]
			elif LineSpaceOrBoth == 1:
				note_pos = Spaces[1]
			else:
				note_pos = SpaceAndLines[randi() % 2 + 2]
		'Mi':
			if LineSpaceOrBoth == 0:
				note_pos = Lines[2]
			elif LineSpaceOrBoth == 1:
				note_pos = Spaces[2]
			else:
				note_pos = SpaceAndLines[randi() % 2 + 4]
		'Fa':
			if LineSpaceOrBoth == 0:
				note_pos = Lines[3]
			elif LineSpaceOrBoth == 1:
				note_pos = Spaces[3]
			else:
				note_pos = SpaceAndLines[randi() % 2 + 6]
		'Sol':
			if LineSpaceOrBoth == 0:
				note_pos = Lines[4]
			elif LineSpaceOrBoth == 1:
				note_pos = Spaces[4]
			else:
				note_pos = SpaceAndLines[randi() % 2 + 8]
		'La':
			if LineSpaceOrBoth == 0:
				note_pos = Lines[5]
			elif LineSpaceOrBoth == 1:
				note_pos = Spaces[5]
			else:
				note_pos = SpaceAndLines[randi() % 2 + 10]
		'Si':
			note_pos = Lines[6]
	
	
	return note_pos.global_position
