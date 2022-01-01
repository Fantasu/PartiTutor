extends Label

var points := 0 setget set_point


func _ready() -> void:
	GameEvents.connect('correct_note', self, 'add_point')
	GameEvents.connect('wrong_note', self, 'remove_point')
	
	
func set_point(newvalue):
	points = newvalue
	self.text = String(points)
	
	
func add_point():
	self.points += 1
	
	
func remove_point():
	self.points -= 1
