extends ColorRect


func _ready() -> void:
	GameEvents.connect('correct_note', self, 'correctflash')
	GameEvents.connect('wrong_note', self, 'wrongflash')
	
	
func correctflash():
	$AnimationPlayer.play('CorrectFlash')


func wrongflash():
	$AnimationPlayer.play('WrongFlash')
