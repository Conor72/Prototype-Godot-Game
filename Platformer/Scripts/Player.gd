extends Node2D
onready var animated_sprite = $AnimatedSprite

var velocity = Vector2.ZERO
var max_run = 100
var run_accel = 800

func _process(delta):
	
	var direction = sign(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"))
	
	if direction > 0:					#If player is facing left or right change direction of sprite too
		animated_sprite.flip_h = false
		
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if direction != 0:		#If player is moving , play running sprite
		animated_sprite.play("Run")
	else:					#Else if player is not moving play Idle sprite
		animated_sprite.play("Idle")
	
	
	velocity.x = move_toward(velocity.x, max_run * direction, run_accel * delta)
	global_position.x += (velocity.x * delta)
	
