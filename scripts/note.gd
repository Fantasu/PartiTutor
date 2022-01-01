extends Node2D
class_name Note


var note_name: String
var speed : float = 30.0

	
func _process(delta):
	self.global_position.x -= speed * delta
		
		
func self_destruct() -> void:
	#playanimation/particle/sound
	$AnimationPlayer.play('Destroy')
