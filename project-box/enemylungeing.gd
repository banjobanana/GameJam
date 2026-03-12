extends Enemy

var playerPos
var direction
var idle
const SPEED = 700.0
const JUMP_VELOCITY = -40.0
const MOVESPEED = 400
@onready var rc_right: RayCast2D = $RayCast2D2
@onready var rc_left: RayCast2D = $RayCast2D3
@onready var timer: Timer = $Timer
@onready var timer_left: Timer = $TimerLeft
@onready var timer_right: Timer = $TimerRight


func _physics_process(delta: float) -> void:
 
	if not is_on_floor():
		velocity += get_gravity() * delta

	if rc_right.get_collider()!=null:
		idle=false
		if rc_right.get_collider().name=="Player":
			direction=1
			playerPos=rc_right.get_collider().position
	elif rc_left.get_collider()!=null:
		idle=false
		if rc_left.get_collider().name=="Player":
			direction=-1
			playerPos=rc_left.get_collider().position	
	else:
		idle=true
		#timer_left.start()
		if timer_left.time_left>0:
			direction=-1
			velocity.x = direction * MOVESPEED
			#timer_right.start()
		elif timer_right.time_left>0:
			direction=1
			velocity.x = direction * MOVESPEED

	if direction and !timer.time_left>0 and !idle:
		velocity.x = direction * SPEED
		velocity.y = JUMP_VELOCITY
		timer.start()
		direction=0
	elif direction and idle:
		velocity.x = direction * MOVESPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
