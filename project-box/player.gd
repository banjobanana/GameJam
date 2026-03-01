extends CharacterBody2D
#region player variable

#constants
const RUNSPEED = 150.0
const JUMPVELOCITY = -170.0
const GRAVITY = 400
const ACCELARATION = 40
const MAXJUMPS=1

#variables
var moveSpeed=RUNSPEED
var moveDirectionX=0
var jumps=0 #number of jumps done
var facing=1

#input variables
var keyUp=false
var keyDown=false
var keyLeft =false
var keyRight=false
var keyJump=false
var keyJumpPressed=false
#nodes
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
#endregion

func _physics_process(delta: float) -> void:
	get_input_states()
	
	#movement
	HandleGravity(delta)
	HorizontalMovement()
	HandleJumping()
	
	move_and_slide()
	
	#animation changing
	HandleAnimation()
	

func get_input_states():
	keyUp = Input.is_action_pressed("Up")
	keyDown = Input.is_action_pressed("Down")
	keyLeft = Input.is_action_pressed("Left")
	keyRight = Input.is_action_pressed("Right")
	keyJump = Input.is_action_pressed("Jump")
	keyJumpPressed = Input.is_action_just_pressed("Jump")
	
	if keyRight: facing=1
	if keyLeft: facing=-1

func HorizontalMovement():
	moveDirectionX = Input.get_axis("Left","Right")
	velocity.x = move_toward(velocity.x, moveDirectionX * moveSpeed,ACCELARATION)

func HandleJumping():
	if keyJumpPressed:
		if jumps<MAXJUMPS && is_on_floor():
			velocity.y=JUMPVELOCITY

func HandleGravity(delta):
	#gravity
	if not is_on_floor():
		velocity.y+=GRAVITY*delta
	else:
		jumps=0

func HandleAnimation():
	animated_sprite_2d.flip_h = (facing<0)
	
	if is_on_floor():
		if velocity.x != 0:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
	else:
		if velocity.y < 0:
			#play jump animation
			pass
		else:
			#play fall animation
			pass
