extends Label

var time := 0.0 setget set_timer


func _process(delta: float) -> void:
	self.time += delta
	
	
func set_timer(newtime):
	time = newtime
	var hours = int(time / 3600) % 24
	var minutes = int(time / 60) % 60
	var seconds = int(time) % 60
	
	var formatedtime = ("%02d" % hours) + (":%02d" % minutes) + (":%02d" % seconds)
	self.text = String(formatedtime)
