extends Button


func _ready():
	self.connect("pressed", self, "button_pressed")
	
	
func button_pressed() -> void:
	GameEvents.emit_signal("select_button_pressed", self.text)
